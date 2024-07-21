% welch_tst.m
fs=500;
t=0:1/fs:1;
F=0:1:fs; %  功率谱估计的频率分辨率和范围
xk=sin(2*pi*60*t) + 2*sin(2*pi*110*t) + randn(1, length(t));
% 截取时间段上的离散信号样点序列
Pxx=abs(1/fs*fft(xk)).^2;
plot(F, 10*log10(Pxx));
xlabel('频率Hz');
ylabel('功率谱');

