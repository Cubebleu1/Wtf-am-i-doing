clear variables;
close all; 


A=imread('barbara.jpg'); 
[a,b]=size(A); 
TFA_real=fftshift(fft2(A));
TFA_abs=abs(TFA_real);
TFA_int=log10(TFA_abs);   %On se débarasse de unint8 car l'image est déjà en niveau de gris
 
D=disque(a,b,60); %Disque pour filtrer : filtrage homogène dans l'espace (alors qu'une porte est unidirectionnelle)
C=1-D; %Disque pour le complémentaire
TFA_real_f=TFA_real.*C; %Transformée filtrée ( on utilise TFA_real, car si on filtrait le signal en valeur absolue, on ne filtrait pas les fréquences négatives !
A_f=abs(ifft2(TFA_real_f)); %Inverse de la transformée filtrée pour retrouver l'image filtrée





% Affichage
figure(1); hold on;
subplot(2,2,1); imagesc(A); colormap gray; 
subplot(2,2,3); imagesc(TFA_int);
subplot(2,2,2); imagesc(A_f);
subplot(2,2,4); imagesc(log10(abs(TFA_real_f)));