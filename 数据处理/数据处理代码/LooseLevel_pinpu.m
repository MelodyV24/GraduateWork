clc
clear all

path = 'E:\��ҵ���\������\ʵ������\���\20181122�����ɶ��̶�FBG\FBG���ϵͳ�����ļ�\�����ļ�\2018-11-22\9Mpa';
% path1 = 'E:\��·С��\���ݴ���\ʵ������\20171127����ɶ�ʵ��\9Mpa\FBG���ϵͳ�����ļ�\�����ļ�\2017-11-27\�ɶ�\�޸�������ļ�';
nx=dir(path);%��ȡ��·���µ������ļ�
nxx=nx(3:end);%ȥ�����������ļ�
n=length(nxx);%��·����txt�ļ�����
figure;
tit={'����470Nm','�ɶ�360Nm','�ɶ�300Nm','�ɶ�240Nm','�ɶ�180Nm','�ɶ�120Nm','�ɶ�60Nm'}
for i=1:7
     str=strcat(path,'\',nxx(i).name,'\3.txt');
   [~,~,~,~,~,F1,G1,H1,I1,J1,K1,L1,M1,N1,O1,P1,Q1]=textread(str,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f',2000,'headerlines',2003); %����3�п�ʼ��
   AA=1000*detrend(M1)/1.2;
   [f,fft_data]=plotfft(AA,2000);
    subplot(3,3,i);plot(f,fft_data);
    title(tit{i});
end



