function [Err,net,h,a] = cnntrain(net, x, y, opts,test_x,test_y)
    m = size(x, 3);
    numbatches = m / opts.batchsize;%��������
    if rem(numbatches, 1) ~= 0
        error('numbatches not integer');
    end
    Err=[];
    net.rL = [];
    tic;
    for i = 1 : opts.numepochs
        disp(['epoch ' num2str(i) '/' num2str(opts.numepochs)]);
        
        kk = randperm(m);%�������ظ��������
        for l = 1 : numbatches  %ѵ��ÿ��batch
            batch_x = x(:, :, kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize));%��һ��batchX����
            batch_y = y(:,    kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize));%��һ��batchY����
            net = cnnff(net, batch_x);
            net = cnnbp(net, batch_y);
            net = cnnapplygrads(net, opts);
            if isempty(net.rL)
                net.rL(1) = net.L;
            end
            %net.rL����С��������ƽ������
            net.rL(end + 1) = 0.99 * net.rL(end) + 0.01 * net.L;
        end
        [er, bad,h,a] = cnntest(net, test_x, test_y);%��ȡÿһ�ֵĴ�����
        Err=[Err,er];
    end
      disp('************************************************************************************************');
     toc;
end
