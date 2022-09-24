% Q3
fun = @(t) sin(t)./t;

%quad
int_quad = quad(fun,0,2*pi)

%quad
int_quadl = quadl(fun,0,2*pi)