clc
clear all
close all

%% Required Octave packages
pkg load signal
pkg load statistics

%% Load simulation
data = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/Matlab/2CFASTICA/S2_30MVC.mat");

%% Display the content of the simulation file
disp(size(data.sig_out))

%% Convert the 10-by-9 cell array into a 90-by-N numeric matrix
% Each cell contains one 1-by-N EMG channel.
EMG = vertcat(data.sig_out{:});

fprintf("Number of channels: %d\n", size(EMG,1));
fprintf("Number of samples:  %d\n", size(EMG,2));
fprintf("Duration: %.2f seconds\n", size(EMG,2)/data.fsamp);

%% Remove the mean of each channel
EMG = EMG - mean(EMG,2);

%% Normalize each channel to a standard deviation of 1
channel_std = std(EMG,0,2);
channel_std(channel_std == 0) = 1;
EMG = EMG ./ channel_std;

%% Parameters for 2CFastICA
param = struct();

param.fs = data.fsamp;
param.delay = 10;

% Approximately 50 ms at the simulation sampling frequency
param.wavelength = fix(param.fs/20);

% Minimum interval of approximately 25 ms between firings
param.peakinterval = fix(param.fs/40);

param.convergethreshold = 1e-6;

% 0 = PCA features for valley-seeking clustering
param.valleymode = 0;

%% Run the decomposition
[S, Mu] = CFICA2(EMG, param);

%% Save the results
save("S2_30MVC_2CFastICA_results.mat", "S", "Mu", "param");
