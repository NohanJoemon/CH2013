%% Problem 1
A=[-1 0 12];
B=[0 0 0];
for i=[1:3]
    if (A(i)<0)
        B(i)=A(i);
    elseif (A(i)==0)
        B(i)=A(i)+1;
    else
        B(i)=A(i)^2;   
    end
end

%% Problem 2

C=[1 4.5 3.2 1.78 0 -9];
N=numel(C);
Sum2=sumofelements(C,N)

D=[1 4 5 9; -1 3 5 9; 8 2 1 6; 15 10 -2 10];
E=diag(D);
N2=numel(E);
Sum3=sumofelements(E,N2)

F=D(:,1);
N3=numel(F);
Sum4=sumofelements(F,N3)


%% Problem 3
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


%% Problem 4
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



%% Functions
function sum = sumofelements(C,N)
    sum=0;
    for i=1:N
        sum=sum+C(i);
    end
end
function f = myfun(x)
    f=exp(0.5*x) -5 +5*x;
end
function error1=relativeerror(xnew,xold)
    error1=100*(abs((xnew-xold)/xnew));
end
function xnew = bisection(xl,xu)
    xnew= (xl+xu)/2;
end
function xnew = falseposition(xl,xu,fxl,fxu)
    xnew= (xl*fxu-xu*fxl)/(fxu-fxl);
end