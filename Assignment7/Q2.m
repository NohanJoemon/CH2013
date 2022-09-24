% Q2
x = [-2 0 2 4 6 8 10];
F = [35 5 -10 2 5 3 20];

h = x(2)-x(1);
n = length(x);

% Trapezoidal rule
int_trapz = (h/2)*( F(1)+ 2*(sum(F(2:n-1))) + F(n))

% Simpson's rule: 1/3
int_simp13 = (h/3)*( F(1)+ 4*(sum(F(2:2:n-1))) + 2*(sum(F(3:2:n-2))) + F(n))

% Simpson's rule: 3/8
indices=[2:n-1];
ind1=[4:3:n-1];
ind2=setdiff(indices,ind1);
int_simp38 = (3*h/8)*( F(1)+ 3*(sum(F(ind2))) + 2*(sum(F(ind1))) + F(n))