A=[4 3 7; 1 2 6; 2 0 4];
b=[3;5;1];

tstart=tic;

% decompose into L and U
[L,U,P]= lu(A)

% forward substitution
d = ((P.')*L)\b

% backward substitution
x=U\d

t_lu = toc(tstart);
