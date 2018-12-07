clc
clear all

path = 'F:\毕业相关\大论文\GraduateWork\实验数据\直管\FBG解调系统数据文件\数据文件\2018-12-06\9Mpa';
nx=dir(path);%读取盖路径下的所有文件
nxx=nx(3:end);%去掉两个隐藏文件
n=length(nxx);%该路径下txt文件个数

c0=[];
data=[];%所有数据
for i=1:n
  str1=strcat(path,'\',nxx(i).name);
  nx1=dir(str1);%读取盖路径下的所有文件
  nxx1=nx1(3:end);%去掉两个隐藏文件
  n1=length(nxx1);%该路径下txt文件个数
  for j=1:n1
    str=strcat(str1,'\',nxx1(j).name);
      disp(str);
    [~,~,~,~,~,F1,G1,H1,I1,J1,K1,L1,M1,N1]=textread(str,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f',108000,'headerlines',3); %跳过3行开始读
%     HH=1000*detrend(H1)/1.2;II=1000*detrend(I1)/1.2;JJ=1000*detrend(J1)/1.2;%通道2
%     KK=1000*detrend(K1)/1.2;LL=1000*detrend(L1)/1.2;MM=1000*detrend(M1)/1.2;%通道3
%     NN=1000*detrend(N1)/1.2;OO=1000*detrend(O1)/1.2;PP=1000*detrend(P1)/1.2;QQ=1000*detrend(Q1)/1.2;%通道1

%      AA(:,1)=1000*detrend(M1)/1.2;AA(:,2)=1000*detrend(N1)/1.2;AA(:,3)=1000*detrend(O1)/1.2;AA(:,4)=1000*detrend(P1)/1.2;
%      AA(:,5)=1000*detrend(G1)/1.2;AA(:,6)=1000*detrend(H1)/1.2;AA(:,7)=1000*detrend(I1)/1.2;
%      AA(:,8)=1000*detrend(J1)/1.2;AA(:,9)=1000*detrend(K1)/1.2;AA(:,10)=1000*detrend(L1)/1.2;%适用12,15Mpa
     
%      AA(:,1)=1000*detrend(N1)/1.2;AA(:,2)=1000*detrend(O1)/1.2;AA(:,3)=1000*detrend(P1)/1.2;AA(:,4)=1000*detrend(Q1)/1.2;
%      AA(:,5)=1000*detrend(H1)/1.2;AA(:,6)=1000*detrend(I1)/1.2;AA(:,7)=1000*detrend(J1)/1.2;
%      AA(:,8)=1000*detrend(K1)/1.2;AA(:,9)=1000*detrend(L1)/1.2;AA(:,10)=1000*detrend(M1)/1.2;
     
     AA(:,1)=1000*detrend(G1)/1.2;AA(:,2)=1000*detrend(H1)/1.2;AA(:,3)=1000*detrend(I1)/1.2;AA(:,4)=1000*detrend(J1)/1.2;AA(:,5)=1000*detrend(K1)/1.2;
     AA(:,6)=1000*detrend(L1)/1.2;AA(:,7)=1000*detrend(M1)/1.2;AA(:,8)=1000*detrend(N1)/1.2;%直管的
        for j=1:270
            I=reshape(AA((1+(j-1)*400):(400*j))',1,8*50);
            data_temp=mapminmax(I, 0, 255);
            data=[data;data_temp];
        end
  end
              
%        A1=AA(2001:4000);%看应变
%        subplot(7,1,i);plot(A1);
      A=G1(1:2000);%看波长
      subplot(7,1,i);plot(A);
end

l1=zeros(270,1);l2=ones(270,1);
label=[l2 l1 l1 l1 l1 l1;l1 l2 l1 l1 l1 l1;l1 l1 l2 l1 l1 l1;l1 l1 l1 l2 l1 l1;l1 l1 l1 l1 l2 l1;l1 l1 l1 l1 l1 l2];
save data data;
save label label;