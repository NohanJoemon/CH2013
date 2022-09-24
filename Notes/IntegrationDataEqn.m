%% INTEGRATION (DATA EQUATION) - quad and quadl (not recommended)

fun = @(t) sin(t)./t;
%quad
int_quad = quad(fun,0,2*pi)
%quad
int_quadl = quadl(fun,0,2*pi)

%% INTEGRATION (DATA EQUATION) - Single appl of Trapezoidal rule

ll=0;
ul=3;

hb = (ul-ll)/2;
b = hb*(f(ul)-f(ll))

function y = f(x)
    y = 1-exp(-x);
end

%% INTEGRATION (DATA EQUATION) - Multiple appl of Trapezoidal rule

ll=0;
ul=3;

nc=4;
hc = (ul-ll)/nc;
xvaluesc = [ll:hc:ul];
Fc = f(xvaluesc);
c = (hc/2)*( Fc(1)+ 2*(sum(Fc(2:nc))) + Fc(nc+1))

function y = f(x)
    y = 1-exp(-x);
end

%% INTEGRATION (DATA EQUATION) - Single appl of Simpson's 1/3 rule

ll=0;
ul=3;

hd = (ul-ll)/2;
xvaluesd = [ll:hd:ul];
Fd = f(xvaluesd);
d = (hd/3)*(Fd(1)+4*Fd(2)+Fd(3))

function y = f(x)
    y = 1-exp(-x);
end

%% INTEGRATION (DATA EQUATION) - Multiple appl of Simpson's 1/3 rule

ll=0;
ul=3;

ne = 4;
he = (ul-ll)/ne;
xvaluese = [ll:he:ul];
Fe = f(xvaluese);
e = (he/3)*( Fe(1)+ 4*(sum(Fe(2:2:ne))) + 2*(sum(Fe(3:2:ne-1))) + Fe(ne+1))

function y = f(x)
    y = 1-exp(-x);
end