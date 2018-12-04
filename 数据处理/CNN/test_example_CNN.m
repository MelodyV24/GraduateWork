% function [er, bad]=test_example_CNN
clear all
clc
%  load mnist_uint8;
% train_x = double(reshape(train_x',28,28,60000))/255;
% test_x = double(reshape(test_x',28,28,10000))/255;
% train_y = double(train_y');
% test_y = double(test_y');

 load E:\毕业相关\大论文\数据处理\数据与结果\管道粘贴FBG\15Mpa\MapSize\10\data  %数据
 load E:\毕业相关\大论文\数据处理\数据与结果\管道粘贴FBG\15Mpa\MapSize\10\label %标签
%  l1=zeros(525,1);l2=ones(525,1);
%  label=[l2 l1;l1 l2];
%  data=data([1:525 3151:3675],:);
%   data=data([1:1050 1576:2100 3151:3675],:);
  data=data([1:840 1261:1680 2521:2940],:);
  l1=zeros(420,1);l2=ones(420,1);
 label=[l2 l1 l1 l1;l1 l2 l1 l1;l1 l1 l2 l1;l1 l1 l1 l2;];
 Err=[];
 trainerr=[];
%%定义好训练集与测试集数量
rowNum=size(data,1);
trainSize=1350;  %训练集数量
testSize=rowNum-trainSize;%测试集数量
k=rand(1,rowNum);
[m,n]=sort(k);
%%读取测试集与训练集 二维数组 行数*28000
train_data=data(n(1:trainSize),:);
train_label=label(n(1:trainSize),:);
test_data=data(n(trainSize+1:rowNum),:);
test_label=label(n(trainSize+1:rowNum),:);
%%转成待训练形势 三维数组 14*2000*行数
train_x = double(reshape(train_data',10,10,trainSize))/255;
test_x = double(reshape(test_data',10,10,testSize))/255;
train_y = double(train_label');
test_y = double(test_label');

%% ex1 Train a 6c-2s-12c-2s Convolutional neural network 
%will run 1 epoch in about 200 second and get around 11% error. 
%With 100 epochs you'll get around 1.2% error
rand('state',0)
cnn.layers = {
       struct('type', 'i') %input layer
       struct('type', 'c', 'outputmaps', 4, 'kernelsize', 3) %convolution layer
       struct('type', 's', 'scale', 2) %sub sampling layer
        struct('type', 'c', 'outputmaps',4, 'kernelsize', 3) %convolution layer
%         struct('type', 's', 'scale', 2) %subsampling layer
};
opts.alpha = 1;
opts.batchsize = 25;%之前是144
opts.numepochs = 3000;
cnn = cnnsetup(cnn, train_x, train_y);
% [Err cnn] = cnntrain(cnn, train_x, train_y, opts,test_x,test_y);
[Err,cnn,Output_shiji,Output_qiwang] = cnntrain(cnn, train_x, train_y, opts,test_x,test_y);
R=zeros(length(label(1,:)),length(label(1,:)));;%错误分布矩阵，7代表分7类
for i=1:length(Output_qiwang)
    R(Output_qiwang(i),Output_shiji(i))=R(Output_qiwang(i),Output_shiji(i))+1;
end
trainerr=cnn.rL;
% if(kerl==3)
%     save testerror3 Err
%     save trainerror3 trainerr
% end
% if(kerl==6)
%     save testerror6 Err
%     save trainerror6 trainerr
% end
% if(kerl==10)
%      save testerror10 Err
%     save trainerror10 trainerr
% end
% if(kerl==20)
%      save testerror20 Err
%     save trainerror20 trainerr
% end
% if(batch==200)
%      save testerror200 Err
%     save trainerror200 trainerr
% [er, bad] = cnntest(cnn, test_x, test_y );
%  er
% Err=[Err,er]
%plot mean squared error
%  figure;  plot(cnn.rL); 
% disp('************************************************************************************************');
% assert(er<0.2, 'Too big error');
