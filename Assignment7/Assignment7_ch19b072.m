%% Q 1

% Q1
clear
ll=0;
ul=3;

% a
% integral(0 to 3) (1-e^(-x)) = [x + e^(-x)] (0 to 3)
a = 3+exp(-3) - (0+exp(-0))

% b
hb = (ul-ll)/2;
b = hb*(f(ul)-f(ll))

% c
nc=4;
hc = (ul-ll)/nc;
xvaluesc = [ll:hc:ul];
Fc = f(xvaluesc);
c = (hc/2)*( Fc(1)+ 2*(sum(Fc(2:nc))) + Fc(nc+1))

% d
hd = (ul-ll)/2;
xvaluesd = [ll:hd:ul];
Fd = f(xvaluesd);
d = (hd/3)*(Fd(1)+4*Fd(2)+Fd(3))

% e 
ne = 4;
he = (ul-ll)/ne;
xvaluese = [ll:he:ul];
Fe = f(xvaluese);
e = (he/3)*( Fe(1)+ 4*(sum(Fe(2:2:ne))) + 2*(sum(Fe(3:2:ne-1))) + Fe(ne+1))

function y = f(x)
    y = 1-exp(-x);
end


%% Q 2

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


%% Q 3

% Q3
fun = @(t) sin(t)./t;

%quad
int_quad = quad(fun,0,2*pi)

%quad
int_quadl = quadl(fun,0,2*pi)


%% Q 4

% Q4

x = [0 1 2 3 4 5 6 7 8 9 10];
y = [1.4 2.1 3.3 4.8 6.8 6.6 8.6 7.5 8.9 10.9 10];
n=length(x);
h=x(2)-x(1);
fd=zeros(1,n-2);
sd=zeros(1,n-2);

%  Centered difference , O(h^2)
for i=2:n-1
    fd(i-1) = (y(i+1) - y(i-1))./(2*h);
    sd(i-1) = (y(i+1) - 2*y(i) + y(i-1))./(h^2);
end


