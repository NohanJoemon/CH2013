
% part (a)
% analytical integration yields -x^4/2 + 4x^3 - 10x^2 + 8.5x + 10
x = [0,0.5,1,1.5,2,2.5,3,3.5,4];
yan = -x.^4/2 + 4*x.^3 - 10*x.^2 + 8.5*x + 10

% part (b)
h=0.5;
x = 0:0.5:4;
yEuler1=zeros(1,length(x));
yEuler1(1) = 10;
for i=1:length(x)-1
    yEuler1(i+1) = euler(h,x(i),yEuler1(i));
end

% part (c)
h=0.1;
x = 0:0.1:4;
yEuler2=zeros(1,length(x));
yEuler2(1) = 10;
for i=1:length(x)-1
    yEuler2(i+1) = euler(h,x(i),yEuler2(i));
end

% part (d)
f=figure();
plot([0,0.5,1,1.5,2,2.5,3,3.5,4],yan)
hold on
plot(0:0.5:4,yEuler1)
plot(0:0.1:4,yEuler2)
lgd = legend('analytical','yEuler1','yEuler2');
hold off

% part (e)
f=figure();
xspan = [0,0.5,1,1.5,2,2.5,3,3.5,4];
y0 = 10;
[x,yode45] = ode45(@(x,y) -2*x.^3 + 12*x.^2 - 20*x +8.5, xspan, y0);
plot(xspan,yan)
hold on
plot(xspan,yode45)
legend('analytical','yode45')
% yode45 is equal to analytical solution

function yiplus1 = euler(h,xi,yi)
    yiplus1 = yi+h*(-2*xi.^3 + 12*xi.^2 - 20*xi +8.5);
end