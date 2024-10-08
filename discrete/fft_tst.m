% fft_tst.m
Fs=1000; % 序列的频率
T=1/Fs;  % 序列周期
L = 1000;  % 信号长度
t = (0:L-1)*T; % 时间向量
% 产生序列
S=0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
% 添加白噪声
X= S+ 2*randn(size(t));
subplot(3,1,1);
plot(1000*t(1:50), X(1:50));
title('带白噪声的信号');
xlabel('t 毫秒');
ylabel('X(t)');

% 利用fft实现Fourier变换
Y=fft(X);
% 序列的单边幅度谱
P2=abs(Y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f=Fs*(0:(L/2))/L;

subplot(3,1,2);
plot(f, P1);
title('X(t)序列的单边带幅度谱');
xlabel('f(Hz)');
ylabel('|P1(f)|');


% 对未添加白噪声的信号进行Fourier变换
Y=fft(S);
P2=abs(Y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
subplot(3,1,3);
plot(f,P1);
title('S(t)序列的单边带幅度谱');
xlabel('f(Hz)');
ylabel('|P1(f)|');



