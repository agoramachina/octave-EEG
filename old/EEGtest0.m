%% Initialization
clear ; close all; clc

%% Read in format (int,int,int,double,int,int,int,int,int,int,int,int,int,int, int,string,"LAT: double LONG: double")

%% [a,...] = textread(filename, format, n, prop1, value1, ...)
%% [a,...] = strread(str, format, format_repeat, prop1, value1, ...)
%% sscanf


%% Load EEG data
printf("loading EEG data...\n");
EEGdata = csvread('data.txt');
EEGdata = EEGdata(2:end,:);

%% Feature Scaling
for i = 1:17
	EEGnorm(:,i) = (EEGdata(:,i) - min(EEGdata(:,i))) / (max(EEGdata(:,i) - min(EEGdata(:,i))));
end

%% Only include changes
d = 1;
for m=1 : 15
	for n=1 : size(EEGdata)(1,1)
		if n > 1 && EEGdata(n,m) != EEGdata(n-1,m)
			EEGdelta(d,m) = (EEGdata(n,m));
			d = d + 1;
		end
		%% debug stuff
		printf("%d: %d \n", m, n);
		fflush(stdout);
	end
end

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


% [a b] = strread(temp, '%*f %*f %s %s', 'delimiter' , ',' , 1)
% tagEvent = textread('data.txt', '%*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %*f %s %*s', 'delimiter' , ',' , 1)

%% Plot data
%plotEEG(timestampMs, poorSignal, eegRawValue, eegRawValueVolts, attention, meditation, blinkStrength, delta, theta, alphaLow, alphaHigh, betaLow, betaHigh, gammaLow, gammaMid);

figure;
plot(timestampMs, eegRawValue);  
title('EEG Raw Value'); 
xlabel('Time');


%plot(delta, "k", theta, "b" , alphaLow, "c" , alphaHigh, "g" , betaLow, "m", betaHigh, "r");
