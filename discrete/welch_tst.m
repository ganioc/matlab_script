% welch_tst.m
fs=500;
t=0:1/fs:1;
F=0:1:fs; %  �����׹��Ƶ�Ƶ�ʷֱ��ʺͷ�Χ
xk=sin(2*pi*60*t) + 2*sin(2*pi*110*t) + randn(1, length(t));
% ��ȡʱ����ϵ���ɢ�ź���������
Pxx=abs(1/fs*fft(xk)).^2;
plot(F, 10*log10(Pxx));
xlabel('Ƶ��Hz');
ylabel('������');

