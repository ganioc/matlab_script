% test_dpcm.m

t=[0:pi/60:2*pi];
x=sawtooth(3*t)
initcodebook=[-1:.1:1]
[predictor,codebook,partition]=dpcmopt(x,1,initcodebook)

% 使用dpcm来量化x
encodedx=dpcmenco(x, codebook, partition, predictor)
%恢复x
[decodedx, equant]=dpcmdeco(encodedx, codebook, predictor);
distor=sum((x-decodedx).^2)/length(x); %均方误差
plot(t,x,t,equant, '*');