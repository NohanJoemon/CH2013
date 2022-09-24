
TolX=10.^-6;
TolF=10.^-12;


% INITIAL GUESS = 2
i=1;
x_old=inf;
x_new=2;
error1=100*abs(x_new-x_old)/abs(x_new);
[f,f1,f2]=myfun(x_new);

while (error1 > TolX || abs(myfun(x_new)) > TolF)
    i=i+1;
    x_old=x_new;
    [f,f1,f2]=myfun(x_old);
    x_new=x_new-f/f1;
    error1=100*abs(x_new-x_old)/abs(x_new);
end

xfinal1=x_new
ffinal1=myfun(x_new)
iter1=i
error1=100*abs(x_new-x_old)/abs(x_new)


% INITIAL GUESS = 100
i=1;
x_old=inf;
x_new=100;
error2=100*abs(x_new-x_old)/abs(x_new);
[f,f1,f2]=myfun(x_new);

while (error2 > TolX || abs(myfun(x_new)) > TolF)
    i=i+1;
    x_old=x_new;
    [f,f1,f2]=myfun(x_old);
    x_new=x_new-f/f1;
    error2=100*abs(x_new-x_old)/abs(x_new);
end

xfinal2=x_new
ffinal2=myfun(x_new)
iter2=i
error2=100*abs(x_new-x_old)/abs(x_new)


function [f,f1,f2] = myfun(x)
    f= x.^3 - 10*x.^2 +33*x - 36;
    f1=3*x.^2 - 20*x +33;
    f2=6*x-20;
end