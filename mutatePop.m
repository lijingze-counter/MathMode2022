function p = mutatePop(x, mu)

    % µ•µ„±‰“Ï
    if rand <= mu
        n = numel(x);
        s = randi([1, n]);
        if x(s) == 0
            x(s) = 1;
        elseif x(s) == 1
            x(s) = 0;
        end
    end
    p = x;
    
end