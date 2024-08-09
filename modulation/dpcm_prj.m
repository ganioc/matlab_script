% dpcm_prj.m
n=2^3;
t=[0:100]*pi/20;
y=cos(t);
[predictor, codebook, partition]=dpcmopt(y,1,n);
[index,quant]=dpcmenco(y,codebook, partition, predictor);
[sig,equant]=dpcmdeco(index, codebook, predictor);
axis([-1,1,0,16]);
plot(t,y, t,equant, 'rp');
grid on;

