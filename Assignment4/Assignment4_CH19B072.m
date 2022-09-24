%% Question 1

p1=[4 0 3.2 0 -4];
p2=[4.6 -12 0 10];
p3=[1 -7 15 -9];

value1=polyval(p1,4.5)
value2=polyval(p2,4.5)
value3=polyval(p3,4.5)

r1=roots(p1)
r2=roots(p2)
r3=roots(p3)

%% Question 2

x3=[-3.00 -2.33 -1.67 -1.00 -0.33 0.33 1.00 1.67 2.33 3.00]
y3=[0.82 -0.77 -1.98 -1.26 0.46 1.11 0.43 0.01 0.68 1.10]

poly1=polyfit(x3,y3,1)
poly2=polyfit(x3,y3,2)
poly6=polyfit(x3,y3,6)

yv1=polyval(poly1,x3)
yv2=polyval(poly2,x3)
yv6=polyval(poly6,x3)

f1=figure;
scatter(x3,y3)
hold on 
plot(x3,polyval(poly1,x3))
hold on 
plot(x3,polyval(poly2,x3))
hold on 
plot(x3,polyval(poly6,x3))
lgd = legend('experimental data','line','quadratic','sixth degree');
lgd.Location='southeast' ;
hold off

%% Question 3

p=[1 -10 33 -36];
rootsofp=roots(p)

data=struct('a0',-36,'a1',33,'a2',-10,'a3',1);
x0=0;
f=@(x) myfun1(x,data);
options=optimset('TolF',1.e-2,'TolX',1.e-2);

[xfinal1 ffinal1 exitflag1 output1]=fzero(f,x0,options);
iter1=output1.iterations;

[xfinal2 ffinal2 exitflag2 output2]=fsolve(f,x0,options);
iter2=output2.iterations;

[xfinal3 ffinal3 exitflag3 output3]=fzero(f,x0);
iter3=output3.iterations;

[xfinal4 ffinal4 exitflag4 output4]=fsolve(f,x0);
iter4=output4.iterations;

% Observations:
% fsolve and fzero gives two different solutions, both which are roots of
% the given function.(This happens because we have multiple roots)
% If we use Matlab default tolerance values, the solution is better


%% Question 4

f=@(x) myfun2(x);
options=optimset('Display','iter','TolF',1.e-6,'MaxIter',10);

x01=[-1,-2]
[xfinal1 ffinal1 exitflag output jacob]=fsolve(f,x01,options);
Solution1=struct('x1',xfinal1(1),'x2',xfinal1(2),'f1',ffinal1(1),'f2',ffinal1(2),'jacobian',jacob,'exitflag',exitflag,'iterations',output.iterations)

x02=[-2,100]
[xfinal2 ffinal2 exitflag output jacob]=fsolve(f,x02,options);
Solution2=struct('x1',xfinal2(1),'x2',xfinal2(2),'f1',ffinal2(1),'f2',ffinal2(2),'jacobian',jacob,'exitflag',exitflag,'iterations',output.iterations)

% I think this solution fails because we set a limit on the maximum no of
% iterations. For the given initial guess, it may take a large no of
% iterations to converge

%% Functions

function f=myfun1(x,data)
    f=data.a0+data.a1*x+data.a2*x^2+data.a3*x^3;
end
function f=myfun2(x)
    f(1)=2*exp(x(1))+x(2);
    f(2)=3*x(1)^2 + 4*(x(2)^2)-8
end
