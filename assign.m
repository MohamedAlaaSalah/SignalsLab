clc
clear all
close all
load handel.mat
Ts=1/Fs;
q=length(y)-1;
%Sampling
t=0:0.001:q/1000;
N= length(t);
n=0:N-1;
figure()
plot(n.*Ts,y)
title('Sound without noise Time domain')
%Time to Freq domain
[fk,x]=fftsp(Fs,y);
figure()
stem(fk,x);
title('Fourier Transform no noise Freq domain')
%Adding Noise
y_m=y'+ 0.1*cos(2*pi*50*1*t) + 0.1*cos(2*pi*75*5*t)+ 0.1*cos(2*pi*500*5*t);
figure()
plot(n.*Ts,y_m)
title('Sound with noise Time domain')
%Time to Freq domain
[fk,x]=fftsp(Fs,y_m);
figure()
stem(fk,x);
title('FT Noise Freq domain')
%Removing Noise
Hd=Untitled;
y_m=filter(Hd,y_m);
xd=Bandstop;
y_m=filter(xd,y_m);
md=Bandstop2;
y_m=filter(md,y_m);
[fk,x]=fftsp(Fs,y_m);
figure()
stem(fk,x);%Final  Frequency domain
title('FT No Noise Freq domain')
figure()
plot(n.*Ts,y_m)
title('Sound After removing noise Time domain')
sound(y_m,Fs);