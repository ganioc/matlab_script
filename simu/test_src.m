% test_src.m

clc;
clear;
close all;

overSampling_Factor=8;
Input_bit=[1];  % Bits to be transmitted
Input_bit_os=upsample(Input_bit,overSampling_Factor); % oversampling
alpha=0.1; % roll-off factor of Root Raised Cosine Filter
pt =squared_rc(overSampling_Factor, alpha); % impulse response of 

output_of_srrc_filter=conv(Input_bit_os, pt);
figure;
stem(output_of_srrc_filter);
title('Response of SRRC Filter at Tx side');
xlabel('Samples');
ylabel('Amplitude');

% receiver side, using a matched filter,
y=conv(output_of_srrc_filter,pt);
figure;
stem(y);
title('Matched filter response at Rx side');
xlabel('Samples');
ylabel('Amplitude');

midSample=length(-4:1/overSampling_Factor:4);
y_truncated=y(midSample-1: end); % Remove unwanted portions, 
    % first few samples till the peak value
% Now the first sample contains the peak value of the response, from
% here the samples are extracted depending on the oversampling factor,
y_down = downsample(y_truncated, overSampling_Factor, 1);
% here offset=1, means starting from 1st sample 
% % retain every 8th sample
figure;
stem(y_down);
title('Down sampled output(ADC conversion and sampling)');
xlabel('Samples');
ylabel('Amplitude');

















