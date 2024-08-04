% am modu, 2nd case

ts=0.0025;          % �źŲ���ʱ����
t=0:ts:5-ts;        % ʱ������
fs=1/ts;            % ����Ƶ��, 400Hz,
msg=randi([-3,3],10,1);  % ����ԭʼ�źţ��������123
msg1=msg*ones(1,fs/2);   % ��չ��ȡ���ź���ʽ�� 10x200��һ������,
msg2=reshape(msg1.',1,length(t)); % ����ʲô��˼?
fprintf("msg2 length: %d\n", length(msg2));  %  2000

subplot(3,1,1);
plot(t,msg2);
title('ԭʼ�ź�');

A=4;
fc=200;         % �ز�Ƶ��
Sam=(A+msg2).*cos(2*pi*fc*t);  %  �ѵ��ź�
dems=abs(hilbert(Sam)) - A;    %  ����첨��ȥ��ֱ������
subplot(3,1,2);
plot(t,dems);
title('�������Ľ���ź�');

y=awgn(Sam, 24, 'measured');
dems2=abs(hilbert(y)) - A;
subplot(3,1,3);
plot(t,dems2);
title('�����Ϊ24dBʱ�Ľ���ź�');





