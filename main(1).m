clc;
towers = 35;  % number of towers
length = 20;
width = 20;
seed = 5;
uni = 0;
ch = input("Enter 'u' for uniform radius and 'nu' for non uniform(random) radius",'s');
switch ch
    case 'u'
        uni = 1
    case 'un'
        uni = 0
end
[dimensions,lb,ub,x0] = cell_tower(towers,length,width,seed,uni);
tic
options = optimset;
%options = optimset(options,'PlotFcns' ,{  @optimplotfval @(x,itervals,flag) plotFcn(x,itervals,flag,dimensions) });
options = optimset(options,'Algorithm', 'active-set');
lambda = [1e-1,1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8,1e-9]
fnc_val = [];
l = size(lambda);
for i = 1:l
    [x,fval] = fmincon(@(x) objFcn(x,dimensions.R,lambda(i)),x0,[],[],[],[],lb,ub,[],options);
    fnc_val(end + 1) = fval;
end
t1 = toc;
fprintf('Elapsed time is %0.2f seconds.\n', t1);
%x
%fval
fcn_val