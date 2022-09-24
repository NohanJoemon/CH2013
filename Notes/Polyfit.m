Cdata=[0.24; 0.32; 0.70; 1.37; 1.58; 2.04; 2.26; 2.28; 2.39; 2.41]
rdata=[0.3839; 0.3935; 0.911; 1.4975; 1.5735; 1.749; 1.9355; 1.893; 1.970; 1.924]

% Polyfit
P=polyfit(Cdata,rdata,2)
P1=P(1)
P2=P(2)
P3=P(3)
rmodel1 = polyval(P,Cdata)
residual1 = rmodel1-rdata
err1 = norm(residual1)