clear variables;
close all;


% Variables
i=complex(0,1);
t=-20:0.01:20;
Te=0.005;
N=length(t);
s_0=1/4
s_1=1/16
s_2=1/64
g_0=(1/(s_0*((2*pi)^(1/2))))*exp((-t.^2)/(2*(s_0^2)));
g_1=(1/(s_1*((2*pi)^(1/2))))*exp((-t.^2)/(2*(s_1^2)));
g_2=(1/(s_2*((2*pi)^(1/2))))*exp((-t.^2)/(2*(s_2^2)));


h=exp(-pi*(t.^2)).*cos(2*pi*5*t);

y_0=conv(h,g_0, 'same');
y_0=y_0/max(y_0);
y_1=conv(h,g_1, 'same');
y_1=y_1/max(y_1);
y_2=conv(h,g_2, 'same');
y_2=y_2/max(y_2);


% intervalle fr�quentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N);


% transform�e de Fourier (initialisation)
tg0=zeros(1,length(nu));
tg1=zeros(1,length(nu));
tg2=zeros(1,length(nu));
th=zeros(1,length(nu));
% calcul de la transform�e de Fourier (utiliser commande trapz)
for k=1:length(nu) % pour chaque fr�quence
    tg0(k)=trapz(t,(g_0.*exp(-2*i*pi*nu(k)*t)));
    tg1(k)=trapz(t,(g_1.*exp(-2*i*pi*nu(k)*t)));
    tg2(k)=trapz(t,(g_2.*exp(-2*i*pi*nu(k)*t)));
    th(k)= trapz(t,(h.*exp(-2*i*pi*nu(k)*t)));
end

%figure(1);hold on;
%subplot(231);plot(t, g_0);xlim([-4, 4]);
%subplot(232);plot(t, g_1); xlim([-4, 4]);
%subplot(233);plot(t, g_2); xlim([-4, 4]);
%subplot(234);plot(nu, tg0); xlim([-10, 10]);
%subplot(235);plot(nu, tg1); xlim([-10, 10]);
%subplot(236);plot(nu, tg2); xlim([-10, 10]);

figure(2);hold on;
subplot(311);plot(t, h, 'red', t , y_0); xlim([-4, 4]);
subplot(312);plot(t, h, 'red', t, y_1); xlim([-5, 5]);
subplot(313);plot(t, h, 'red', t, y_2); xlim([-5, 5]);



