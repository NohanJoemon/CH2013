% Q1
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