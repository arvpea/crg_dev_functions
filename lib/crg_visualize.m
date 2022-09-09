%CRG_Visualize.
%   Use to find the intresting U/V for to split the CRG.
%   Written by apearson 2022-08-30
% *****************************************************************
%% Clear variables
clear all
close all
%% Parameters
u = [276800 340000];
v = [200 950];
%% Load demo road
tic
crg_event = crg_read('../crg-bin/Volvo_Haellered_Axis22128111_DurabilityTrack_No5_MainTrack_5mm_adams.crg');
toc
%% Split
crg_event_split = crg_cut_iuiv(crg_event, u, v);
%% Info
X = sprintf('Z:  [%d, %d] size ',size(crg_event_split.z));
disp(X)
X = sprintf('U:  [%d, %d] points | U:  [%d, %d] meters ',u,u*0.005);
disp(X)
X = sprintf('V:  [%d, %d] points | V:  [%d, %d] meters ',v,v*0.005);
disp(X)
%% Visualize
crg_show(crg_event);
%crg_plot_road_xyz_map(crg_event);