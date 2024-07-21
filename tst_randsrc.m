% test randsrc function

counts=[99 1];
len=1000
seq=randsrc(1,len,[1 2; .99 .01])
code=arithenco(seq,counts)
dseq=arithdeco(code,counts,length(seq));
isequal(seq,dseq)

