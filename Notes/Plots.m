% PLOTS - BASICS

% For taking discrete points in an interval (no of points=11 specified)
x=linspace(0,pi,11);
% for taking discrete points in an interval (spacing=0.1 specified)
x=[0:0.1:5];

% figure is used to separate figures
% plot is used to plot points here
% hold on is used to hold on for the next plot 
% 'g+-" means green plot, + marker, and solid lines

f1=figure;
y=cos(x);
plot(x,y,'g+-')
hold on
z=exp(-x);
plot(x,z,'c+:',MarkerEdgeColor="r")
hold off

% Subplots
f2=figure;
subplot(2,1,1);
plot(x,y,'g+-')
subplot(2,1,2);
plot(x,z,'c+:',MarkerEdgeColor="r")

% Semilog plot
f3=figure;
semilogx(x,z)

% For specifying legend
lgd = legend('experimental data','line','quadratic','sixth degree');
lgd.Location='southeast' ;

% Scatter plot
scatter(x3,y3)