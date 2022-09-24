% Question 3

p=[1 -10 33 -36];
rootsofp=roots(p)

data=struct('a0',-36,'a1',33,'a2',-10,'a3',1);
x0=0;
f=@(x) myfun1(x,data);
options=optimset('TolF',1.e-2,'TolX',1.e-2);

[xfinal1 ffinal1 exitflag1 output1]=fzero(f,x0,options);
iter1=output1.iterations;

[xfinal2 ffinal2 exitflag2 output2]=fsolve(f,x0,options);
iter2=output2.iterations;

[xfinal3 ffinal3 exitflag3 output3]=fzero(f,x0);
iter3=output3.iterations;

[xfinal4 ffinal4 exitflag4 output4]=fsolve(f,x0);
iter4=output4.iterations;

% Observations:
% fsolve and fzero gives two different solutions, both which are roots of
% the given function.(This happens because we have multiple roots)
% If we use Matlab default tolerance values, the solution is better

function f=myfun1(x,data)
    f=data.a0+data.a1*x+data.a2*x^2+data.a3*x^3;
end
