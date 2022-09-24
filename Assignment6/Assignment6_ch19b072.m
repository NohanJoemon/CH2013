%% 1
x=[0 0.4 0.8 1.2 1.6 2.0 2.4]
y=[0 0.1 0.5 1.0 1.8 2.7 14.0]
plot(x,y,"r+")

%% 2
x= [0 0.5 1.0 1.5 2.0 2.5];
y= [0 0.2 0.4 0.6 0.8 1.0];
z= [0 0 0 1 0.6 0.4
 0 0.0047 0.0374 0.1263 0.2994 0.5848
 0 0.0059 0.0472 0.1592 0.3772 0.7368
 0 0.0067 0.0540 0.1822 0.4318 0.8434
 0 0.0074 0.0594 0.2005 0.4753 0.9283
 0 0.0080 0.0640 0.2160 0.5120 1.0000];

% a
f1=figure();
surf(z)
f2=figure();
surf(x,y,z)
% In surf(z), it takes the indices of z as x and y values of plot
% In surf(x,y,z), it takes the given x and y variables as  x and y values of plot


% b
[x1,y1] = meshgrid(0:0.25:2.5,0:0.1:1);
z1 = interp2(x,y,z,x1,y1);

% c
z2 = interp2(x,y,z,x1,y1,'spline');

% d
f3=figure();
surf(x,y,z)
f4=figure();
surf(x1,y1,z1)
f5=figure();
surf(x1,y1,z2)

% contour plots:
f6=figure();
surfc(x,y,z)
f7=figure();
surfc(x1,y1,z1)
f8=figure();
surfc(x1,y1,z2)

%% 3
x=[0 0.4 0.8 1.2 1.6 2.0 2.4];
y=[0 0. 0.0 1.0 1.8 2.7 2.7];

% a
x1=[0:0.2:2.4];

% b
y1=interp1(x,y,x1,'spline');

% c
y2=interp1(x,y,x1,'nearest');

% d
y3 =spline(x,y,x1);
% There is no observable difference in y1 and y3. 
% But while comparing y1==y3, the 6th term does not match. This may be due to minor differences
y1==y3

% e
P=polyfit(x,y,4)
y4=polyval(P,x1)

% f
f1=figure();
plot(x,y,'r+')
hold on
plot(x1,y1,'b-')
hold on
plot(x1,y2,'g-')
hold on
plot(x1,y3,'y-')
hold on
plot(x1,y4,'c-')
lgd = legend('original data','spline interpolation using interp1','nearest neighbor interpolation','spline interpolation using spline','4th degree polyfit');
lgd.Location='southeast' ;

% g
pp =spline(x,y);
coefs=pp.coefs
size(coefs)
% size of coefs is 6 by 4

%% 4
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


%% 5
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
