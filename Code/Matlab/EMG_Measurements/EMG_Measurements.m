clc
clear all
close all

dataInk = cellfun(@str2double, getEMGData("Silver_Ink.csv",5,8));
dataEmager = cellfun(@str2double, getEMGData("Emager.csv",5,0));

##figure(1)
##plot(dataInk(:,1), dataInk(:,2))
##
##figure(2)
##plot(dataEmager(:,1), dataEmager(:,2))


% 1. Create a sample signal
Fs = 1/(dataEmager(2,1)-dataEmager(1,1));          % Sampling frequency in Hz

% 2. Compute the FFT
F = fft(dataEmager(:,2));
N = length(dataEmager(:,2));     % Number of data points

% 3. Create the frequency vector
% Frequencies range from 0 to Fs (or +/- Fs/2 for a centered spectrum)
f = (0:N-1)*(Fs/N); % Frequency vector for one-sided plot

% 4. Plot the magnitude spectrum
% The FFT output is symmetric for real-valued input, so only the first half is typically plotted.
% Use abs() to get the magnitude and plot the power spectrum if desired.
power = abs(F).^2/N; % Power spectrum

plot(f(1:floor(N/2)), power(1:floor(N/2)));
xlabel('Frequency (Hz)');
ylabel('Power');
title('Frequency Spectrum');

