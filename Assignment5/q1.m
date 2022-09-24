A=rand(3000,3000);
b=ones(3000,1);

tstart1 = tic;  
x1=A\b;
t1 = toc(tstart1)

tstart2 = tic;
x2=inv(A)*b;
t2=toc(tstart2)

tstart3 = tic;
x3=linsolve(A,b);
t3=toc(tstart3)

% x2 takes a lot of time when compared to x1 and x3. Even Matlab warns that
% inverse is slow and can be inaccurate

error1 = sum(abs(x1-x2))
error2 = sum(abs(x1-x3))
error3 = sum(abs(x2-x3))

% error in each case is the sum of absolute difference between the
% solutions
% error2 = 0 means x1 and x3 are same
% error1=error3 is not 0, hence x2 is a little bit different from x1 and x3

% since x3 is built in function, it can be assumed to be true
% x1 is same as x3
% x2 is not exactly the same as x3
% Hence, x1 is a better solution than x2 (both accuracy and time)

% x3 is slightly faster than x1, hence x3 is the best method overall
% linsolve is the best method

% We need to run it many times because the time taken may be affected by
% the performance of our computer system and other similar factors
