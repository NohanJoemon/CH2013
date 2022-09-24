%% Applying Euler's method with h=0.5 to solve the ODE: dy/dx  = -2*x.^3 + 12*x.^2 - 20*x +8.5, y(0) = 10
h=0.5;
x = 0:0.5:4;
yEuler1=zeros(1,length(x));
yEuler1(1) = 10;
for i=1:length(x)-1
    yEuler1(i+1) = euler(h,x(i),yEuler1(i));
end

function yiplus1 = euler(h,xi,yi)
    yiplus1 = yi+h*(-2*xi.^3 + 12*xi.^2 - 20*xi +8.5);
end
%% Applying built-in function ode45 to solve the ODE: dy/dx  = -2*x.^3 + 12*x.^2 - 20*x +8.5, y(0) = 10
xspan = [0,0.5,1,1.5,2,2.5,3,3.5,4];
y0 = 10;
[x,yode45] = ode45(@(x,y) -2*x.^3 + 12*x.^2 - 20*x +8.5, xspan, y0);
% yode45 is the solution

%% Applying built-in function ode15s to solve the ODE: dy/dt  = 98y+198z, dz/dt = -99y-199z, y(0)=1,z(0)=1
t=[0:0.1:10];
y0 = [1 0];
[t,y] = ode15s(@(t,y) odefun(t,y), t, y0);
yode15s = y(:,1)
zode15s = y(:,2)

function dydt = odefun(t,y)
    dydt = zeros(2,1);
    dydt(1) = 98*y(1) + 198*y(2);
    dydt(2) = -99*y(1) - 199*y(2);
end

%% Finite Difference based method for solution of BVP-ODE: d2T/dt2 = 0.15T, T(0) =240, T(10) = 150

% ============================== h=1 ===============================
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


% ============================== h=2 ===============================
% setting up W
W  = zeros(6);
W(1,1) = 1;
W(6,6) = 1;
for i=2:5
    W(i,i+1) = 1; 
    W(i,i) = -2 + -0.15*4; % *4 is because h.^2 comes at the denominator of LHS which comes at the numerator of RHS
    W(i,i-1) = 1;
end   

% setting up c
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

