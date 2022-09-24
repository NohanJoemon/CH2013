% BASICS - Variables, Operators, Rounding, Printing in two formats

% Variable assignment
a=4.556789;
b=5.678342;

% Operators
sum1=a+b; 
difference1=a-b;
product1=a*b;
power1=a.^b;

% Rounding
sum2=round(sum1,3,"significant");
difference2=round(difference1,3,"significant");
product2=round(product1,3,"significant");
power2=round(power1,3,"significant");

% Printing in two formats
fprintf('%.3f\n', 1.4986)
fprintf('%.2e\n', 1.4986)