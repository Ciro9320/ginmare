function [sequenza] = sequenza_log(x1, N)
    sequenza(1) = x1;
    for n = 1 : N - 1
        sequenza(n + 1) = 2^n * (sqrt(1 + (sequenza(n) / 2^(n-1))) - 1); 
    end
end