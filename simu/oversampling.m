% oversampling.m

overSampling_Factor=4;
Input_bit=1;
% oversampling, os
Input_bit_os=upsample(Input_bit, overSampling_Factor);
% 通过一个脉冲成形滤波器
% rectangular filter,
% 归一化pulse shape to have unit energy
pt=[ones(1,overSampling_Factor) 0 0 0 0 0 0]/sqrt(overSampling_Factor);
output_of_rect_filter=conv(Input_bit_os,pt);

stem(output_of_rect_filter);
title('Output of Rectangular Filter at Tx side');
xlabel('Samples');
ylabel('Amplitude');



