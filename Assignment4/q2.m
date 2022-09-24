% Question 2

x3=[-3.00 -2.33 -1.67 -1.00 -0.33 0.33 1.00 1.67 2.33 3.00]
y3=[0.82 -0.77 -1.98 -1.26 0.46 1.11 0.43 0.01 0.68 1.10]

poly1=polyfit(x3,y3,1)
poly2=polyfit(x3,y3,2)
poly6=polyfit(x3,y3,6)

yv1=polyval(poly1,x3)
yv2=polyval(poly2,x3)
yv6=polyval(poly6,x3)

f1=figure;
scatter(x3,y3)
hold on 
plot(x3,polyval(poly1,x3))
hold on 
plot(x3,polyval(poly2,x3))
hold on 
plot(x3,polyval(poly6,x3))
lgd = legend('experimental data','line','quadratic','sixth degree');
lgd.Location='southeast' ;
hold off