% modulation am.m

t=0.15;  % �źų���ʱ��
ts=0.001;% �������
fc=250;  % �ز�Ƶ��
fs=1/ts; % �����ֱ���
df=0.3;  % Ƶ�ʷֱ���
a=0.6;   % ����ϵ��

t1=[0:ts:t];
delta_t=t/ts;
m=[ones(1,t/(3*ts)), -2*ones(1,t/(3*ts)), zeros(1,t/(3*ts) + 1)];
% �����ź����У�ʱ������

c=cos(2*pi*fc.*t1);
m1=m/max(abs(m)); % �����ź�, ȡ���ֵ
u=(1+a*m1).*c;    % �������źŵ��ز�
[n,m,df1]=fftseq(m, ts, df);   % ����Ҷ�任
% ���Ϊ����Ҷ�任Ƶ������, m �޸ĺ��ʱ������,Ƶ�ʷֱ���
% ��Ϊ�������У�������
fprintf("n length: %d\n", length(n));
n=n/fs;

[ub,u,df1]=fftseq(u,ts,df);  % �Ե����źŵĸ���Ҷ�任
ub=ub/fs;

f=[0:df1:df1*(length(m)-1)] - fs/2;

subplot(2,2,1);
plot(t1,m(1:length(t1)));
title('δ����ź�');

subplot(2,2,2)
plot(t1,u(1:length(t1)));
title('����ź�');

subplot(2,2,3);
plot(f,abs(fftshift(n)));
title('δ����źŵ�Ƶ��');

subplot(2,2,4);
plot(f,abs(fftshift(ub)));
title('����źŵ�Ƶ��');

% m  - �����ʱ������
% tz - ����ʱ������
% df - Ƶ�ʷֱ���
function [M,m,df]=fftseq(m,tz,df)
    fz=1/tz; % ����Ƶ��
    if nargin==2
        n1=0;
    else
        n1=fz/df;  % ������Ƶ���������
    end
    
    n2=length(m);
    n=2^(max(nextpow2(n1),nextpow2(n2)));
    % ���������n1, n2,Ƶ���ʱ���������������2�Ĵη�
    M=fft(m,n);  % ������ɢ����Ҷ�任�����ʱ���źŽ���0��չ,����n����
    % ���ٸ���Ҷ�任
    m=[m,zeros(1,n-n2)];
    df=fz/n;
end


