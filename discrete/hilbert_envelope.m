% hilbert_envelope.m
% ����ʱ����
ts=0.01;
% ����Ƶ��
fs=1/ts;
t=0:ts:10;

df=fs/length(t); % DFT��Ƶ�ʷֱ���
f=-50:df:50-df;  % ����Ƶ��ʸ��
% ��������
x=exp(-10*abs(t-5)).*cos(2*pi*20*t);
xa=hilbert(x);    % ���x(t)�Ľ����ź�xa(t), Ϊ����,

fcl=20;
% ��fc=20Hzʱ��ͨ�ź�
xl1=xa.*exp(-j*2*pi*fcl*t);
Xl1=fft(xl1)/fs; % ��fc=20ʱ��ͨ�źŵ�Ƶ��

% ����fc=20Hz��ͬ�������������,
subplot(2,1,1);
plot(t,real(xl1));
title('fc=20Hzʱ��ͨ�źŵ�ͬ�����');
xlabel('ʱ��t');

subplot(2,1,2);
plot(f,fftshift(abs(Xl1)));
title('fc=20Hz��ͨ�źŷ�����');
xlabel('Ƶ��f');

% ����fc=10Hz��ͬ�������������
fc2=10;
xl2=xa.*exp(-j*2*pi*fc2*t);
Xl2=fft(xl2)/fs;
figure;
subplot(2,1,1);
plot(t,real(Xl2));
title('fc=10Hzʱ��ͨ�źŵ�ͬ�����');
xlabel('ʱ��t');
subplot(2,1,2);
plot(f,fftshift(abs(Xl2)));
title('fc=10Hzʱ��ͨ�źŵķ�����');
xlabel('Ƶ��f');



