clear variables;
close all;

i=complex(0,1);
% intervalle temporel
tmin=-5;tmax=5;Te=0.001;
t=tmin:Te:tmax;
N=length(t);
% signal f
% f=exp(-pi*t.^2).*cos(4*pi*t)
% f=porte(t)
% f=4*triangle(t/2)-2*triangle(t)
func=6; % La variable de func défini quelle expression de f on va utiliser : f définie dans le "case" de numéro la valeur de func

switch func
    case 1
        f=porte(t);
    case 2
        f=porte(t-2);
    case 3
        f=porte(t/3);
    case 4
        f=3*t.*exp(-2*pi*abs(x));
    case 5
        f=exp(-pi*t.^2).*cos(4*pi*t);
    case 6
        f=t./((1+9*t.^2).^2);
end

plot(t,f,'k'); % affichage (en noir)
% intervalle fréquentiel
nu_e=1/Te;
nu=linspace(-nu_e/2,nu_e/2,N);
% transformée de Fourier (initialisation)
tf=zeros(1,length(nu))
% calcul de la transformée de Fourier (utiliser commande trapz)
for k=1:N % pour chaque fréquence
tf(k)=trapz(t,(f.*exp(-2*i*pi*nu(k)*t)));
end
% affichage
figure(1);
subplot(311);plot(nu,real(tf),'k');xlim([-10,10]);
subplot(312);plot(nu,imag(tf),'k');xlim([-10,10]);
subplot(313);plot(nu,angle(tf),'k');xlim([-10,10]);