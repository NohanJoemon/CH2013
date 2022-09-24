% Solution for Assignment 1 - QN 2

% (a)
a=[1;4.5;9.6];
% (b)
b=[1.6,8,7.3];
% (c)
n=5;
c=[1:n]';
% (d)
d=a'+b;
% (e)
e=a(2);
% (f)
f=a(3)+b(2);
% (g)
G=[7,2,-3;2,5,-3;1,-1,-6];
% (h)
H=inv(G);
% (i)
z=[-12;-20;-26];
x=inv(G)*z;
% (j)
P=[2,5,-3;2,5,-3;1,-1,-6];
Pinv=inv(P);
% "Warning: Matrix is singular to working precision" means that the matrix P is singular, hence it is not invertible 
% (k)
Q=G.*P;
R=G*P;
% Q and R are not same because elementwise multiplication is different from
%  normal matrix multiplication
% (l)
S=eye(4);
% (m)
t=diag(S);
% (n)
u=P(:,3);

