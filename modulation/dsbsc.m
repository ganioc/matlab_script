% dsbsc.m

t=0.0025;  % �������
t=0:ts:10-ts;
fs=1/ts;
df=fs/(length(t));
msg=randi([-3,3],100,1);
msg1=msg*ones(1,fs/10);
msg2=reshape(msg1.',1,length(t));  % ��չ��ȡ���źŵ���ʽ
Pm=fft(msg2)/fs;   % ԭʼ�źŵ�Ƶ��
f=-fs/2:df:fs/2-df;
subplot(2,1,1);
plot(f,fftshift(abs(Pm)));
title('ԭʼ�ź�Ƶ��');

A=4;
fc=100;
Sdsb=msg2.*cos(2*pi*fc*t);  % �ѵ��ź�
Pdsb=fft(Sdsb)/fs;
subplot(2,1,2);
plot(f,fftshift(abs(Pdsb)));
title('DSBSC �ź�Ƶ��');
axis([-200,200,0,2]);
disp('�ѵ��źŹ���');
Pc=sum(abs(Sdsb).^2)/length(Sdsb) % �ѵ��źŹ���
disp('ԭʼ�źŹ���');
Ps=sum(abs(msg2).^2)/length(msg2) % ԭʼ�źŹ���


