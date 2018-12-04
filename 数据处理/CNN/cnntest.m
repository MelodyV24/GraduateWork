function [er, bad,h,a] = cnntest(net, test_x, test_y)
    %  feedforward
    net = cnnff(net, test_x);
    [~, h] = max(net.o);
    [~, a] = max(test_y);
    bad = find(h ~= a);

    er = numel(bad) / size(test_y, 2);
end
