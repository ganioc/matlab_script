% mpsk_simu.m
n=10000;  % ���͵ķ�����
T=1; % ��������
fs=100;  %  ��������
ts=1/fs;
t=0:ts:T-ts;
fc=10;    % �ز�Ƶ��
c=sqrt(2/T)*exp(j*2*pi*fc*t); % �ز��ź�
subplot(2,3,1);
plot(c,'g');
title('�ز��ź�');

c1=sqrt(2/T)*cos(2*pi*fc*t); % ͬ���ز�
c2=-sqrt(2/T)*sin(2*pi*fc*t); % �����ز�
M=8;
graycode=[0,1,2,3,6,7,4,5];
SNR=0:15;
snr1=10.^(SNR/10);
msg=randi(M, 1, n); % ������Ϣ����
subplot(2,3,2);
plot(msg);
title('�����ź�');

msg1=graycode(msg); % �������ʾΪ�����, ��ֵ��λ��ʾ
msgmod=pskmod(msg1,M).'; % ����8-psk����
subplot(2,3,3);
plot(msgmod, 'r');
title('��������');

tx=real(msgmod*c);
subplot(2,3,4);
plot(tx);
title('�ز�����');

tx1=reshape(tx.',1,length(msgmod)*length(c)); % ����������������
spow=norm(tx1).^2/n; %��ÿ�����ŵ�ƽ������
for indx=1:length(SNR)
    sigma=sqrt(spow/(2*snr1(indx))); % ���ݷ�������������
    rx=tx1+ sigma*randn(1,length(tx1));
    rx1=reshape(rx,length(c),length(msgmod));
    r1=(c1*rx1)/length(c1);
    r2=(c2*rx1)/length(c2);
    r=r1+j*r2;
    y=pskdemod(r,M); % 8psk���
    decmsg=graycode(y+1);
    [err, ber(indx)]=biterr(msg, decmsg);
    [err, ser(indx)]=symerr(msg, decmsg);
end
subplot(2,3,5);
plot(r,'k');
title('���������ѵ��ź�');

subplot(2,3,6);
plot(y);
title('8psk���');

figure(2);
ser1=2*qfunc(sqrt(2*snr1)*sin(pi/M)); % �����������
ber1=1/log2(M)*ser1;
semilogy(SNR, ber,'-ko', SNR, ser,'-r*',SNR,ser1,'', SNR,ber1,'-b');
title('8psk�ز������ź���AWGN�ŵ��µ�����');
xlabel('EsN0');
ylabel('������ʺ��������');
legend('�������', '�������', '�����������', '�����������');


