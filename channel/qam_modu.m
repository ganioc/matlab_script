% qam_modu.m
M=16;
k=log2(M);
n=10000;
samp=1;  % 过采样率
x=randi([0,1],n,1);
stem(x(1:50),'filled');
title('二进制随机比特流');
xlabel('比特序列');
ylabel('信号幅度');
% 将二进制比特序列每4个分一组，并排成k行?列的矩阵
x4=reshape(x,k,length(x)/k);
xsym=bi2de(x4.', 'left-msb');

figure;
stem(xsym(1:50));
title('十六进制随机信号');
xlabel('信号序列');
ylabel('信号幅度');

y=qammod(xsym, M);
scatterplot(y);
text(real(y) + 0.1, imag(y), dec2bin(xsym));
axis([-5,5,-5,5]);

EbN0=15;
snr=EbN0 + 10*log10(k) - 10*log10(samp); % 信噪比
yn=awgn(y,snr, 'measured');
h=scatterplot(yn,samp,0,'b.');
hold on;
scatterplot(y,1,0,'k+',h);
title('接收信号星座图');
legend('含噪声接收信号','不含噪声信号');
axis([-5,5,-5,5]);
hold on;
eyediagram(yn,2); % 眼图

yd=qamdemod(yn,M);
z=de2bi(yd,'left-msb');
z=reshape(z.',numel(z),1');
[number_of_errors,bit_error_rate]=biterr(x,z)



