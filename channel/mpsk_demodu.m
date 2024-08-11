% mpsk_demodu.m
M=4;
dataIn=randi([0,3],1000,1);
txSig=pskmod(dataIn, M, pi/M);
rxSig=awgn(txSig, 10);

dataOut=pskdemod(rxSig, M, pi/M);
numErrs=symerr(dataIn, dataOut);
numErrs

