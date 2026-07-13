clc
clear all
close all

data(1) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S1_10MVC.mat");
data(2) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S2_30MVC.mat");
data(3) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S3_50MVC.mat");
data(4) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S4_10MVC.mat");
data(5) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S5_30MVC.mat");
data(6) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S6_50MVC.mat");
data(7) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S7_10MVC.mat");
data(8) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S8_30MVC.mat");
data(9) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S9_50MVC.mat");
data(10) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S10_10MVC.mat");
data(11) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S11_30MVC.mat");
data(12) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S12_50MVC.mat");
data(13) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S13_10MVC.mat");
data(14) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S14_30MVC.mat");
data(15) = load("C:/Users/olivi/Documents/Universite Laval/Maitrise/Matlab/EMG_Simulations/S15_50MVC.mat");

%% Example: Plot EMG of 1 electrode
data_Test = data(14).sig_out{3,8};

timeData = 1:length(data_Test);

figure(1)
plot(timeData/4096,data_Test)











































