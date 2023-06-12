function [x, w] = ptomed_composta(a, b, N)
    h = (b - a) / N;

    ex = a : h : b;
    x = (ex(1 : end - 1) + ex(2 : end)) / 2;
    x = x';

    w = ones(N, 1) * h;
end