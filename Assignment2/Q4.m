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
