% hilbert_tst.m
N=20;
n=0:N-1;
xn=cos(0.2*pi*n);
hxn=hilbert(xn)

%
Xk=fft(xn);
hXk=fft(hxn);
aXk=abs(Xk);
ahXk=abs(hXk);
pXk=phase(Xk);
phXk=phase(hXk);

k=0:N-1;
subplot(2,2,1);
stem(k,aXk);
xlabel('k');
title('FFT[x(n)]振幅');

subplot(2,2,2);
stem(k, pXk);
xlabel('k');
title('FFT[x(n)]相位');

subplot(2,2,3);
stem(k, ahXk);
xlabel('k');
title('Hilbert[x(n)]振幅');

subplot(2,2,4);
stem(k, phXk);
xlabel('k');
title('Hilbert[x(n)]相位');

% 验证
add=sum(xn.*hxn);
add




