function [fk,x]=fftsp(Fs,y)
M=0;%padding
ts=1/Fs;
N=length(y);
x=ts*fft(y,N+M);%changing to freq domain
x=abs(fftshift(x));%shifting the signal in freq domain
n=0:N-1; fk=n*Fs/(N+M);%freq
fk=fk-(0.5*Fs);
end