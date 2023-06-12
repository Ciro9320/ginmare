function [x] = meg_backward(U, c)
    if (triu(U) ~= U)
        error("La matrice non è triangolarea superiore");
    else if (size(U, 1)) ~= size(U, 2)
        error("La matrice non è quadrata");
    end

    n = size(U, 1);

    x = zeros(size(c));

    x(n) = c(n) / U(n, n);

    for i = n-1 : -1 : 1
        x(i) = (c(i) - U(i, i+1 : n) * x(i+1 : n)) / U(i, i);
    end
end