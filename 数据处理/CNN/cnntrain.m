function [Err,net,h,a] = cnntrain(net, x, y, opts,test_x,test_y)
    m = size(x, 3);
    numbatches = m / opts.batchsize;%迭代次数
    if rem(numbatches, 1) ~= 0
        error('numbatches not integer');
    end
    Err=[];
    net.rL = [];
    tic;
    for i = 1 : opts.numepochs
        disp(['epoch ' num2str(i) '/' num2str(opts.numepochs)]);
        
        kk = randperm(m);%产生无重复随机序列
        for l = 1 : numbatches  %训练每个batch
            batch_x = x(:, :, kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize));%第一个batchX数据
            batch_y = y(:,    kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize));%第一个batchY数据
            net = cnnff(net, batch_x);
            net = cnnbp(net, batch_y);
            net = cnnapplygrads(net, opts);
            if isempty(net.rL)
                net.rL(1) = net.L;
            end
            %net.rL是最小均方误差的平滑序列
            net.rL(end + 1) = 0.99 * net.rL(end) + 0.01 * net.L;
        end
        [er, bad,h,a] = cnntest(net, test_x, test_y);%获取每一轮的错误率
        Err=[Err,er];
    end
      disp('************************************************************************************************');
     toc;
end
