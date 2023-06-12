function [U, c] = equi_system(A, b)
    v = diag(A);

    if (det(A) == 0) | (v(find(v)) ~= v) | (size(A, 1) ~= size(A, 2))
        error("La matrice A non soddisfa le condizioni per applicare il metodo")
    end

    n = size(A, 1);

    Akp = zeros(size(A));
    Ak = A;
    c = b;
    
    for i = 2 : n
        Akp(i-1, i-1 : n) = Ak(i-1, i-1 : n);
        Akp(i : n, i-1) = 0;
        m = Ak(i : n, i-1) / Ak(i-1, i-1);
        Akp(i : n, i : n) = Akp(i : n, i : n) - m .* Ak(i-1, i : n);
    
        c(i : n) = c(i : n) - m * c(i-1);
        Ak = Akp;
    end

    U = Akp;
end