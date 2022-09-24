clear
fun=@(X,Y) (-8*X)+(X.^2)+(12*Y)+(4*Y.^2)-(2*X.*Y);

% a part1
[x1,y1]=meshgrid(-5:0.5:5);
z1=fun(x1,y1);
f1=figure;
surf(x1,y1,z1)
f2=figure;
contour(x1,y1,z1)

% From contour plot, minimum occurs at approximately x=3 and y=-1 and
% minimum is around -25 (on careful inspection)


% b 
options=optimset("TolX",10.^(-6),"TolFun",10.^(-6));
fun2=@(X) (-8*X(1))+(X(1).^2)+(12*X(2))+(4*X(2).^2)-(2*X(1).*X(2));
[pfinal2,ffinal2,flag2,output2] = fminsearch(fun2,[0,0],options)
iter2=output2.iterations;
xfinal2=pfinal2(1)
yfinal2=pfinal2(2)


% c
% fminsearch uses Nelder-Mead simplex algorithm
