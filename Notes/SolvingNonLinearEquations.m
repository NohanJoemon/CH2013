% SOLVING NON-LINEAR EQUATIONS - Bisection method, Regula-Falsi method,
% Newton Raphson

%% BISECTION METHOD

niter=200;
xl=0;
xu=2;
Err1=[];
for i=1:niter  
    xr(i)=bisection(xl,xu); 
    if(i>1)
        newerr=relativeerror(xr(i),xr(i-1));
        Err1 = [Err1; newerr];
        if (newerr<10^(-6) || abs(myfun(xr(i)))<10^(-6))
            xfinal1=xr(i)
            ffinal1=myfun(xr(i))
            lastiter=i;
            break;
        end
    end
    fl = myfun(xl);
    fu = myfun(xu);
    fr = myfun(xr(i)); 
    if (fl*fr < 0)
        xu=xr(i);
    else
        xl=xr(i);
    end    
end

f1=figure;
x=[1:lastiter-1]';
semilogx(x,Err1)

f2=figure;
x1=linspace(-5,5,1000);
plot(x1,myfun(x1))
% From the plot, we can see that f(x) is zero somewhere near 0.7. The final
% x value = 0.7142 and hence it makes sense
function f = myfun(x)
    f=exp(0.5*x) -5 +5*x;
end
function error1=relativeerror(xnew,xold)
    error1=100*(abs((xnew-xold)/xnew));
end
function xnew = bisection(xl,xu)
    xnew= (xl+xu)/2;
end

%% REGULA FALSI METHOD
niter=200;
xl=0;
xu=2;
Err2=[];
for i=1:niter  
    fxl = myfun(xl);
    fxu = myfun(xu);
    xr(i)=falseposition(xl,xu,fxl,fxu); 
    fxr = myfun(xr(i)); 
    if(i>1)
        newerr=relativeerror(xr(i),xr(i-1));
        Err2 = [Err2; newerr];
        if (newerr<10^(-6) || abs(myfun(xr(i)))<10^(-6))
            xfinal2=xr(i)
            ffinal2=myfun(xr(i))
            lastiter=i;
            break;
        end
    end

    if (fxl*fxr < 0)
        xu=xr(i);
    else
        xl=xr(i);
    end    
end

f1=figure;
x=[1:lastiter-1]';
plot(x,Err2)

f2=figure;
x1=linspace(-5,5,1000);
plot(x1,myfun(x1))

% On comparing the two methods (bisection and regula falsi), we observe
% that regula falsi converges much faster(in 4 iterations) than bisection
% method(in 18 iterations). 

function f = myfun(x)
    f=exp(0.5*x) -5 +5*x;
end
function error1=relativeerror(xnew,xold)
    error1=100*(abs((xnew-xold)/xnew));
end
function xnew = falseposition(xl,xu,fxl,fxu)
    xnew= (xl*fxu-xu*fxl)/(fxu-fxl);
end

%% NEWTON-RAPHSON METHOD

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

