% modulation am.m

t=0.15;  % 信号持续时间
ts=0.001;% 采样间隔
fc=250;  % 载波频率
fs=1/ts; % 采样分辨率
df=0.3;  % 频率分辨率
a=0.6;   % 调制系数

t1=[0:ts:t];
delta_t=t/ts;
m=[ones(1,t/(3*ts)), -2*ones(1,t/(3*ts)), zeros(1,t/(3*ts) + 1)];
% 定义信号序列，时间序列

c=cos(2*pi*fc.*t1);
m1=m/max(abs(m)); % 调制信号, 取相对值
u=(1+a*m1).*c;    % 带调制信号的载波
[n,m,df1]=fftseq(m, ts, df);   % 傅里叶变换
% 输出为傅里叶变换频域序列, m 修改后的时域序列,频率分辨率
% 都为复数序列，复序列
fprintf("n length: %d\n", length(n));
n=n/fs;

[ub,u,df1]=fftseq(u,ts,df);  % 对调制信号的傅里叶变换
ub=ub/fs;

f=[0:df1:df1*(length(m)-1)] - fs/2;

subplot(2,2,1);
plot(t1,m(1:length(t1)));
title('未解调信号');

subplot(2,2,2)
plot(t1,u(1:length(t1)));
title('解调信号');

subplot(2,2,3);
plot(f,abs(fftshift(n)));
title('未解调信号的频谱');

subplot(2,2,4);
plot(f,abs(fftshift(ub)));
title('解调信号的频谱');

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


