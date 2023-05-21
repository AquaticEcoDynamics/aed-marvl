function [data,c_units,isConv,ylab] = marvl_getmodelpolylinedata_exceedance_dist(rawData,filename,shp,varname,d_data,config,def,tim,mod,var)

%[data(mod),c_units,isConv,ylab] = tfv_getmodelpolylinedata(raw(mod).data,ncfile(mod).name,all_cells(mod).X,all_cells(mod).Y,shp,{loadname},def.pdates(tim).value,isSurf,isSpherical,d_data(mod).D,clip_depth,use_matfiles);

%marvl_getmodelpolylinedata(rawData,filename,shp,varname,d_data,config,def,tim,mod)
%                          (raw(mod).data,ncfile(mod).name,shp,{loadname},d_data,config,def,tim,mod);
X=d_data.all_cellsX;
Y=d_data.all_cellsY;

timebin=def.pdates(tim).value;

isSurf=config.isSurf;
isSpherical=config.isSpherical;
clip_depth=config.clip_depth;
use_matfiles=config.use_matfiles;
Depth=d_data(mod).D;

rawGeo = tfv_readnetcdf(filename,'timestep',1);
mtime = tfv_readnetcdf(filename,'time',1);

if use_matfiles
    [rawData.(varname{1}).outdata.surface,c_units,isConv,ylab]  = tfv_Unit_Conversion(rawData.(varname{1}).outdata.surface,varname{1});
    [rawData.(varname{1}).outdata.bottom,c_units,isConv,ylab]  = tfv_Unit_Conversion(rawData.(varname{1}).outdata.bottom,varname{1});
else
   % disp(varname{1})
    [rawData.(varname{1}),c_units,isConv,ylab]  = tfv_Unit_Conversion(rawData.(varname{1}),varname{1});
end

for i = 1:length(shp)
    sdata(i,1) = shp(i).X;
    sdata(i,2) = shp(i).Y;
    
    if isSpherical
    [sdata2(i,1),sdata2(i,2)]=ll2utm(shp(i).X,shp(i).Y);
	end
end

dist(1,1) = 0;

if isSpherical
for i = 2:length(shp)
    dist(i,1) = sqrt(power((sdata2(i,1) - sdata2(i-1,1)),2) + power((sdata2(i,2)- sdata2(i-1,2)),2)) + dist(i-1,1);
end
else
    for i = 2:length(shp)
    dist(i,1) = sqrt(power((sdata(i,1) - sdata(i-1,1)),2) + power((sdata(i,2)- sdata(i-1,2)),2)) + dist(i-1,1);
    end
end
% for i = 2:length(shp)
%     dist(i,1) = sqrt(power((sdata(i,1) - sdata(i-1,1)),2) + power((sdata(i,2)- sdata(i-1,2)),2)) + dist(i-1,1);
% end
%if isSpherical
%    dist = dist * 111111;
%end
dist = dist / 1000; % convert to km

dtri = DelaunayTri(double(X),double(Y));

query_points(:,1) = sdata(~isnan(sdata(:,1)),1);
query_points(:,2) = sdata(~isnan(sdata(:,2)),2);

pt_id = nearestNeighbor(dtri,query_points);

for i = 1:length(pt_id)
    Cell_3D_IDs = find(rawGeo.idx2==pt_id(i));
    surfIndex(i) = min(Cell_3D_IDs);
    botIndex(i) = max(Cell_3D_IDs);
end

thetime = find(mtime.Time >= timebin(1) & ...
    mtime.Time < timebin(end));

if ~use_matfiles
    if isSurf
        uData =  rawData.(varname{1})(surfIndex,thetime);
    else
        uData =  rawData.(varname{1})(botIndex,thetime);
    end
else
    if isSurf
        uData =  rawData.(varname{1}).outdata.surface(pt_id,thetime);
    else
        uData =  rawData.(varname{1}).outdata.bottom(pt_id,thetime);
    end
end

uDepth = Depth(pt_id,thetime);

pred_lims = [0.05,0.25,0.5,0.75,0.95];
num_lims = length(pred_lims);
nn = (num_lims+1)/2;
[ix,~] = size(uData);

inc = 1;
for i = 1:ix
    ddd = find(uDepth(i,:) < clip_depth);
    
    if isempty(ddd)
        xd = uData(i,:);
        if sum(isnan(xd)) < length(xd)
            xd(isnan(xd)) = mean(xd(~isnan(xd)));
            data.pred_lim_ts(:,inc) = plims(xd,pred_lims)';
            data.dist(inc,1) = dist(i);
            
            for ee=1:length(config.thresh(var).value)
                data.exceed(ee,inc)=length(find(xd>=config.thresh(var).value(ee)))/length(xd);
            end
                
            inc = inc + 1;
        end
    end
end