% Q4
h=1;
x = 0:h:10000;     % t here                                   
y0 = 2.75;         % H here
Func = @(x1,y1)-0.000548144*(sqrt(y1)/(3*y1-y1.^2)) ; 
[xb,yb]=RK(Func,x,h,y0)
plot(real(xb),real(yb))

% From plot, we can see that yb =0 at around 7500seconds

function [x,y] = RK(Func,x,h,y0)
    y = zeros(1,length(x)); 
    y(1)=y0;
    for i=1:(length(x)-1)                              
        k1 = Func(x(i),y(i));
        k2 = Func(x(i)+0.5*h,y(i)+0.5*h*k1);
        k3 = Func((x(i)+0.5*h),(y(i)+0.5*h*k2));
        k4 = Func((x(i)+h),(y(i)+k3*h));
        y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4)*h;  
    end
end