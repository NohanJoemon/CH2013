% Solution for Assignment 1 - QN 1 

% (a)
a=4.556789;
b=5.678342;
% (b)
sum1=a+b;
% (c)
difference1=a-b;
% (d)
product1=a*b;
% (e)
power1=a.^b;
% (f)
sum2=round(sum1,3,"significant");
difference2=round(difference1,3,"significant");
product2=round(product1,3,"significant");
power2=round(power1,3,"significant");
% (g)
fprintf('%.3f\n', 1.4986)
fprintf('%.2e\n', 1.4986)
% In first case, answer is 1.499 because we round it to 3 decimal places
% in float and in second case, answer is 1.50e+00 because we round it to 2
% decimal places in exponential style.
