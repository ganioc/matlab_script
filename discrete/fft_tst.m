% fft_tst.m
Fs=1000; % ���е�Ƶ��
T=1/Fs;  % ��������
L = 1000;  % �źų���
t = (0:L-1)*T; % ʱ������
% ��������
S=0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
% ���Ӱ�����
X= S+ 2*randn(size(t));
subplot(3,1,1);
plot(1000*t(1:50), X(1:50));
title('�����������ź�');
xlabel('t ����');
ylabel('X(t)');

% ����fftʵ��Fourier�任
Y=fft(X);
% ���еĵ��߷�����
P2=abs(Y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f=Fs*(0:(L/2))/L;

subplot(3,1,2);
plot(f, P1);
title('X(t)���еĵ��ߴ�������');
xlabel('f(Hz)');
ylabel('|P1(f)|');


% ��δ���Ӱ��������źŽ���Fourier�任
Y=fft(S);
P2=abs(Y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
subplot(3,1,3);
plot(f,P1);
title('S(t)���еĵ��ߴ�������');
xlabel('f(Hz)');
ylabel('|P1(f)|');


