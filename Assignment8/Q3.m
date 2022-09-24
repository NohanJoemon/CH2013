% part (a)

% setting up A
A  = zeros(11);
A(1,1) = 1;
A(11,11) = 1;
for i=2:10
    A(i,i+1) = 1;
    A(i,i) = -2.15;
    A(i,i-1) = 1;
end   
% setting up b
b = zeros(11,1);
b(1) = 240;
b(11) = 150;
% Finding T
T=linsolve(A,b);
% plot
figure();
t=0:1:10;
plot(t,T)
legend("T vs t")

% part (b)

% setting up W
W  = zeros(6);
W(1,1) = 1;
W(6,6) = 1;
for i=2:5
    W(i,i+1) = 1; 
    W(i,i) = -2 + -0.15*4; % *4 is because h.^2 comes at the denominator of LHS which comes at the numerator of RHS
    W(i,i-1) = 1;
end   
% setting up b
c = zeros(6,1);
c(1) = 240;
c(6) = 150;
% Finding T
T2=linsolve(W,c);
% plot
figure();
t=0:2:10;
plot(t,T2);
legend("T2 vs t");

% part (c)
figure();
plot(0:1:10,T);
hold on
plot(0:2:10,T2);
legend("T vs t","T2 vs t")
