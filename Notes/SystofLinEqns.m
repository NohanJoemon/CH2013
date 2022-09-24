% Solving system of linear equations Ax=b

A=rand(3000,3000);
b=ones(3000,1);

% method 1
x1=A\b;

% method 2 (inaccurate and slow)
x2=inv(A)*b;

% method 3
x3=linsolve(A,b);