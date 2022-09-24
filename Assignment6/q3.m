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