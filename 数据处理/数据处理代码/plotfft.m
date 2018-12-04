function [f,fft_data] = plotfft( x , fsample)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Fs=fsample;
y=x-mean(x);        %ȥֱ������
 y=detrend(y);       %ȥ��Ƶ����
L=length(y);         % FFT length
NFFT = 2^nextpow2(L); % Next power of 2 from length of ���������
f=Fs/2*linspace(0,1,NFFT/2+1); % Frequency Vector
sig_fft=fft(y,NFFT)/NFFT;
fft_data=2*abs(sig_fft(1:NFFT/2+1));
Pha=angle(sig_fft(1:NFFT/2+1));
%figure
% plot(f,fft_data);title('Ƶ��');
%figure
%plot(f,Pha);title('��λ��');
% grid on;
end

