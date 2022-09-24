C=[1 4.5 3.2 1.78 0 -9];
N=numel(C);
Sum2=sumofelements(C,N)

D=[1 4 5 9; -1 3 5 9; 8 2 1 6; 15 10 -2 10];
E=diag(D);
N2=numel(E);
Sum3=sumofelements(E,N2)

F=D(:,1);
N3=numel(F);
Sum4=sumofelements(F,N3)

function sum = sumofelements(C,N)
    sum=0;
    for i=1:N
        sum=sum+C(i);
    end
end