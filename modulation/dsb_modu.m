% dsb_modu.m
t=0.15;
ts=0.001;
fc=250;
fs=1/ts;  % ����Ƶ��
df=0.3;   % Ƶ�ʷֱ���
t1=[0:ts:t];  % ʱ������
m=[ones(1,t/(3*ts)), -2*ones(1, t/(3*ts)),zeros(1,t/(3*ts) +1)];
y=cos(2*pi*fc.*t1);



u=m.*y;
[n, m, df1]=fftseq(m,ts,df);
% ����Ҷ�任
n=n/fs;

[ub,u,df1]=fftseq(u,ts,df);
ub=ub/fs;

[Y, y,df1]=fftseq(y,ts,df);
f=[0:df1:df1*(length(m)-1)] - fs/2;  % Ƶ��ʸ��

%��ͼ
subplot(2,2,1);
plot(t1,m(1:length(t1)));  % δ�����ź�

subplot(2,2,2);
plot(t1, u(1:length(t1))); % �����ź�
title('�����ź�');

subplot(2,2,3);
plot(f, abs(fftshift(n)));
title('δ�����ź�Ƶ��');

subplot(2,2,4);
plot(f, abs(fftshift(ub)));
title('�����ź�Ƶ��');


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




