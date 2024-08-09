% ssb_2.m

ts=0.0025;
t=0:ts:5-ts;
fs=1/ts;
df=fs/length(t);
f=-fs/2:df:fs/2-df;
msg=randi([-3,3],10,1);
msg1=msg*ones(1,fs/2);
msg2=reshape(msg1.',1,length(t));
Pm=fft(msg2)/fs;
f=-fs/2:df:fs/2-df;

subplot(2,1,1);
plot(t,fftshift(abs(Pm)));
title('原始信号频谱');

fc=100;
Sdsb=msg2.*cos(2*pi*fc*t);
Pdsb=fft(Sdsb)/fs;
f_stop=100;
n_stop=floor(f_stop/df);
Hlow=zeros(size(f));
Hlow(1:n_stop)=1;
Hlow(length(f) - n_stop + 1:end)=1;
Plssb=Pdsb.*Hlow;
subplot(2,1,2);
plot(f,fftshift(abs(Plssb)));
title('已调信号频谱');
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
Slssb=real(ifft(Plssb))*fs;
disp('已调信号频率');
Pc=sum(abs(Slssb).^2)/length(Slssb)
disp('原始信号频率');
Ps=sum(abs(msg2).^2)/length(msg2)


