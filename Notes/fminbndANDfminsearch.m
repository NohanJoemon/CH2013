%% fminbnd

fun=@(x)(-1)*(2*sin(x)-(x.^2)/10);
options=optimset("TolX",10.^(-2),"TolFun",10.^(-12),"MaxIter",20);
[xfinal1,ffinal1,flag1,output1]=fminbnd(fun,4,8,options);
iter1=output1.iterations;
ffinal1=-1*ffinal1;

%% fminsearch

options=optimset("TolX",10.^(-6),"TolFun",10.^(-6));
fun2=@(X) (-8*X(1))+(X(1).^2)+(12*X(2))+(4*X(2).^2)-(2*X(1).*X(2));
[pfinal2,ffinal2,flag2,output2] = fminsearch(fun2,[0,0],options)
iter2=output2.iterations;
xfinal2=pfinal2(1)
yfinal2=pfinal2(2)

%% by inspection

fun=@(X,Y) (-8*X)+(X.^2)+(12*Y)+(4*Y.^2)-(2*X.*Y);

[x1,y1]=meshgrid(-5:0.5:5);
z1=fun(x1,y1);
f1=figure;
surf(x1,y1,z1)
f2=figure;
contour(x1,y1,z1)

