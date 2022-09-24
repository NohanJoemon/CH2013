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
