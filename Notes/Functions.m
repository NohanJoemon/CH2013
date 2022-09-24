% FUNCTIONS

%% EXAMPLES

function error1=relativeerror(xnew,xold)
    error1=100*(abs((xnew-xold)/xnew));
end
[f,f1,f2]=myfun(X(i));
function [f,f1,f2] = myfun(x)
    f= x.^3 - 10*x.^2 +33*x - 36;
    f1=3*x.^2 - 20*x +33;
    f2=6*x-20;
end
