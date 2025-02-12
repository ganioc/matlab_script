% reed_solomon_prj.m

% 输入参数
% Interleaver Design for Reed-Solomon Codes
n=255; % RS codeword length
k=235;  % number of data symbols
b=20;  % number of symbols expected to be corrupted by the channel

p=n-k; % Number of parity symbols
t=p/2;  % Error correction capability of RS code
fprintf('Given (%d,%d) Reed Solomon code can correct: %d symbol\n', ...
    n, k, fix(t));
fprintf(['Given - expected burst error length from the channel： '  ...
    '%d symbols\n'], b); 
disp('------------------------------------------');
if (b>t)
    fprintf('Interleaving May help in this scenario\n');
else
    fprintf('Interleaving will NOT help in this scenario\n');
end

D=ceil(b/t) + 1;  % interleaver Depth
memory = zeros(D,n);  % constructing block interleaver memory
data = 'THE_QuiCK_Brown_Fow_jumps_over_the_LAZY_DOG_';

% A constant pattern used as a data
% 如果n>数据长度，重复pattern, 使数据长度能够达到n
n_len = n/length(data)
data=char([repmat(data,[1,fix(n_len)]),...
    data(1:mod(n,length(data)))]);

% sending D blocks of similar data
intlvrInput=repmat(data(1:n),[1 D]);
fprintf('Input Data to the Interleaver ->\n');
disp(char(intlvrInput));
disp('---------------------------------------------');

% Interleaver
% Writing into the interleaver row by row
for index=1:D
    memory(index,1:end)=intlvrInput((index-1)*n+1:index*n);
end
intlvrOutput=zeros(1,D*n);

% Reading from the interleaver column by column
for  index=1:n
    intlvrOutput((index-1)*D+1:index*D)=memory(:,index);
end

% 生成 b symbols error at 25th Symbol location for test in the interleaved
% output。 '*' means error in this case
intlvrOutput(1,25:24+b)=zeros(1,b) + 42;
fprintf(['\nInterleaver Output after being corrupted by %d symbol burst error'...
'- marked by "*"->\n'],b);
disp(char(intlvrOutput));
disp('------------------------------------------\n');

% Deinterleaver, 去交织
deintlvrOutput=zeros(1,D*n);
% Writing into the deinterleaver col by col
for index=1:n
    memory(:,index)=intlvrOutput((index-1)*D+1:index*D)';
end

% Reading from the deinterleaver row by row
for index=1:D
    deintlvrOnput((index-1)*n+1:index*n)=memory(index,1:end);
end
fprintf('Deinterleaver Output->\n');
disp(char(deintlvrOnput));
disp('---------------------------------------------');

% 确实看到了错误的分开






