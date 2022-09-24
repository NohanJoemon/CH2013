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