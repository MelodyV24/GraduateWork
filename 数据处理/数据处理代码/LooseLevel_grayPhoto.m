clc
clear all

path = 'F:\��ҵ���\������\GraduateWork\ʵ������\ֱ��\FBG���ϵͳ�����ļ�\�����ļ�\2018-12-06\9Mpa';
nx=dir(path);%��ȡ��·���µ������ļ�
nxx=nx(3:end);%ȥ�����������ļ�
n=length(nxx);%��·����txt�ļ�����

c0=[];
data=[];%��������
for i=1:n
  str1=strcat(path,'\',nxx(i).name);
  nx1=dir(str1);%��ȡ��·���µ������ļ�
  nxx1=nx1(3:end);%ȥ�����������ļ�
  n1=length(nxx1);%��·����txt�ļ�����
  for j=1:n1
    str=strcat(str1,'\',nxx1(j).name);
      disp(str);
    [~,~,~,~,~,F1,G1,H1,I1,J1,K1,L1,M1,N1]=textread(str,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f',108000,'headerlines',3); %����3�п�ʼ��
%     HH=1000*detrend(H1)/1.2;II=1000*detrend(I1)/1.2;JJ=1000*detrend(J1)/1.2;%ͨ��2
%     KK=1000*detrend(K1)/1.2;LL=1000*detrend(L1)/1.2;MM=1000*detrend(M1)/1.2;%ͨ��3
%     NN=1000*detrend(N1)/1.2;OO=1000*detrend(O1)/1.2;PP=1000*detrend(P1)/1.2;QQ=1000*detrend(Q1)/1.2;%ͨ��1

%      AA(:,1)=1000*detrend(M1)/1.2;AA(:,2)=1000*detrend(N1)/1.2;AA(:,3)=1000*detrend(O1)/1.2;AA(:,4)=1000*detrend(P1)/1.2;
%      AA(:,5)=1000*detrend(G1)/1.2;AA(:,6)=1000*detrend(H1)/1.2;AA(:,7)=1000*detrend(I1)/1.2;
%      AA(:,8)=1000*detrend(J1)/1.2;AA(:,9)=1000*detrend(K1)/1.2;AA(:,10)=1000*detrend(L1)/1.2;%����12,15Mpa
     
%      AA(:,1)=1000*detrend(N1)/1.2;AA(:,2)=1000*detrend(O1)/1.2;AA(:,3)=1000*detrend(P1)/1.2;AA(:,4)=1000*detrend(Q1)/1.2;
%      AA(:,5)=1000*detrend(H1)/1.2;AA(:,6)=1000*detrend(I1)/1.2;AA(:,7)=1000*detrend(J1)/1.2;
%      AA(:,8)=1000*detrend(K1)/1.2;AA(:,9)=1000*detrend(L1)/1.2;AA(:,10)=1000*detrend(M1)/1.2;
     
     AA(:,1)=1000*detrend(G1)/1.2;AA(:,2)=1000*detrend(H1)/1.2;AA(:,3)=1000*detrend(I1)/1.2;AA(:,4)=1000*detrend(J1)/1.2;AA(:,5)=1000*detrend(K1)/1.2;
     AA(:,6)=1000*detrend(L1)/1.2;AA(:,7)=1000*detrend(M1)/1.2;AA(:,8)=1000*detrend(N1)/1.2;%ֱ�ܵ�
        for j=1:270
            I=reshape(AA((1+(j-1)*400):(400*j))',1,8*50);
            data_temp=mapminmax(I, 0, 255);
            data=[data;data_temp];
        end
  end
              
%        A1=AA(2001:4000);%��Ӧ��
%        subplot(7,1,i);plot(A1);
      A=G1(1:2000);%������
      subplot(7,1,i);plot(A);
end

l1=zeros(270,1);l2=ones(270,1);
label=[l2 l1 l1 l1 l1 l1;l1 l2 l1 l1 l1 l1;l1 l1 l2 l1 l1 l1;l1 l1 l1 l2 l1 l1;l1 l1 l1 l1 l2 l1;l1 l1 l1 l1 l1 l2];
save data data;
save label label;