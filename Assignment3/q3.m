reactiondata.k0=[0.001,0.34];
reactiondata.Eact=[12000,5600];
C1=0.1;
C2=0.01;

T=[300:100:1000];
rate1=[];
rate2=[];

for i=[1:numel(T)]
    [r1,r2]=reactionrate1(C1,C2,T(i),reactiondata);
    rate1(i)=r1;
    rate2(i)=r2;
end
G1=figure;
semilogy(T,rate1)
G2=figure;
semilogy(T,rate2)
function [r1,r2]=reactionrate1(C1,C2,T,reactiondata)
    R=8.314;
    k01=reactiondata.k0(1);
    Eact1=reactiondata.Eact(1);
    r1=k01*exp(-1*Eact1/(R*T))*C1*C2;
    
    k02=reactiondata.k0(2);
    Eact2=reactiondata.Eact(2);
    r2=k02*exp(-1*Eact2/(R*T))*C1*C2;
end

