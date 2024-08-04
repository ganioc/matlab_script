% ssb_modu.m

t=0.15;
ts=1/1500;
fc=250;
fs=1/ts;
df=0.3;
t1=[0:ts:t];
m=[ones(1,t/(3*ts)),-2*ones(1,t/(3*ts)),zeros(1,t/(3*ts) + 1)];
c=cos(2*pi*fc.*t1);
u=m.*c;
y=u.*c;
[n,m,df1]=fftseq(m,ts,df);
n=n/fs;
[ub,u,df1]=fftseq(u,ts,df);
ub=ub/fs;
[Y,y,df1]=fftseq(y,ts,df);
Y=Y/fs;

f_c_off=150;  %  滤波器的截止频率
n_c_off=floor(150/df1);  
f=[0:df1:df1*(length(m) - 1)] - fs/2;  % 频率矢量
h=zeros(size(f));
h(1:n_c_off)=2*ones(1,n_c_off);
h(length(f) - n_c_off + 1: length(f))=2*ones(1,n_c_off);

dem1=h.*Y;  % 滤波器输出的频率
dem=real(ifft(dem1))*fs;
subplot(2,2,1);
plot(t1, m(1:length(t1)));
title('未解调信号');

subplot(2,2,2);
plot(t1, dem(1:length(t1)));
title('解调信号');

subplot(2,2,3);
plot(f,abs(fftshift(n)));
title('未解调信号的频谱');

subplot(2,2,4);
plot(f, abs(fftshift(dem1)));
title('解调信号频谱');


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
