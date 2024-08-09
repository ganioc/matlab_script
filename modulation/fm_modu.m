% fm_modu.m
ts=0.001;
t=0:ts:10-ts;
fs=1/ts;
df=fs/length(t);
msg=randi([-3,3],100,1);
msg1=msg*ones(1,fs/10);
msg2=reshape(msg1.',1,length(t));
Pm=fft(msg2)/fs;
f=-fs/2:df:fs/2-df;

subplot(2,1,1);
plot(f,fftshift(abs(Pm)));
title('ԭʼ�ź�Ƶ��');

int_msg(1)=0;
for i=1:length(t) - 1
    int_msg(i+1)=int_msg(i)+msg2(i)*ts;
end
kf=50;
fc=300;
Sfm=cos(2*pi*fc*t + 2*pi*kf*int_msg);
Pfm=fft(Sfm)/fs;
subplot(2,1,2);
plot(f, fftshift(abs(Pfm)));
title('FM�ź�Ƶ��');

disp('�ѵ��źŹ���');
Pc=sum(abs(Sfm).^2)/length(Sfm)
disp('ԭʼ�źŹ���');
Ps=sum(abs(msg2).^2)/length(msg2)
fm=50;
disp('����ָ��');
betaf=kf*max(msg)/fm
disp('�����źŴ���');
W=2*(betaf+1)*fm


