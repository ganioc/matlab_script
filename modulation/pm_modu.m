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
xlabel('ʱ��');
title('�źŲ���');

subplot(2,1,2);
plot(t,u(1:length(t)));
axis([0,0.15,-2.1, 2.1]);
xlabel('ʱ��');
title('�����źŵ�ʱ����');
figure;
subplot(2,1,1);
plot(f,abs(fftshift(M)));
xlabel('Ƶ��');
title('�źŵ�Ƶ��');
subplot(2,1,2);
plot(f,abs(fftshift(U)));
xlabel('Ƶ��');
title('�����źŵ�Ƶ��');



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


