% dsbsc_2.m

ts=0.0025;      % �źŲ���ʱ����
t=0:ts:5-ts;    % ʱ������
fs=1/ts;
df=fs/(length(t));  % Ƶ�ʷֱ���
f=-fs/2:df:fs/2-df;
msg=randi([-3,3],10,1);
msg1=msg*ones(1,fs/2);
msg2=reshape(msg1.', 1, length(t));
subplot(3,1,1);
plot(t,msg2);
title('ԭʼ�ź�');

fc=200;
Sdsb=msg2.*cos(2*pi*fc*t);
y=Sdsb.*cos(2*pi*fc*t);     %  ��ɽ��
Y=fft(y)./fs;
f_stop = 100;
n_stop=floor(f_stop/df);
Hlow=zeros(size(f));
Hlow(1:n_stop)=2;
Hlow(length(f)-n_stop+1:end)=2;
DEM=Y.*Hlow;
dem=real(ifft(DEM))*fs;
subplot(3,1,2);
plot(t,dem);
title('�������Ľ���ź�');

y1=awgn(Sdsb, 25, 'measured'); % �ź�ͨ��AWGN�ŵ�
y2=y1.*cos(2*pi*fc*t);
Y2=fft(y2)./fs;
DEM1=Y2.*Hlow;
dem1=real(ifft(DEM1))*fs;
subplot(3,1,3);
plot(t,dem1);
title('�����Ϊ24dBʱ�Ľ���ź�');




