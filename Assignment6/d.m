
%a)
[x,y]=meshgrid(-5:0.5:5)
fun=@(X,Y) (-8*X)+(X.^2)+(12*Y)+(4*Y.^2)-(2*X.*Y);
z=fun(x,y)

f1=figure
surf(x,y,z)

f2=figure
contour(x,y,z)

% i guess x=3 and y=0.5
%b)
myfun=@(X) (-8*X(1))+(X(1).^2)+(12*X(2))+(4*X(2).^2)-(2*X(1).*X(2));
x0=[0,0];
options=optimset('TolF',10^-6,'TolX',10^-6)
[xf,ffinal2,flag2,output] = fminsearch(myfun,x0,options)
xfinal2=xf(1)
yfinal2=xf(2)
iter2=output.iterations

%c)
%fminsearch uses the Nelder-Mead simplex algorithm