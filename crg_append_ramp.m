%crg_append_ramp
%   Use to apply ramp before and after the event.
%
%   Use crg_visualize to create a .mat file with the correct split. Load
%   this .mat into crg_append_flat. CRG_append_flat will apply a ramp
%   before and after the event with a logaritmic ramp.
%
%   Written by apearson 2022-08-30
% *****************************************************************
%% clear enviroment
%crg_full = crg_read('../../crg-bin/Volvo_Haellered_Axis22128111_DurabilityTrack_No5_MainTrack_5mm_adams.crg');
clearvars -except crg_full 
close all
%% Load demo road
%crg_full = crg_read('../../crg-bin/Volvo_Haellered_Axis22128111_DurabilityTrack_No5_MainTrack_5mm_adams.crg');
del_folder = sprintf('%s\\delimiter\\Delimiter.xlsx',(pwd));
param_table = readtable(del_folder); % Reads the delimiter excel table
output_folder = sprintf('%s\\generated_crg',(pwd)); % Specifies the selected output folder
events = (size(param_table(:,1))); % Determines how many events there is in the Delimiter.xlsx
events = events(1); % Selects the first element
for i = 1:events
    %% Parameters from file
    [cur_event crg_event_split] = gen_param_struct(crg_full, param_table, i); % Generates a struct of the parameters of the table and splits the full_crg
    %% Set parameters
    cur_event.inc =   [0.005   0.005]; % [0.005   0.005] equals to 5 x 5 mm grid size.
    cur_event.ramp_length_param = [0 50 60]; % Defines the length of the flat ramp and the logaritmic spline. [0 50 60] = 50 m flat 60 m log spline.
    cur_event.mean_filter_param = 5; % Filters the z psoitions where the spline end.
    cur_event.start_ramp_param = [1 0.1]; % Paramters to define the logaritmic ramp for the start ramp.
    cur_event.end_ramp_param = [1 0.1]; % Paramters to define the logaritmic ramp for the end ramp.
    %% Generate default crg
    crg = crg_append_ramp_start_end(crg_event_split, cur_event); % Appends ramp before and after the event.
    %crg = crg_show(crg); 
    %% write to file
    crg = crg_write2file(crg, cur_event, output_folder); % Write the crg's to the output folder.

    %% Show
    %crg = crg_show(crg_app);
end
