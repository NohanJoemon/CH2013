% Fourth Order RK  

% part a
ha=0.25;
xa = 0:ha:5;                                        
y0a = 1;
Func1 = @(x1,y1) -2*x1.^3 + 12*x1.^2 - 20*x1 + 8.5 ; 
disp("Part a")
[xa,ya]=RK(Func1,xa,ha,y0a)
figure();
plot(xa,ya)

% part b
hb=0.25;
xb = 0:hb:5;                                        
y0b = 2;
Func2 = @(x2,y2) 4*exp(-0.8*x2) - 0.5*y2 ; 
disp("Part b")
[xb,yb]=RK(Func2,xb,hb,y0b)
figure();
plot(xb,yb)

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