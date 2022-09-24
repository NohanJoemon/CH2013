% a

x=[0:0.01:8];
y=2*sin(x)-(x.^2)/10;
plot(x,y)

fun=@(x)(-1)*(2*sin(x)-(x.^2)/10);
options=optimset("TolX",10.^(-2),"TolFun",10.^(-12),"MaxIter",20);
[xfinal1,ffinal1,flag1,output1]=fminbnd(fun,4,8,options);
iter1=output1.iterations;
ffinal1=-1*ffinal1;

% b 
options=optimset("TolX",10.^(-2),"TolFun",10.^(-12),"MaxIter",5);
[xfinal2,ffinal2,flag2,output2]=fminbnd(fun,4,8,options);
iter2=output2.iterations;
ffinal2=-1*ffinal2;
flag2
% exitflag is 0 in this case
% fminbnd is based on golden section search and parabolic interpolation

% c
% Maybe we could find the derivative of the function using suitable matlab
% command and then find root of the derivative using fzero (and later check
% if it is  max or min using sign of 2nd derivative at root)