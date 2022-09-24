% CH19B072 Assignment 3 submission
%% Question 1
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

%% Question 2

TolX=10.^-6;
TolF=10.^-12;


% INITIAL GUESS = 2
i=1;
x_old=inf;
x_new=2;
error1=100*abs(x_new-x_old)/abs(x_new);
[f,f1,f2]=myfun(x_new);

while (error1 > TolX || abs(myfun(x_new)) > TolF)
    i=i+1;
    x_old=x_new;
    [f,f1,f2]=myfun(x_old);
    x_new=x_new-f/f1;
    error1=100*abs(x_new-x_old)/abs(x_new);
end

xfinal1=x_new
ffinal1=myfun(x_new)
iter1=i
error1=100*abs(x_new-x_old)/abs(x_new)


% INITIAL GUESS = 100
i=1;
x_old=inf;
x_new=100;
error2=100*abs(x_new-x_old)/abs(x_new);
[f,f1,f2]=myfun(x_new);

while (error2 > TolX || abs(myfun(x_new)) > TolF)
    i=i+1;
    x_old=x_new;
    [f,f1,f2]=myfun(x_old);
    x_new=x_new-f/f1;
    error2=100*abs(x_new-x_old)/abs(x_new);
end

xfinal2=x_new
ffinal2=myfun(x_new)
iter2=i
error2=100*abs(x_new-x_old)/abs(x_new)

%% Question 3
reactiondata.k0=[0.001,0.34];
reactiondata.Eact=[12000,5600];
C1=0.1;
C2=0.01;

T=[300:100:1000];
rate1=[];
rate2=[];

for i=[1:numel(T)]
    [r1,r2]=reactionrate1(C1,C2,T(i),reactiondata);
    rate1(i)=r1;
    rate2(i)=r2;
end
G1=figure;
semilogy(T,rate1)
G2=figure;
semilogy(T,rate2)

%% Question 4

data=struct('a0',-36,'a1',33,'a2',-10,'a3',1);
x0=0;
f=@(x) myfun1(x,data);
options=optimset('Display','iter','TolF',1.e-6,'TolX',1.e-2);
[xfinal3 ffinal3 exitflag output]=fzero(f,x0,options);
iter3=output.iterations
function f=myfun1(x,data)
    f=data.a0+data.a1*x+data.a2*x^2+data.a3*x^3;
end

%% Functions
function [f,f1,f2] = myfun(x)
    f= x.^3 - 10*x.^2 +33*x - 36;
    f1=3*x.^2 - 20*x +33;
    f2=6*x-20;
end

function [r1,r2]=reactionrate1(C1,C2,T,reactiondata)
    R=8.314;
    k01=reactiondata.k0(1);
    Eact1=reactiondata.Eact(1);
    r1=k01*exp(-1*Eact1/(R*T))*C1*C2;
    
    k02=reactiondata.k0(2);
    Eact2=reactiondata.Eact(2);
    r2=k02*exp(-1*Eact2/(R*T))*C1*C2;
end


