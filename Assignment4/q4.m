% Question 4

f=@(x) myfun1(x);
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

function f=myfun1(x)
    f(1)=2*exp(x(1))+x(2);
    f(2)=3*x(1)^2 + 4*(x(2)^2)-8
end