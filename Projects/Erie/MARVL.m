% .*((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((*.%
%.((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((%
%                                 ____    _    _   _                      %
%.(((((((      |\    /|    /\    |    \  \ \  / / | |          (((((((((((%
%.(((((((      | \  / |   /  \   | Π  /   \ \/ /  | |          (((((((((((%
%.(((((((      |  \/  |  / Δ  \  | |\ \    \  /   | |____      (((((((((((%
%.(((((((      |_|\/|_| /_/  \_\ |_| \_\    \/    |______|     (((((((((((%
%                                                                         %
%.((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((%
% .*((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((*.%
% The AED Model Assessment, Reporting and Visualisation Library
%--------------------------------------------------------------------------
% MARVL configuration for Coorong
MARVLs = struct;

%% master configuration: --------------------------------------------------
%
% List here the available MARVL modules, state variables, model outputs,
%   processed field data, and general plotting features to be included
%   in the plotting.
%
% Note: if multiple NetCDF outpus are listed, some modules only deal with
%  the first NetCDF output such as the transect_stackedArea module.
%
%--------------------------------------------------------------------------
master.modules = {...
       'timeseries';...
    %   'transect';  ...
    %   'transect_stackedArea'; ...
    %   'transect_exceedance'; ...
    %   'sheet'; ...
    %   'curtain'; ...
    %   'site_profiling'; ...
    %   'sediment_profiling'; ...
    };

% state variable Configuration
%    column 1: AED names;
%    column 2: user-defined names
% master.varname = {...
%     'TEMP','Temperature';...
%     'WQ_OXY_OXY','DO';...
%     'WQ_DIAG_TOT_TN','TN';...
%     'WQ_DIAG_TOT_TP','TP';...
%     'WQ_DIAG_PHY_TCHLA','TCHLA';...
%     'WQ_NIT_AMM','NH_4';...
%     'WQ_NIT_NIT','NO_3';...
%     'WQ_PHS_FRP','PO_4';...
%     'WQ_OGM_DOC','DOC';...
%     'DINDIP','DIN/DIP ratio';...
%     'PONDON','PON/DON ratio';...
%     'TNTP','TN/TP ratio';...
%     };

master.varname = {...
    'WQ_DIAG_TOT_TP','TP';...
'WQ_DIAG_TOT_TN','TN';...
'TEMP','Temperature';...
    'WQ_OXY_OXY','DO';...
'WQ_SIL_RSI','SIL-rsi';...
'WQ_NIT_AMM','NIT-amm';...
'WQ_NIT_NIT','NIT-nit';...
'WQ_PHS_FRP','PHS-frp';...
'WQ_PHS_FRP_ADS','PHS-frp-ads';...
'WQ_OGM_DOC','DOC';...
'WQ_OGM_POC','POC';...
'WQ_OGM_DON','DON';...
'WQ_OGM_PON','PON';...
'WQ_OGM_DOP','DOP';...
'WQ_OGM_POP','POP';...
'WQ_NCS_SS1','NCS-ss1';...
'WQ_TRC_AGE','TRC-age';...
'WQ_DIAG_PHY_TCHLA','TCHLA';...
'WQ_PHY_CYANO','CYANO';...
'WQ_PHY_CYANO_RHO','CYANO RHO';...
'WQ_PHY_CHLOR','CHLOR';...
'WQ_PHY_CRYPT','CRYPT';...
'WQ_PHY_EDIAT','EDIAT';...
'WQ_PHY_LDIAT','LDIAT';...
'WQ_MAG_CGM','MAG_CGM';...
'WQ_BIV_FILTFRAC','BIV-filterac';...
'WQ_DIAG_MAG_TMALG','TMALG';...
'WQ_DIAG_TOT_EXTC','TOT-extc';...
'WQ_DIAG_TOT_TSS','TOT-tss';...
'WQ_DIAG_TOT_TOC','TOT-toc';...
 };

master.add_human = 1; % option to use user-define names, if 0 use AED names

% Models
master.ncfile(1).name = '/Projects2/Erie/erie_tfv_aed_2013_ver012_rev0/Output_IP_V2/erie_12_k_NDIP_ALL.nc';
%'W:\Erie\erie_tfv_aed_2013_ver012_rev0\Output_ND\erie_12_k_ND_ALL.nc';
%'W:\Erie\erie_tfv_aed_2013_ver012_rev0\erie_tfv_aed_2013_ver012_rev0\Output\erie_12_j_AED.nc';
master.ncfile(1).legend = 'IP V2';
%master.ncfile(1).tag = 'TFV';
% 
master.ncfile(2).name = '/Projects2/Erie/erie_tfv_aed_2013_ver012_rev0/Output_IP_V3/erie_12_k_NDIP_ALL.nc';
master.ncfile(2).legend = 'IP V3';
% %master.ncfile(1).tag = 'TFV';

% field data, stored in standard AED .mat format
master.add_fielddata = 1;
master.fielddata_matfile = '/Projects2/Erie/Plotting/MARVL/Projects/Erie/data/erie.mat';
master.fielddata = 'erie';

% general plotting features
master.font = 'Times New Roman';
master.fontsize   = 8;
master.xlabelsize = 9;
master.ylabelsize = 9;
master.titlesize  = 10;
master.legendsize = 6;
master.visible = 'on'; % on or off

MARVLs.master = master; clear master;

%% timeseries setting:-----------------------------------------------------
%  configurations for the marvl_plot_timeseries.m function.
% -------------------------------------------------------------------------

timeseries.start_plot_ID = 18; % select which variable to plot
timeseries.end_plot_ID = 30;

timeseries.plotvalidation = 1; % Add field data to figure (1 or 0)
timeseries.validation_raw = 1; % 1: raw data; 0: daily-average
timeseries.plotmodel = 1;

timeseries.plotdepth = {'surface','bottom'};  %  {'surface','bottom'} Cell-array with either one
timeseries.depthTHRESH = -3;  %  {'surface','bottom'} Cell-array with either one
timeseries.edge_color = {[166,86,40]./255;[8,88,158]./255}; % symbol edge color for field data, surface and bottom
timeseries.depth_range = [0.2 100];
timeseries.validation_minmax = 0;    % option to add max/min observations
timeseries.isModelRange = 1;         % option to plot model range with below percentile
timeseries.pred_lims = [0.05,0.25,0.5,0.75,0.95]; % must be 5 numbers
timeseries.alph = 0.5;

timeseries.isFieldRange = 0;         % option to add plot field data range
timeseries.fieldprctile = [10 90];
timeseries.isHTML = 1;

% polygon file define the site areas
timeseries.polygon_file = '/Projects2/Erie/Plotting/MARVL/Projects/Erie/GIS/erie_validation_v6.shp';

% option to plot all sites or selected sites
timeseries.plotAllsites = 1;
if timeseries.plotAllsites == 0
    timeseries.plotsite = [8];
end

% section for model skill calculations
timeseries.add_error = 0;
timeseries.isSaveErr = 1;
timeseries.obsTHRESH = 5;
timeseries.showSkill = 1;
timeseries.scoremethod = 'range'; % 'range' or 'median'

% selection of model skill assessment, 1: activated; 0: not activated
timeseries.skills = [1,... % r: regression coefficient (0-1)
    1,... % BIAS: bias relative to mean observation (%)
    1,... % MAE: mean absolute error
    1,... % RMSE: root mean square error
    1,... % NMAE: MAE normalized to mean observation
    1,... % NRMS: RMSE normalized to mean observation
    1,... % MEF: model efficienty, Nash-Sutcliffe Efficiency
    ];
timeseries.outputdirectory = '/Projects2/Erie/Plotting/MARVL/Projects/Erie/plotting/timeseries_12KIP_compareV3/RAW/';
timeseries.htmloutput = '/Projects2/Erie/Plotting/MARVL/Projects/Erie/plotting/timeseries_12KIP_compareV3/HTML/';
timeseries.ErrFilename = '/Projects2/Erie/Plotting/MARVL/Projects/Erie/plotting/timeseries_12KIP_compareV3/errormatrix.mat';

timeseries.ncfile(1).symbol = {'-','-'};
timeseries.ncfile(1).colour = {[166,86,40]./255;[8,88,158]./255};% Surface and Bottom
timeseries.ncfile(1).col_pal_color_surf =[[254,232,200]./255;[252,141,89]./255]; % color1: 5-95 perc; color2: 25-75 perc
timeseries.ncfile(1).col_pal_color_bot  =[[222,235,247]./255;[107,174,214]./255];

timeseries.ncfile(2).symbol = {'-','-'};
timeseries.ncfile(2).colour = {[250,159,181]./255;[27,158,119]./255};% Surface and Bottom
timeseries.ncfile(2).col_pal_color_surf =[[102,194,164]./255;[162 190 197]./255];
timeseries.ncfile(2).col_pal_color_bot  =[[102,194,164]./255;[204,236,230]./255];

% plotting configuration
timeseries.datearray = datenum(2013,5:1:10,01);
timeseries.dateformat = 'mm/yy';

%timeseries.dimc = [0.9 0.9 0.9]; % dimmest (lightest) color
timeseries.istitled = 1;
timeseries.isylabel = 1;
timeseries.islegend = 1;
timeseries.isYlim   = 1;
%timeseries.isGridon = 1;
timeseries.dimensions = [15 7.5]; % Width & Height in cm

timeseries.dailyave = 0; % 1 for daily average, 0 for model output interval. 
%timeseries.smoothfactor = 3; % Must be odd number (set to 3 if none)

%timeseries.fieldsymbol = {'.','.'}; % Cell with same number of levels
%timeseries.fieldcolour = {'m',[0.6 0.6 0.6]}; % Cell with same number of levels

timeseries.legendlocation = 'northeastoutside';
timeseries.filetype = 'eps';

% ylim
%     'TEMP','Temperature';...
%     'WQ_OXY_OXY','DO';...
%     'WQ_DIAG_PHY_TCHLA','TCHLA';...
%     'WQ_DIAG_TOT_TN','TN';...
%     'WQ_DIAG_TOT_TP','TP';...
%     'WQ_NIT_AMM','NH_4';...
%     'WQ_NIT_NIT','NO_3';...
%     'WQ_PHS_FRP','PO_4';...
%     'WQ_OGM_DOC','DOC';...
%     'DINDIP','DIN/DIP ratio';...
%     'PONDON','PON/DON ratio';...
%     'TNTP','TN/TP ratio';...
%timeseries.cAxis(1).value = [0 30];
%timeseries.cAxis(2).value = [0 18];
%timeseries.cAxis(3).value = [0 4];
%timeseries.cAxis(4).value = [0 0.2];

%timeseries.cAxis(1).value = [0 30];
%timeseries.cAxis(2).value = [0 18];

for vvvv=1:size(MARVLs.master.varname,1)
    timeseries.cAxis(vvvv).value = [ ];
end

MARVLs.timeseries = timeseries; clear timeseries;

%% Transect setting:-----------------------------------------------------
%  The is the configuration file for the marvl_plot_transect.m function.
% -------------------------------------------------------------------------

transect.start_plot_ID = 1;
transect.end_plot_ID = 9;

transect.polygon_file = 'E:\database\AED-MARVL-v0.4\Projects\Erie\GIS\borderline.shp';
% Add field data to figure
transect.plotvalidation = 1; % 1 or 0
transect.plotmodel = 1; % 1 or 0
transect.pred_lims = [0.05,0.25,0.5,0.75,0.95];

transect.isRange = 1;
transect.istitled = 1;
transect.isylabel = 1;
transect.islegend = 0;
transect.isYlim = 1;
transect.isHTML = 1;
transect.isSurf = 1; %plot surface (1) or bottom (0)
transect.isSpherical = 0;
transect.use_matfiles = 0;
transect.add_obs_num = 1;
%config.boxon = 1;

% ___
transect.outputdirectory = 'E:\database\AED-MARVL-v0.4\Projects\Erie\plotting\transect_testSitesNew_5km\RAW\';
transect.htmloutput = 'E:\database\AED-MARVL-v0.4\Projects\Erie\plotting\transect_testSitesNew_5km\HTML\';

% plotting configuration
transect.dimc = [0.9 0.9 0.9]; % dimmest (lightest) color
transect.boxlegend = 'northeast';
transect.rangelegend = 'northwest';
transect.dimensions = [15 7.5]; % Width & Height in cm

for i=1:5
transect.pdates(i).value = [datenum(2013,5+(i-1)*1,01) datenum(2013,05+i*1,01)-1];
end
transect.binfielddata = 1;
% radius distance to include field data. Used to bin data where number of
% sites is higher, but the frequency of sampling is low. The specified
% value will also make where on the line each polygon will be created. So
% if radius == 5, then there will be a search polygon found at r*2, so 0km, 10km, 20km etc. In windy rivers these polygons may overlap.
transect.binradius = 40;% in km;


%distance from model polyline to be consided.
%Field data further than specified distance won't be included.
%Even if found with search radius. This is to attempt to exclude data
%sampled outside of the domain.
transect.linedist = 5000;%  in m

transect.xlim = [0 450];% xlim in KM
transect.xticks = [0:50:450];
transect.xlabel = 'Distance along lake from West Basin (km)';
transect.filetype = 'eps';

%   'TEMP','Temperature';...
%     'WQ_OXY_OXY','DO';...
%     'WQ_DIAG_TOT_TN','TN';...
%     'WQ_DIAG_TOT_TP','TP';...
%     'WQ_DIAG_PHY_TCHLA','TCHLA';...
%     'WQ_NIT_AMM','NH_4';...
%     'WQ_NIT_NIT','NO_3';...
%     'WQ_PHS_FRP','PO_4';...
%     'WQ_OGM_DOC','DOC';...
%     'DINDIP','DIN/DIP ratio';...
%     'PONDON','PON/DON ratio';...
%     'TNTP','TN/TP ratio';...
transect.cAxis(1).value = [0 30];
transect.cAxis(2).value = [0 18];
transect.cAxis(3).value = [0 4];
transect.cAxis(4).value = [0 0.2];
transect.cAxis(5).value = [0 60];
transect.cAxis(6).value = [0 0.6];
transect.cAxis(7).value = [0 4];
transect.cAxis(8).value = [0 0.1];
transect.cAxis(9).value = [0 14];
% ylim
% for vvvv=1:size(MARVLs.master.varname,1)
%     transect.cAxis(vvvv).value = [ ];
% end
transect.ncfile(1).symbol = {'-'};
transect.ncfile(1).translate = 1;
transect.ncfile(1).colour = [8,88,158]./255;% Surface and Bottom
transect.ncfile(1).edge_color = [8,88,158]./255;
transect.ncfile(1).col_pal_color =[[222,235,247]./255;[107,174,214]./255];

MARVLs.transect = transect; clear transect;

%% Transect stacked area setting:------------------------------------------
%  The is the configuration file for the marvl_plot_transect.m function.
% -------------------------------------------------------------------------
transectSA.thevars = {...
    'WQ_PHY_GRN';...
    'WQ_PHY_DINO';...
    'WQ_PHY_DIATOM';...
    'WQ_PHY_CRYPT';...
    };
transectSA.thelabels = {...
    'Green Algae';...
    'Dino';...
    'Diatom';...
    'Crypt';...
    };
transectSA.thevars_conv = [50 50 50 50]/12;

transectSA.varname = {...
    'WQ_DIAG_PHY_TCHLA','TChla (\mug/L)';...
    };
%transectSA.add_human = 1;

transectSA.polygon_file = 'E:\database\AED-MARVl-v0.2\Examples\Cockburn\GIS\Curtain_polyline_100m_QC.shp';
% Add field data to figure
transectSA.plotvalidation = 1; % 1 or 0
transectSA.pred_lims = [0.05,0.25,0.5,0.75,0.95];

transectSA.isRange = 1;
transectSA.istitled = 1;
transectSA.isylabel = 1;
transectSA.islegend = 0;
transectSA.isYlim = 1;
transectSA.isHTML = 1;
transectSA.isSurf = 1; %plot surface (1) or bottom (0)
transectSA.isSpherical = 0;
transectSA.use_matfiles = 0;
transectSA.add_obs_num = 1;
%config.boxon = 1;

% ___
transectSA.outputdirectory = 'plotting/transectSA/RAW/';
transectSA.htmloutput = 'plotting/transectSA/HTML/';

% plotting configuration
transectSA.dimc = [0.9 0.9 0.9]; % dimmest (lightest) color
transectSA.boxlegend = 'southeast';
transectSA.rangelegend = 'northwest';
transectSA.dimensions = [20 10]; % Width & Height in cm

i=1;
transectSA.pdates(1).value = [datenum(2021,06,16) datenum(2021,07,01)];i=i+1;
transectSA.pdates(2).value = [datenum(2021,07,01) datenum(2021,07,15)];i=i+1;
transectSA.pdates(3).value = [datenum(2021,07,16) datenum(2021,08,01)];i=i+1;

transectSA.binfielddata = 1;
% radius distance to include field data. Used to bin data where number of
% sites is higher, but the frequency of sampling is low. The specified
% value will also make where on the line each polygon will be created. So
% if radius == 5, then there will be a search polygon found at r*2, so 0km, 10km, 20km etc. In windy rivers these polygons may overlap.
transectSA.binradius = 0.5;% in km;


%distance from model polyline to be consided.
%Field data further than specified distance won't be included.
%Even if found with search radius. This is to attempt to exclude data
%sampled outside of the domain.
transectSA.linedist = 1500;%  in m

transectSA.xlim = [0 45];% xlim in KM
transectSA.xticks = [0:5:45];
transectSA.xlabel = 'Distance from Southern CS (km)';

% ylim
transectSA.cAxis(1).value = [0 20];

MARVLs.transectSA = transectSA; clear transectSA;

%% Site profiling setting:------------------------------------------
%  The is the configuration file for the marvl_plot_profile.m function.
% -------------------------------------------------------------------------
for vvvv=1:length(MARVLs.master.varname)
    profile.cAxis(vvvv).value = [ ];
end

profile.start_plot_ID = 1;
profile.end_plot_ID = 1;

profile.sitenames={'Cockburn','Swan'};
profile.siteX=[ 380000, 388340];
profile.siteY=[6433760,6458300];

profile.plotvalidation = false; % Add field data to figure (true or false)
profile.plotmodel = 1;

profile.filetype = 'eps';
profile.expected = 1; % plot expected WL

profile.isHTML = 1;

profile.datearray = datenum(2021,6,15:15:60);

profile.dateformat = 'dd/mm/yyyy';

profile.dimc = [0.9 0.9 0.9]; % dimmest (lightest) color
profile.istitled = 1;
profile.isylabel = 1;
profile.islegend = 1;
profile.isYlim   = 1;
profile.isGridon = 1;
profile.dimensions = [20 10]; % Width & Height in cm

profile.outputdirectory = 'plotting/profile/RAW/';
profile.htmloutput = 'plotting/profile/HTML/';

MARVLs.profile = profile; clear profile;

%% Sheet plotting setting:------------------------------------------
%  The is the configuration file for the marvl_plot_sheet.m function.
% -------------------------------------------------------------------------
sheet.cAxis(1).value = [28 35];
sheet.start_plot_ID = 1;
sheet.end_plot_ID = 1;

sheet.plotdepth = {'bottom'};  %  {'surface','bottom'} Cell-array with either one
sheet.plottype = 'figure'; % choose 'movie' or 'figure';

if strcmpi(sheet.plottype,'movie')
    sheet.FileFormat='mp4'; % choose 'mp4' or 'avi'
    sheet.Quality   =100;   % movie quality
    sheet.FrameRate =6;     % frame rate
    sheet.resolution = [1024,768]; % frame rosolution
    sheet.colormap = 'jet'; % colormap options, see Matlab manual
    sheet.save_images = 1;  % option to save slide images
    sheet.datearray = [datenum(2021,07,01) datenum(2021,07,21)];
    sheet.dateformat = 'mm/yyyy';
    sheet.plot_interval = 6;
elseif strcmpi(sheet.plottype,'figure')
    sheet.datearray = [datenum(2021,07,01) datenum(2021,07,21)];
    sheet.resolution = [1024,768]; % frame rosolution
    sheet.colormap = 'jet'; % colormap options, see Matlab manual
else
    msg=['Error: type of ',sheet.plottype,' is not recognized'];
    error(msg);
end

sheet.outputdirectory = 'plotting/sheet/';

sheet.clip_depth = 0.05; % remove the shallow NaN cells

sheet.dimc = [0.9 0.9 0.9]; % dimmest (lightest) color
sheet.istitled = 1;
sheet.isColorbar = 1;
sheet.Xlim     = [ ];
sheet.Ylim     = [ ];
sheet.isAxison = 1;
sheet.dimensions = [20 10]; % Width & Height in cm

MARVLs.sheet = sheet; clear sheet;

%% Curtain plotting setting:------------------------------------------
%  The is the configuration file for the marvl_plot_curtain.m function.
% -------------------------------------------------------------------------
curtain.cAxis(1).value = [28 35];
curtain.start_plot_ID = 1;
curtain.end_plot_ID = 1;
curtain.geofile = 'W:\Jayden\Simulations\Cockburn_Base\Input/Cockburn_kw_020_geo.nc';
curtain.polyline = 'W:/Jayden/plotting/Curtain_polyline_100m_QC.shp';

curtain.plottype = 'movie'; % choose 'movie' or 'figure';

if strcmpi(curtain.plottype,'movie')
    curtain.FileFormat='mp4'; % choose 'mp4' or 'avi'
    curtain.Quality   =100;   % movie quality
    curtain.FrameRate =6;     % frame rate
    curtain.resolution = [1024,768]; % frame rosolution
    curtain.colormap = 'jet'; % colormap options, see Matlab manual
    curtain.save_images = 1;  % option to save slide images
    curtain.datearray = [datenum(2021,07,01) datenum(2021,07,21)];
    curtain.dateformat = 'mm/yyyy';
    curtain.plot_interval = 6;
elseif strcmpi(curtain.plottype,'figure')
    curtain.datearray = [datenum(2021,07,01) datenum(2021,07,21)];
    curtain.resolution = [1024,768]; % frame rosolution
    curtain.colormap = 'jet'; % colormap options, see Matlab manual
else
    msg=['Error: type of ',curtain.plottype,' is not recognized'];
    error(msg);
end

curtain.outputdirectory = 'plotting/curtain/';

curtain.clip_depth = 0.05; % remove the shallow NaN cells

curtain.dimc = [0.9 0.9 0.9]; % dimmest (lightest) color
curtain.istitled = 1;
curtain.isColorbar = 1;
curtain.xlim = [0 45];% xlim in KM
curtain.xticks = [0:5:45];
curtain.xlabel = 'Distance from CS South (km)';
curtain.isAxison = 1;
curtain.dimensions = [20 10]; % Width & Height in cm
curtain.colorbarposition = [0.92 0.25 0.01 0.45];

MARVLs.curtain = curtain; clear curtain;

%% Transect exceedance setting:-----------------------------------------------------
%  The is the configuration file for the marvl_plot_transect.m function.
% -------------------------------------------------------------------------

transectExc.start_plot_ID = 13;
transectExc.end_plot_ID = 13;

transectExc.polygon_file = 'E:\database\AED-MARVl-v0.2\Examples\Cockburn\GIS\Curtain_polyline_100m_QC.shp';
% Add field data to figure
transectExc.plotvalidation = 0; % 1 or 0
transectExc.pred_lims = [0.05,0.25,0.5,0.75,0.95];

transectExc.isRange = 1;
transectExc.istitled = 1;
transectExc.isylabel = 1;
transectExc.islegend = 0;
transectExc.isYlim = 1;
transectExc.isHTML = 1;
transectExc.isSurf = 1; %plot surface (1) or bottom (0)
transectExc.isSpherical = 0;
transectExc.use_matfiles = 0;
transectExc.add_obs_num = 1;
%config.boxon = 1;

transectExc.thresh(13).value = [0.5 1];
transectExc.thresh(13).legend = {'%time > 0.5NTU',...
    '%time > 1NTU'};
% ___
transectExc.outputdirectory = 'plotting/transect_exceedance/RAW/';
transectExc.htmloutput = 'plotting/transect_exceedance/HTML/';

% plotting configuration
transectExc.dimc = [0.9 0.9 0.9]; % dimmest (lightest) color
transectExc.boxlegend = 'southeast';
transectExc.rangelegend = 'northwest';
transectExc.dimensions = [20 10]; % Width & Height in cm

i=1;
transectExc.pdates(1).value = [datenum(2021,06,16) datenum(2021,07,01)];i=i+1;
transectExc.pdates(2).value = [datenum(2021,07,01) datenum(2021,07,15)];i=i+1;
transectExc.pdates(3).value = [datenum(2021,07,16) datenum(2021,08,01)];i=i+1;

transectExc.binfielddata = 1;
% radius distance to include field data. Used to bin data where number of
% sites is higher, but the frequency of sampling is low. The specified
% value will also make where on the line each polygon will be created. So
% if radius == 5, then there will be a search polygon found at r*2, so 0km, 10km, 20km etc. In windy rivers these polygons may overlap.
transectExc.binradius = 0.5;% in km;


%distance from model polyline to be consided.
%Field data further than specified distance won't be included.
%Even if found with search radius. This is to attempt to exclude data
%sampled outside of the domain.
transectExc.linedist = 1500;%  in m

transectExc.xlim = [0 45];% xlim in KM
transectExc.xticks = [0:5:45];
transectExc.xlabel = 'Distance from Southern CS (km)';

% ylim
for vvvv=1:size(MARVLs.master.varname,1)
    transectExc.cAxis(vvvv).value = [0 100];
end

transectExc.ncfile(1).symbol = {'-'};
transectExc.ncfile(1).translate = 1;
transectExc.ncfile(1).colour = [166,86,40]./255;% Surface and Bottom
transectExc.ncfile(1).edge_color = [166,86,40]./255;
transectExc.ncfile(1).col_pal_color =[[176 190 197]./255;[162 190 197]./255;[150 190 197]./255;[150 190 197]./255];

MARVLs.transectExc = transectExc; clear transectExc;