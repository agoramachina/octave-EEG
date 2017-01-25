%% Plots EEG data
%% Called by EEGtest.m

function plotEEG(timestampMS, poorSignal, eegRawValue, eegRawValueVolts, attention, meditation, blinkStrength, delta, theta, alphaLow, alphaHigh, betaLow, betaHigh, gammaLow, gammaMid) 

printf("plotting data\n");

%% Plot signal, raw value, raw volts, and blink strength
plot(poorSignal);  
title('Signal'); 
xlabel('Time');
figure();

plot(eegRawValue);  
xlimits = xlim([1, 1000]);
title('EEG Raw Value'); 
xlabel('Time');
figure();

plot(eegRawValueVolts);
title('EEG Raw Value Volts');
xlabel('Time');
figure();

plot(blinkStrength);
title('Blink Strength');
xlabel('Time');
figure();

%% Plot Attention and Meditation
plot(attention, "g", meditation, "b");
title('Focus');
xlabel('Time');
legend('Attention', 'Meditation', "show");
figure();

%% Plot all brainwaves
semilogy(x, gammaMid, 'color', [1,0,0], "linewidth", 1.25, 
	x, gammaLow, 'color', [1,.5,0], "linewidth", 1.25, 
	x, betaHigh, 'color', [1,1,0], "linewidth", 1.25,
	x, betaLow, 'color', [.5,1,0], "linewidth", 1.25,
	x, alphaHigh, 'color', [0,1,1],"linewidth", 1.25,
	x, alphaLow, 'color', [0,0,1], "linewidth", 1.25,
	x, theta, 'color', [.5 0 1], "linewidth", 1.25, 
	x, delta, 'color', [1,0,1], "linewidth", 1.25);
legend('gammaMid', 'gammaLow', 'betaHigh', 'betaLow', 'alphaHigh', 'alphaLow', 'theta', 'delta');
legend location eastoutside;
title('Brainwaves'); 
xlabel('Time');
ylabel('Activity'); 
