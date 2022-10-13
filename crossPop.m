function [y1, y2] = crossPop(x1, x2)

    % µ¥µã½»²æ
    n = numel(x1);
    s = randi([1, n - 1]);
    
    y1 = [x1(1 : s) x2(s + 1: end)];
    y2 = [x2(1 : s) x1(s + 1: end)];
    
end