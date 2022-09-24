% VECTORS AND MATRICES BASICS - initialisation, indexing, Matrix operations

% column vector
a=[1;4.5;9.6];

% row vector
b=[1.6,8,7.3];

% column vector of 1:n (' means transpose)
n=5;
c=[1:n]';

% vector addition
d=a'+b;

% vector indexing (starts from 1)
e=a(2);

% Matrix 
G=[7,2,-3;2,5,-3;1,-1,-6];

% Matrix inverse
H=inv(G);

%  Elementwise multiplication and regular matrix multiplication
Q=G.*P;
R=G*P;

% Identity matrix
S=eye(4);

% Matrix indexing
f=F(4,2)
% Extracting diagonal elements
t=diag(S);

% Extracting a column of matrix
u=P(:,3);