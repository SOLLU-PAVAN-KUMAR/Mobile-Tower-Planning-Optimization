function [dim,lb,ub,x0] = cell_tower(N,len,wid,seed,u)
rng(seed);
if u == 1
    R = zeros(N,1);
    R = R + 1;
else
    R = rand(N,1)+1;
end

xL = 0; xU = len;
yL = 0; yU = wid;
lb = zeros(2*N,1);
ub = lb;
lb(1:2:2*N) = xL + R;
lb(2:2:2*N) = yL + R;
ub(1:2:2*N) = xU - R;
ub(2:2:2*N) = yU - R;
x = xU*rand(1,N);
y = yU*rand(1,N);
x0 = [x;y];
dim = struct('R', R, 'xL', xL, 'xU', xU, 'yL', yL, 'yU', yU);
end