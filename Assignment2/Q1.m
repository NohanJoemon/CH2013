A=[-1 0 12];
B=[0 0 0];
for i=[1:3]
    if (A(i)<0)
        B(i)=A(i);
    elseif (A(i)==0)
        B(i)=A(i)+1;
    else
        B(i)=A(i)^2;   
    end
end
