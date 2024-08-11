% qam_modu.m
M=16;
k=log2(M);
n=10000;
samp=1;  % ��������
x=randi([0,1],n,1);
stem(x(1:50),'filled');
title('���������������');
xlabel('��������');
ylabel('�źŷ���');
% �������Ʊ�������ÿ4����һ�飬���ų�k��?�еľ���
x4=reshape(x,k,length(x)/k);
xsym=bi2de(x4.', 'left-msb');

figure;
stem(xsym(1:50));
title('ʮ����������ź�');
xlabel('�ź�����');
ylabel('�źŷ���');

y=qammod(xsym, M);
scatterplot(y);
text(real(y) + 0.1, imag(y), dec2bin(xsym));
axis([-5,5,-5,5]);

EbN0=15;
snr=EbN0 + 10*log10(k) - 10*log10(samp); % �����
yn=awgn(y,snr, 'measured');
h=scatterplot(yn,samp,0,'b.');
hold on;
scatterplot(y,1,0,'k+',h);
title('�����ź�����ͼ');
legend('�����������ź�','���������ź�');
axis([-5,5,-5,5]);
hold on;
eyediagram(yn,2); % ��ͼ

yd=qamdemod(yn,M);
z=de2bi(yd,'left-msb');
z=reshape(z.',numel(z),1');
[number_of_errors,bit_error_rate]=biterr(x,z)



