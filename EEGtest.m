%% 2014-09-26
%% edit 2017-01-14
%% agoramachina
%% Loads and plots EEG data

%% Initialization
clear ; close all; clc

%% Fixes Qt crash bug
graphics_toolkit('gnuplot')

%% Load EEG data
printf("loading EEG data...\n");
EEGdata = csvread('data.csv');
EEGdata = EEGdata(2:end,:);

%% Only include changes
%for m=1 : 15
%	d = 1;
%	for n=1 : size(EEGdata)(1,1)
%		if n > 1 && EEGdata(n,m) != EEGdata(n-1,m)
%			EEGdelta(d,m) = (EEGdata(n,m));
%			d = d + 1;
%		end
%		%% debug stuff
%		printf("%d: %d \n", m, n);
%		fflush(stdout);
%	end
%end

%% Set variables
printf("setting variables...\n");
timestampMs = EEGdata(:,1); 
poorSignal = EEGdata(:,2); 
eegRawValue = EEGdata(:,3); 
eegRawValueVolts = EEGdata(:,4); 
attention = EEGdata(:,5); 
meditation = EEGdata(:,6); 
blinkStrength = EEGdata(:,7); 
delta = EEGdata(:,8); 
theta = EEGdata(:,9); 
alphaLow = EEGdata(:,10); 
alphaHigh = EEGdata(:,11); 
betaLow = EEGdata(:,12); 
betaHigh = EEGdata(:,13); 
gammaLow = EEGdata(:,14); 
gammaMid = EEGdata(:,15); 

%tagEvent = EEGdata(:,16); 
%location = [lat,long] = EEGdata(:,17); 

%% Define colors
red = [1,0,0];
orange = [1,.5,0];
yellow = [1,1,0];
green = [.5,1,0];
cyan = [0,1,1];
blue = [0,0,1];
purple = [.5,0,1];
pink = [1,0,1];

%% Plot data
x = timestampMs - 1411778000000;

%% Plot EEG raw value
plot(eegRawValue);  
xlimits = xlim([1, 1000]);
title('EEG Raw Value'); 
xlabel('Time');
figure;

%% Plot Attention and Meditation
plot(attention, "g", meditation, "b");
title('Focus');
xlabel('Time');
legend('Attention', 'Meditation', "show");
figure();

%% Plot all brainwaves
semilogy(x, gammaMid, 'color', [1,0,0], "linewidth", 1, 
	x, gammaLow, 'color', [1,.5,0], "linewidth", 1, 
	x, betaHigh, 'color', [1,1,0], "linewidth", 1,
	x, betaLow, 'color', [.5,1,0], "linewidth", 1,
	x, alphaHigh, 'color', [0,1,1],"linewidth", 1,
	x, alphaLow, 'color', [0,0,1], "linewidth", 1,
	x, theta, 'color', [.5 0 1], "linewidth", 1, 
	x, delta, 'color', [1,0,1], "linewidth", 1);
set(gca, 'color', [.85,.85,.85]);
set(gcf, 'color', [.95,.95,.95]);
legend('gammaMid', 'gammaLow', 'betaHigh', 'betaLow', 'alphaHigh', 'alphaLow', 'theta', 'delta');
legend location eastoutside;
title('Brainwaves'); 
xlabel('Time');
ylabel('Activity');



