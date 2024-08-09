% pm_modu.m
t0=0.25;
tz=0.0005;
fc=200;
kf=50;
fz=1/tz;
t=[0:tz:t0];
df=0.25;
m=zeros(1,501);
for i=1:1:125
    m(i)=i;
end
for i=126:1:375
    m(i)=m(125) - i + 125;
end
for i=367:1:501
    m(i)=m(375) + i - 375;
end
m=m/50;
[M,m,df1]=fftseq(m,tz,df);
M=M/fz;
f=[0:df1:df1*(length(m)-1)] - fz/2;
for i=1:length(t)
    mn(i)=m(i);
end
u=cos(2*pi*fc*t + mn);
[U,u,df1]=fftseq(u,tz,df);
U=U/fz;
figure;
subplot(2,1,1);
plot(t,m(1:length(t)));
axis([0,0.25, -3,3]);
xlabel('时间');
title('信号波形');

subplot(2,1,2);
plot(t,u(1:length(t)));
axis([0,0.15,-2.1, 2.1]);
xlabel('时间');
title('调相信号的时域波形');
figure;
subplot(2,1,1);
plot(f,abs(fftshift(M)));
xlabel('频率');
title('信号的频谱');
subplot(2,1,2);
plot(f,abs(fftshift(U)));
xlabel('频率');
title('调相信号的频谱');



% m  - 输入的时间序列
% tz - 采样时间间隔，
% df - 频率分辨率
function [M,m,df]=fftseq(m,tz,df)
    fz=1/tz; % 采样频率
    if nargin==2
        n1=0;
    else
        n1=fz/df;  % 期望的频域采样点数
    end
    
    n2=length(m);
    n=2^(max(nextpow2(n1),nextpow2(n2)));
    % 计算出满足n1, n2,频域和时域采样点数，并是2的次方
    M=fft(m,n);  % 进行离散傅里叶变换，会对时域信号进行0扩展,按照n进行
    % 快速傅里叶变换
    m=[m,zeros(1,n-n2)];
    df=fz/n;
end


