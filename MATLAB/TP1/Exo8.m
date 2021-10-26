clear variables;
close all;
 
n=300; 
m=n; 
  
figure(1); 
x=-n/2:n/2; 
y=x; 
lx=45; 
ly=20; 
M1=porte_2d(n,m, lx,ly); 
D1=disque(n,m,20);
D2=disque(n,m, 100);
subplot(1,2,1); 
%imshow(M1); 

TF_M1_real=abs(fft2(M1));
TF_M1_real=fftshift(TF_M1_real);
TF_M1_int=uint8(TF_M1_real);
%imshow(TF_M_int);

TF_D_real=abs(fft2(D2));
TF_D_real=fftshift(TF_D_real);
TF_D_int=uint8(TF_D_real);
%imshow(TF_D_int);


[x,y]=meshgrid(1:n,1:m); 
M=cos(0.5*x+0.5*y);
N=cos(1*x+1*y);

TF_M_real=fft2(M);
TF_M_real=abs(fftshift(TF_M_real));
TF_M_int=uint8(TF_M_real);

TF_N_real=fft2(N);
TF_N_real=abs(fftshift(TF_N_real));
TF_N_int=uint8(TF_N_real);


%Affichage
figure(1); hold on;
subplot(2,2,1);imshow(M);
subplot(2,2,2);imshow(TF_M_int);
subplot(2,2,3);imshow(N);
subplot(2,2,4);imshow(TF_N_int);






 