% window_tst.m

fs=200; % ������
Delta_f = 1;  % Ƶ�ʷֱ���=1Hz
T=1/fs;  % ʱ��ֱ���
L=1/Delta_f; % ʱ���ȡ����
N=floor(fs/Delta_f) + 1; % ��ȡ�źŵĲ�������

t=0:T:L;
freq=0:Delta_f:fs; % ������Ƶ�ʷ�Χ
f_t=(sin(2*pi*50*t) + 0.*sin(2*pi*75*t))';
f_t_rectwin=rectwin(N).*f_t; % ʱ��Ӵ�
f_t_hamming=hamming(N).*f_t;
f_t_hann=hann(N).*f_t;

% ��N��DFT, ���Բ���ʱ����T�õ�Ƶ��
F_w_rectwin=T.*fft(f_t_rectwin, N) + eps;
F_w_hamming =T.*fft(f_t_hamming,N) + eps;
F_w_hann=T.*fft(f_t_hann) + eps;

% drawing
subplot(2,2,1);
plot(t,f_t);
title('origin signal');
subplot(2,2,2);
plot(t,f_t_rectwin);
title('���δ�');

subplot(2,2,3);
plot(t,f_t_hamming);
title('������');
subplot(2,2,4);
plot(t,f_t_hann);
title('������');

figure;
subplot(3,1,1);
semilogy(freq, abs(F_w_rectwin));
title('���δ�Ƶ��');
axis([0,200,1e-4 ,1]);
grid on;

subplot(3,1,2);
semilogy(freq, abs(F_w_hamming));
title('������Ƶ��');
axis([0,200,1e-4,1]);
grid on;

subplot(3,1,3);
semilogy(freq, abs(F_w_hann));
title('������Ƶ��');
axis([0,200,1e-4,1]);
grid on;







