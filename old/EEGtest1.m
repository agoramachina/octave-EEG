%% Initialization
clear ; close all; clc


%% Read in format (int,int,int,double,int,int,int,int,int,int,int,int,int,int, int,string,"LAT: double LONG: double")

%% [a,...] = textread(filename, format, n, prop1, value1, ...)
%% [a,...] = strread(str, format, format_repeat, prop1, value1, ...)

%% Load EEG data
EEGdata = csvread('data.txt');
EEGdata = EEGdata(2:end,:);

%% Set variables
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


tagEvent = EEGdata(:,16); 
location = [lat,long] = EEGdata(:,17); 


