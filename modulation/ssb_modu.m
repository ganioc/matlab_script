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

f_c_off=150;  %  �˲����Ľ�ֹƵ��
n_c_off=floor(150/df1);  
f=[0:df1:df1*(length(m) - 1)] - fs/2;  % Ƶ��ʸ��
h=zeros(size(f));
h(1:n_c_off)=2*ones(1,n_c_off);
h(length(f) - n_c_off + 1: length(f))=2*ones(1,n_c_off);

dem1=h.*Y;  % �˲��������Ƶ��
dem=real(ifft(dem1))*fs;
subplot(2,2,1);
plot(t1, m(1:length(t1)));
title('δ����ź�');

subplot(2,2,2);
plot(t1, dem(1:length(t1)));
title('����ź�');

subplot(2,2,3);
plot(f,abs(fftshift(n)));
title('δ����źŵ�Ƶ��');

subplot(2,2,4);
plot(f, abs(fftshift(dem1)));
title('����ź�Ƶ��');


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
