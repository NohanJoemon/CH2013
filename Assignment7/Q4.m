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

