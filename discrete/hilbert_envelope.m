% hilbert_envelope.m
% 采样时间间隔
ts=0.01;
% 采样频率
fs=1/ts;
t=0:ts:10;

df=fs/length(t); % DFT的频率分辨率
f=-50:df:50-df;  % 生成频率矢量
% 生成序列
x=exp(-10*abs(t-5)).*cos(2*pi*20*t);
xa=hilbert(x);    % 求解x(t)的解析信号xa(t), 为复数,

fcl=20;
% 当fc=20Hz时低通信号
xl1=xa.*exp(-j*2*pi*fcl*t);
Xl1=fft(xl1)/fs; % 求fc=20时低通信号的频谱

% 绘制fc=20Hz的同相分量及幅度谱,
subplot(2,1,1);
plot(t,real(xl1));
title('fc=20Hz时低通信号的同相分量');
xlabel('时间t');

subplot(2,1,2);
plot(f,fftshift(abs(Xl1)));
title('fc=20Hz低通信号幅度谱');
xlabel('频率f');

% 绘制fc=10Hz的同相分量及幅度谱
fc2=10;
xl2=xa.*exp(-j*2*pi*fc2*t);
Xl2=fft(xl2)/fs;
figure;
subplot(2,1,1);
plot(t,real(Xl2));
title('fc=10Hz时低通信号的同相分量');
xlabel('时间t');
subplot(2,1,2);
plot(f,fftshift(abs(Xl2)));
title('fc=10Hz时低通信号的幅度谱');
xlabel('频率f');



