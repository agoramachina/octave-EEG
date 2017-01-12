%% Plots EEG data
%% Called by EEGtest.m

function printEEG(timestampMS, poorSignal, eegRawValue, eegRawValueVolts, attention, meditation, blinkStrength, delta, theta, alphaLow, alphaHigh, betaLow, betaHigh, gammaLow, gammaMid) 

printf("plotting data\n");

plot(poorSignal);  
title('Signal'); 
xlabel('Time');
figure();

plot(eegRawValue);  
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

plot(attention, "g", meditation, "b");
title('Focus');
xlabel('Time');
legend('Attention', 'Meditation', "show");
figure();
