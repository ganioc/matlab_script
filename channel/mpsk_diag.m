% mpsk_diag.m
% QPSK
M=4;
%M=16;

data=randi([0,M-1],1000,1);
txSig=pskmod(data,M,pi/M);
rxSig=awgn(txSig,20);
scatterplot(rxSig)


