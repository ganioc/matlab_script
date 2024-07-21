% dtft_tst2.m
w=-1:0.001:1;
% ������������
n=0:30;
h=sinc(0.25*n);
x=2*cos(0.2*pi*n) + 3*sin(0.4*n*pi);

subplot(2,2,1);
plot(n,h);

% ��������Ӧ�������źŵ�DTFT,
Hjw=h*(exp(-j*pi).^(n'*w));
Xjw=x*(exp(-j*pi).^(n'*w));
% ����������е�DTFT,
Yjw=Xjw.*Hjw;
n1=0:2*length(n)-2; % ȷ��������еĳ���
dw=0.001*pi;    % ȷ���ֶ���͵Ĳ���,��������Ƶ�ʵļ��,
% ����ʹ������, ���IDTFT
y=(dw*Yjw*(exp(j*pi).^(w'*n1)))/(2*pi);
y1=conv(x,h);
subplot(2,2,2);
plot(w, abs(Hjw));
title('H');
xlabel('pi ����');
ylabel('���');

subplot(2,2,3);
plot(w, abs(Xjw));
title('X');
xlabel('pi ����');
ylabel('���');

subplot(2,2,4);
plot(w,abs(Yjw));
title('Y');
xlabel('pi ����');
ylabel('���');

figure;
subplot(2,1,1);
stem(abs(y));
title('ͨ��idtft�������������Y');
subplot(2,1,2);
stem(abs(y1));
title('ͨ��ʱ��������������������Y1');









