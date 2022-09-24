% FSOLVE

% SINGLE VARIABLE

data=struct('a0',-36,'a1',33,'a2',-10,'a3',1);
x0=0;
f=@(x) myfun1(x,data);
options=optimset('TolF',1.e-2,'TolX',1.e-2);

[xfinal2 ffinal2 exitflag2 output2]=fsolve(f,x0,options);
iter2=output2.iterations;

function f=myfun1(x,data)
    f=data.a0+data.a1*x+data.a2*x^2+data.a3*x^3;
end


% TWO VARIABLES

f=@(x) myfun2(x);
options=optimset('Display','iter','TolF',1.e-6,'MaxIter',10);

x01=[-1,-2]
[xfinal1 ffinal1 exitflag output jacob]=fsolve(f,x01,options);
Solution1=struct('x1',xfinal1(1),'x2',xfinal1(2),'f1',ffinal1(1),'f2',ffinal1(2),'jacobian',jacob,'exitflag',exitflag,'iterations',output.iterations)

function f=myfun2(x)
    f(1)=2*exp(x(1))+x(2);
    f(2)=3*x(1)^2 + 4*(x(2)^2)-8
end