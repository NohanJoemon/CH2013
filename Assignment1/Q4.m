% Solution for Assignment 1 - QN 4 

% (a)
x=linspace(0,pi,11);
% (b), (c)
f1=figure;
y=cos(x);
plot(x,y,'g+-')
hold on
z=exp(-x);
plot(x,z,'c+:',MarkerEdgeColor="r")
hold off
% (d)
f2=figure;
subplot(2,1,1);
plot(x,y,'g+-')
subplot(2,1,2);
plot(x,z,'c+:',MarkerEdgeColor="r")
% (e)
f3=figure;
semilogx(x,z)


