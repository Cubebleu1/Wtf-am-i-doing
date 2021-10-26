clear variables;
close all;



i=complex(0,1);
t=-10:0.01:10;
N=length(t);
Te=0.01;
h=2*porte((1/4)*(t-1));
f=(t/2).*porte((t-1)*(1/2));
%h=exp((-5*t.^2)/2)
%f=exp((-10*t.^2)/2)
g=Te*conv(f,h, 'same');


nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N)
% transformée de Fourier (initialisation)
tf=zeros(1,length(nu));
th=zeros(1,length(nu));
% calcul de la transformée de Fourier (utiliser commande trapz)
for k=1:length(nu) % pour chaque fréquence
    tf(k)=trapz(t,(f.*exp(-2*i*pi*nu(k)*t)));
    th(k)=trapz(t,(h.*exp(-2*i*pi*nu(k)*t)));
end

U=tf.*th

% calcul de la transformée de Fourier inverse
for k=1:N
    tU_i(k)=trapz(nu,(U.*exp(2*i*pi*nu*t(k))));
end






figure(1);hold on;
subplot(311);plot(t,f);
subplot(312);plot(t,h);
subplot(313);plot(t,g);

figure(2);hold on;
subplot(311);plot(nu, real(tf));
subplot(312);plot(nu, real(th));
subplot(313);plot(nu, real(tU_i));
