t=-5:0.01:5; 
f=exp(-2*t.^2).*cos(3*pi*t/2)./(pi*(1+4*t.^2)); 
plot(t,f); 