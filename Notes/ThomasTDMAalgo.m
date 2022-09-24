A=[13.422 0 0 0; -13.422 12.252 0 0; 0 -12.252 12.377 0 ; 0 0 -12.377 11.797];
b=[750.5;300;102;30];

X=ThomasMethod(A,b,size(A,1))

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