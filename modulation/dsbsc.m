% dsbsc.m

t=0.0025;  % 抽样间隔
t=0:ts:10-ts;
fs=1/ts;
df=fs/(length(t));
msg=randi([-3,3],100,1);
msg1=msg*ones(1,fs/10);
msg2=reshape(msg1.',1,length(t));  % 扩展成取样信号的形式
Pm=fft(msg2)/fs;   % 原始信号的频谱
f=-fs/2:df:fs/2-df;
subplot(2,1,1);
plot(f,fftshift(abs(Pm)));
title('原始信号频谱');

A=4;
fc=100;
Sdsb=msg2.*cos(2*pi*fc*t);  % 已调信号
Pdsb=fft(Sdsb)/fs;
subplot(2,1,2);
plot(f,fftshift(abs(Pdsb)));
title('DSBSC 信号频谱');
axis([-200,200,0,2]);
disp('已调信号功率');
Pc=sum(abs(Sdsb).^2)/length(Sdsb) % 已调信号功率
disp('原始信号功率');
Ps=sum(abs(msg2).^2)/length(msg2) % 原始信号功率


