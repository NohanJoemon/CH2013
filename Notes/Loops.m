% LOOPS - for loop

%% FOR LOOP
X=0:0.1:5;
for i = 1:numel(X)
    fprintf("%i\n", i^2)
end

%% WHILE LOOP
while (error2 > TolX || abs(myfun(x_new)) > TolF)
    i=i+1;
    x_old=x_new;
    [f,f1,f2]=myfun(x_old);
    x_new=x_new-f/f1;
    error2=100*abs(x_new-x_old)/abs(x_new);
end