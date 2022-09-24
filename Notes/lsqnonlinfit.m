Cdata=[0.24; 0.32; 0.70; 1.37; 1.58; 2.04; 2.26; 2.28; 2.39; 2.41]
rdata=[0.3839; 0.3935; 0.911; 1.4975; 1.5735; 1.749; 1.9355; 1.893; 1.970; 1.924]

% lsqnonlin
cf0 = [1.0 1.0];
fun = @(cf)(cf(1)*Cdata)./(cf(2)+ Cdata)-rdata;
[coeff,resnorm,residual2,exitflag,output] = lsqnonlin(fun,cf0)
Afinal=coeff(1)
Bfinal=coeff(2)
iterations=output.iterations
funccount=output.funcCount
rmodel2=residual2+rdata
err2=norm(residual2)