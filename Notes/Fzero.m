% FZERO

data=struct('a0',-36,'a1',33,'a2',-10,'a3',1);
x0=0;
f=@(x) myfun1(x,data);
options=optimset('TolF',1.e-2,'TolX',1.e-2);

[xfinal1 ffinal1 exitflag1 output1]=fzero(f,x0,options);
iter1=output1.iterations;

function f=myfun1(x,data)
    f=data.a0+data.a1*x+data.a2*x^2+data.a3*x^3;
end