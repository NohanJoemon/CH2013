% Solution for Assignment 1 - QN 3 

% (a)
num=10;
for i = 1:num
    fprintf("%i\n", i^2)
end
% (b)
v=[];
v(1)=0.1;
for j=1:6
    v(j+1)=exp(-v(j));
end
vfinal=v(7)
f=vfinal-exp(-vfinal)
% f is close to zero, hence the solution is good.


