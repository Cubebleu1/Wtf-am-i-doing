clear variables;
close all;

% Variables
t=-5:0.01:5;
Te=0.01;
N=length(t);
func =1;
switch func
    case 1
        f_0=exp(-5*pi*(t-1).^2)
        f_1=0.05*sin(2*pi*20*t)+0.02*sin(2*pi*45*t)
    case 2
        f_0=triangle(t)
        f_1=0.05*cos(2*pi*20*t)+0.02*cos(2*pi*45*t)
end
i=complex(0,1);
f=f_0 + f_1;

% intervalle fr�quentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N);


% transform�e de Fourier (initialisation)
tf=zeros(1,length(nu))
% calcul de la transform�e de Fourier (utiliser commande trapz)
for k=1:length(nu) % pour chaque fr�quence
    tf(k)=trapz(t,(f.*exp(-2*i*pi*nu(k)*t)));
end
tf_fil=tf.*porte(nu/80);

% calcul de la transform�e de Fourier inverse
for k=1:N
    tf_i(k)=trapz(nu,(tf_fil.*exp(2*i*pi*nu*t(k))));
end




% Affichage
figure(1); hold on;
subplot(311);plot(t,f);
subplot(312);plot(nu, imag(tf));
subplot(313);plot(nu,real(tf));

figure(2);
subplot(311);plot(nu,real(tf_fil),'k');
subplot(312);plot(nu,imag(tf_fil),'k');
subplot(313);plot(nu,tf_i,'k');
