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
