X=[0:0.1:5];
F=[];
for i=1:numel(X)
    [f,f1,f2]=myfun(X(i));
    F(i,1)=f;
    F(i,2)=f1;
    F(i,3)=f2;
end
F

G1=figure;
plot(X,F(:,1));
hold on
plot(X,F(:,2))
hold on
plot(X,F(:,3))
legend('f(x)','f^{''}(x)','f^{''''}(x)');

function [f,f1,f2] = myfun(x)
    f= x.^3 - 10*x.^2 +33*x - 36;
    f1=3*x.^2 - 20*x +33;
    f2=6*x-20;
end
