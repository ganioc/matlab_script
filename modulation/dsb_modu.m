% dsb_modu.m
t=0.15;
ts=0.001;
fc=250;
fs=1/ts;  % 采样频率
df=0.3;   % 频率分辨率
t1=[0:ts:t];  % 时间序列
m=[ones(1,t/(3*ts)), -2*ones(1, t/(3*ts)),zeros(1,t/(3*ts) +1)];
y=cos(2*pi*fc.*t1);



u=m.*y;
[n, m, df1]=fftseq(m,ts,df);
% 傅里叶变换
n=n/fs;

[ub,u,df1]=fftseq(u,ts,df);
ub=ub/fs;

[Y, y,df1]=fftseq(y,ts,df);
f=[0:df1:df1*(length(m)-1)] - fs/2;  % 频率矢量

%画图
subplot(2,2,1);
plot(t1,m(1:length(t1)));  % 未调试信号

subplot(2,2,2);
plot(t1, u(1:length(t1))); % 调制信号
title('调制信号');

subplot(2,2,3);
plot(f, abs(fftshift(n)));
title('未调制信号频谱');

subplot(2,2,4);
plot(f, abs(fftshift(ub)));
title('调制信号频谱');


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




