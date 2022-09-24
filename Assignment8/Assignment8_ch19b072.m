%% Q1


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


%% Q2 

t=[0:0.1:10];

% analytical solution
yan = 2*exp(-t) - exp(-100*t);
zan = -exp(-t) + exp(-100*t);

% ode15s
y0 = [1 0];
[t,y] = ode15s(@(t,y) odefun(t,y), t, y0);
yode15s = y(:,1)
zode15s = y(:,2)

% plots
% y vs t
figure();
plot(t,yan);
hold on
plot(t,yode15s)
legend('analytical y','yode45')
% z vs t
figure();
plot(t,zan);
hold on
plot(t,zode15s)
legend('analytical z','zode45')
% Region at low t has sharp gradients as expected

function dydt = odefun(t,y)
    dydt = zeros(2,1);
    dydt(1) = 98*y(1) + 198*y(2);
    dydt(2) = -99*y(1) - 199*y(2);
end



%% Q3

% part (a)

% setting up A
A  = zeros(11);
A(1,1) = 1;
A(11,11) = 1;
for i=2:10
    A(i,i+1) = 1;
    A(i,i) = -2.15;
    A(i,i-1) = 1;
end   
% setting up b
b = zeros(11,1);
b(1) = 240;
b(11) = 150;
% Finding T
T=linsolve(A,b);
% plot
figure();
t=0:1:10;
plot(t,T)
legend("T vs t")

% part (b)

% setting up W
W  = zeros(6);
W(1,1) = 1;
W(6,6) = 1;
for i=2:5
    W(i,i+1) = 1; 
    W(i,i) = -2 + -0.15*4; % *4 is because h.^2 comes at the denominator of LHS which comes at the numerator of RHS
    W(i,i-1) = 1;
end   
% setting up b
c = zeros(6,1);
c(1) = 240;
c(6) = 150;
% Finding T
T2=linsolve(W,c);
% plot
figure();
t=0:2:10;
plot(t,T2);
legend("T2 vs t");

% part (c)
figure();
plot(0:1:10,T);
hold on
plot(0:2:10,T2);
legend("T vs t","T2 vs t")
