function [f,fft_data] = plotfft( x , fsample)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Fs=fsample;
y=x-mean(x);        %去直流分量
 y=detrend(y);       %去低频趋势
L=length(y);         % FFT length
NFFT = 2^nextpow2(L); % Next power of 2 from length of 很容易理解
f=Fs/2*linspace(0,1,NFFT/2+1); % Frequency Vector
sig_fft=fft(y,NFFT)/NFFT;
fft_data=2*abs(sig_fft(1:NFFT/2+1));
Pha=angle(sig_fft(1:NFFT/2+1));
%figure
% plot(f,fft_data);title('频谱');
%figure
%plot(f,Pha);title('相位谱');
% grid on;
end

