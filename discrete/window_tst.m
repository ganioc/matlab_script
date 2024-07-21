% window_tst.m

fs=200; % 采样率
Delta_f = 1;  % 频率分辨率=1Hz
T=1/fs;  % 时间分辨率
L=1/Delta_f; % 时域截取长度
N=floor(fs/Delta_f) + 1; % 截取信号的采样点数

t=0:T:L;
freq=0:Delta_f:fs; % 分析的频率范围
f_t=(sin(2*pi*50*t) + 0.*sin(2*pi*75*t))';
f_t_rectwin=rectwin(N).*f_t; % 时域加窗
f_t_hamming=hamming(N).*f_t;
f_t_hann=hann(N).*f_t;

% 作N点DFT, 乘以采样时间间隔T得到频谱
F_w_rectwin=T.*fft(f_t_rectwin, N) + eps;
F_w_hamming =T.*fft(f_t_hamming,N) + eps;
F_w_hann=T.*fft(f_t_hann) + eps;

% drawing
subplot(2,2,1);
plot(t,f_t);
title('origin signal');
subplot(2,2,2);
plot(t,f_t_rectwin);
title('矩形窗');

subplot(2,2,3);
plot(t,f_t_hamming);
title('汉明窗');
subplot(2,2,4);
plot(t,f_t_hann);
title('汉宁窗');

figure;
subplot(3,1,1);
semilogy(freq, abs(F_w_rectwin));
title('矩形窗频谱');
axis([0,200,1e-4 ,1]);
grid on;

subplot(3,1,2);
semilogy(freq, abs(F_w_hamming));
title('海明窗频谱');
axis([0,200,1e-4,1]);
grid on;

subplot(3,1,3);
semilogy(freq, abs(F_w_hann));
title('汉宁窗频谱');
axis([0,200,1e-4,1]);
grid on;







