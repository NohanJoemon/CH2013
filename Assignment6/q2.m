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