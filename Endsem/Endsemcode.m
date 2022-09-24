%% Q1

% NEWTON RAPHSON METHOD
TolX=10.^(-3);
i=1;
x_old=inf;
x_new=-10;
errors1=[];
error1=abs(x_new-x_old)/abs(x_new);
errors1(1)=error1;
[f,f1,f2]=myfun(x_new);
while (error1 > TolX)
    i=i+1;
    x_old=x_new;
    [f,f1,f2]=myfun(x_old);
    x_new=x_new-f/f1;
    error1=abs(x_new-x_old)/abs(x_new);
    errors1(i)=error1;
end
xfinal1=x_new;
ffinal1=myfun(x_new);
iter1=i;
error1=abs(x_new-x_old)/abs(x_new);
q1=log(errors1(iter1)/errors1(iter1-1))/log(errors1(iter1-1)/errors1(iter1-2));
disp('No of iterations in Newton Raphson Method')
disp(iter1)
disp('Order of convergence')
disp(q1)
figure();
plot(1:iter1,errors1)

% MODIFIED NEWTON RAPHSON METHOD
TolX=10.^(-3);
i=1;
x_old=inf;
x_new=-10;
errors2=[];
error2=abs(x_new-x_old)/abs(x_new);
errors2(1)=error2;
[f,f1,f2]=myfun(x_new);
while (error2 > TolX)
    i=i+1;
    x_old=x_new;
    [f,f1,f2]=myfun(x_old);
    x_new=x_new-(f*f1)/(f1*f1-f*f2);
    error2=abs(x_new-x_old)/abs(x_new);
    errors2(i)=error2;
end
xfinal2=x_new;
ffinal2=myfun(x_new);
iter2=i;
error2=abs(x_new-x_old)/abs(x_new);
q2=log(errors2(iter2)/errors2(iter2-1))/log(errors2(iter2-1)/errors2(iter2-2));
disp('No of iterations in Modified Newton Raphson Method')
disp(iter2)
disp('Order of convergence ')
disp(q2)
figure();
plot(1:iter2,errors2)


% FUNCTION
function [f,f1,f2] = myfun(x)
    f= x.^3 - 5*x.^2 + 7*x - 3;
    f1=3*x.^2 - 10*x +7;
    f2=6*x-10;
end


%% Q2

N=3;
A=[2 -6 -1; -3 -1 7; -8 1 -2];
b=[-38; -24; -20];
x = zeros(N,1);
sum = 0;
xarray=[];
iter=0;
xarray(iter+1)=x;
while errorX<10^(-3)
    iter=iter+1;
    for i = 1:N
        t1 = b(i);
        t2 = 0;
        for j = 1:i-1
            t2=t2+A(i,j) * xarray(iter+1)
        end
        for j = i+1:N
            t2=t2+A(i,j) * xarray(iter)
        end
        
        x(i) = (t1-t2)/A(i,i);
    end
end

%% Q3
% Fourth Order RK  

% part a
ha=0.25;
xa = 0:ha:5;                                        
y0a = 1;
Func1 = @(x1,y1) -2*x1.^3 + 12*x1.^2 - 20*x1 + 8.5 ; 
disp("Part a")
[xa,ya]=RK(Func1,xa,ha,y0a)
figure();
plot(xa,ya)

% part b
hb=0.25;
xb = 0:hb:5;                                        
y0b = 2;
Func2 = @(x2,y2) 4*exp(-0.8*x2) - 0.5*y2 ; 
disp("Part b")
[xb,yb]=RK(Func2,xb,hb,y0b)
figure();
plot(xb,yb)

function [x,y] = RK(Func,x,h,y0)
    y = zeros(1,length(x)); 
    y(1)=y0;
    for i=1:(length(x)-1)                              
        k1 = Func(x(i),y(i));
        k2 = Func(x(i)+0.5*h,y(i)+0.5*h*k1);
        k3 = Func((x(i)+0.5*h),(y(i)+0.5*h*k2));
        k4 = Func((x(i)+h),(y(i)+k3*h));
        y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4)*h;  
    end
end

%% Q4

% Q4
h=1;
x = 0:h:10000;     % t here                                   
y0 = 2.75;         % H here
Func = @(x1,y1)-0.000548144*(sqrt(y1)/(3*y1-y1.^2)) ; 
[xb,yb]=RK(Func,x,h,y0)
plot(real(xb),real(yb))

% From plot, we can see that yb =0 at around 7500seconds

function [x,y] = RK(Func,x,h,y0)
    y = zeros(1,length(x)); 
    y(1)=y0;
    for i=1:(length(x)-1)                              
        k1 = Func(x(i),y(i));
        k2 = Func(x(i)+0.5*h,y(i)+0.5*h*k1);
        k3 = Func((x(i)+0.5*h),(y(i)+0.5*h*k2));
        k4 = Func((x(i)+h),(y(i)+k3*h));
        y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4)*h;  
    end
end
