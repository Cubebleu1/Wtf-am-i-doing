clear variables;
close all;

%Variables
i=complex(0,1);
N=2^12; %Nombre de valeur que l'on veut
Te=2/N; %2 est la longueur de l'intervalle (de -1 à 1)
t=-1:Te:1-Te %intervalle de -1 à 1-Te car 1 est exclus !
T1=2^(-5)
T2=2^(-6)



%Fonctions
p1=peigne(T1, t);
p2=peigne(T2, t);
[TP1,nup1]=TransFourier(p1, t);
[TP2,nup2]=TransFourier(p2, t);

s=exp(-pi*(t.^2)).*cos(2*pi*5*t);
z=s.*p2;

[TS, nus]=TransFourier(s,t);
[TZ, nuz]=TransFourier(z,t);





%Affichage
figure(1);hold on;
subplot(221);plot(t, p1);
subplot(223);plot(t, p2);
subplot(222);plot(nup1, TP1); xlim([-1000, 1000]);
subplot(224);plot(nup2, TP2); xlim([-1000, 1000]);

figure(2);hold on;
subplot(311);plot(t, s, 'red', t,z)
subplot(312);plot(nus, TS), xlim([-50, 50]);
subplot(313);plot(nuz, TZ); xlim([-500, 500]);


