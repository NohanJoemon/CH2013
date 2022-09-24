%% QUESTION 1

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

%%  QUESTION 2

A=[13.422 0 0 0; -13.422 12.252 0 0; 0 -12.252 12.377 0 ; 0 0 -12.377 11.797];
b=[750.5;300;102;30];

X=ThomasMethod(A,b,size(A,1))



%% QUESTION 3

A=[4 3 7; 1 2 6; 2 0 4];
b=[3;5;1];

tstart=tic;

% decompose into L and U
[L,U,P]= lu(A)

% forward substitution
d = ((P.')*L)\b

% backward substitution
x=U\d

t_lu = toc(tstart);

%% QUESTION 4

Cdata=[0.24; 0.32; 0.70; 1.37; 1.58; 2.04; 2.26; 2.28; 2.39; 2.41]
rdata=[0.3839; 0.3935; 0.911; 1.4975; 1.5735; 1.749; 1.9355; 1.893; 1.970; 1.924]

% part a
P=polyfit(Cdata,rdata,2)
P1=P(1)
P2=P(2)
P3=P(3)
rmodel1 = polyval(P,Cdata)
residual1 = rmodel1-rdata
err1 = norm(residual1)

% partb
cf0 = [1.0 1.0];
fun = @(cf)(cf(1)*Cdata)./(cf(2)+ Cdata)-rdata;
[coeff,resnorm,residual2,exitflag,output] = lsqnonlin(fun,cf0)
Afinal=coeff(1)
Bfinal=coeff(2)
iterations=output.iterations
funccount=output.funcCount
rmodel2=residual2+rdata
err2=norm(residual2)

% partc
plot(Cdata,rdata,'r+',Cdata,rmodel1,'b-',Cdata,rmodel2,'g-')

% Result: Both fits have similar error and fits quite well with the data
% Conclusion: Both quadratic fit and the custom fit works well


%% FUNCTIONS

function X=ThomasMethod(A,b,n)
    % Initialise X
    X=zeros(n,1);
    
    % Extracting e,f,g from A
    e=zeros(n-1,1);
    f=zeros(n,1);
    g=zeros(n-1,1);
    for i=2:n
        e(i)=A(i,i-1);
        g(i)=A(i-1,i);
    end
    f=diag(A);
    
    % Decomposition (forward elimination)
    for i=2:n
        e(i) = e(i)/f(i-1);
        f(i) = f(i)-e(i)*g(i-1);
    end
    
    % Forward Substitution
    for i=2:n
        b(i) = b(i)-e(i)*b(i-1);
    end
    
    % Backward Substitution
    X(n)=b(n)/f(n);
    for i=(n-1):-1:1
        X(i)=(b(i)-g(i)*X(i+1))/f(i);
    end
end
