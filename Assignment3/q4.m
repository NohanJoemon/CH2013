data=struct('a0',-36,'a1',33,'a2',-10,'a3',1);
x0=0;
f=@(x) myfun1(x,data);
options=optimset('Display','iter','TolF',1.e-6,'TolX',1.e-2);
[xfinal3 ffinal3 exitflag output]=fzero(f,x0,options);
iter3=output.iterations
function f=myfun1(x,data)
    f=data.a0+data.a1*x+data.a2*x^2+data.a3*x^3;
end