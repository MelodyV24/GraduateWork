clc
clear all

path = 'E:\��ҵ���\������\ʵ������\���\20181122�����ɶ��̶�FBG\FBG���ϵͳ�����ļ�\�����ļ�\2018-11-22\15Mpa';
nx=dir(path);%��ȡ��·���µ������ļ�
nxx=nx(3:end);%ȥ�����������ļ�
n=length(nxx);%��·����txt�ļ�����

c0=[];
data=[];%��������
tez=[];
for i=1:n
  str1=strcat(path,'\',nxx(i).name);
  nx1=dir(str1);%��ȡ��·���µ������ļ�
  nxx1=nx1(3:end);%ȥ�����������ļ�
  n1=length(nxx1);%��·����txt�ļ�����
  for j=1:3
    str=strcat(str1,'\',nxx1(j).name);
    disp(str);
    [~,~,~,~,~,F1,G1,H1,I1,J1,K1,L1,M1,N1,O1,P1]=textread(str,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f',4000,'headerlines',4003); %����3�п�ʼ��
%     HH=1000*detrend(H1)/1.2;II=1000*detrend(I1)/1.2;JJ=1000*detrend(J1)/1.2;%ͨ��2
%     KK=1000*detrend(K1)/1.2;LL=1000*detrend(L1)/1.2;MM=1000*detrend(M1)/1.2;%ͨ��3
%     NN=1000*detrend(N1)/1.2;OO=1000*detrend(O1)/1.2;PP=1000*detrend(P1)/1.2;QQ=1000*detrend(Q1)/1.2;%ͨ��1

     AA(:,1)=1000*detrend(M1)/1.2;AA(:,2)=1000*detrend(N1)/1.2;AA(:,3)=1000*detrend(O1)/1.2;AA(:,4)=1000*detrend(P1)/1.2;
     AA(:,5)=1000*detrend(G1)/1.2;AA(:,6)=1000*detrend(H1)/1.2;AA(:,7)=1000*detrend(I1)/1.2;
     AA(:,8)=1000*detrend(J1)/1.2;AA(:,9)=1000*detrend(K1)/1.2;AA(:,10)=1000*detrend(L1)/1.2;%����12,15Mpa
     
%      AA(:,1)=1000*detrend(N1)/1.2;AA(:,2)=1000*detrend(O1)/1.2;AA(:,3)=1000*detrend(P1)/1.2;AA(:,4)=1000*detrend(Q1)/1.2;
%      AA(:,5)=1000*detrend(H1)/1.2;AA(:,6)=1000*detrend(I1)/1.2;AA(:,7)=1000*detrend(J1)/1.2;
%      AA(:,8)=1000*detrend(K1)/1.2;AA(:,9)=1000*detrend(L1)/1.2;AA(:,10)=1000*detrend(M1)/1.2;   %ʹ��9Mpa

%      AA(:,1)=1000*detrend(N1)/1.2;AA(:,2)=1000*detrend(O1)/1.2;AA(:,3)=1000*detrend(P1)/1.2;AA(:,4)=1000*detrend(Q1)/1.2;
%      AA(:,5)=1000*detrend(H1)/1.2;AA(:,6)=1000*detrend(J1)/1.2;
%      AA(:,7)=1000*detrend(K1)/1.2;AA(:,8)=1000*detrend(L1)/1.2;AA(:,9)=1000*detrend(M1)/1.2;%9����
%         dacsd=multiPhase(AA);%³������
      dacsd= multiSEn(AA,0.15,2);%Ф������
     tez=[tez;dacsd];
  end
end
%   legend('470Nm','360Nm','300Nm','240Nm','180Nm','120Nm','60Nm');
   figure;
plot(tez);
