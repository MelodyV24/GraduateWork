clc
clear all

path = 'E:\毕业相关\大论文\实验数据\弯管\20181122卡箍松动程度FBG\FBG解调系统数据文件\数据文件\2018-11-22\9Mpa';
% path1 = 'E:\管路小组\数据处理\实验数据\20171127弯管松动实验\9Mpa\FBG解调系统数据文件\数据文件\2017-11-27\松动\修复跳点后文件';
nx=dir(path);%读取盖路径下的所有文件
nxx=nx(3:end);%去掉两个隐藏文件
n=length(nxx);%该路径下txt文件个数
figure;
tit={'正常470Nm','松动360Nm','松动300Nm','松动240Nm','松动180Nm','松动120Nm','松动60Nm'}
for i=1:7
     str=strcat(path,'\',nxx(i).name,'\3.txt');
   [~,~,~,~,~,F1,G1,H1,I1,J1,K1,L1,M1,N1,O1,P1,Q1]=textread(str,'%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f',2000,'headerlines',2003); %跳过3行开始读
   AA=1000*detrend(M1)/1.2;
   [f,fft_data]=plotfft(AA,2000);
    subplot(3,3,i);plot(f,fft_data);
    title(tit{i});
end



