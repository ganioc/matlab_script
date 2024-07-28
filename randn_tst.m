% randn_tst.m

t=0:0.001:10;
x=sin(2*pi*t);
px=norm(x).^2/length(x)
snr=20;
pn=px./(10.^(snr./10))
n=sqrt(pn)*randn(1,length(x));
y=x+n;
subplot(2,1,1);
plot(t,x);
title('正弦信号');
subplot(2,1,2);
plot(t,y);
title('叠加了噪声后的正弦信号');



