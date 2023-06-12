function x = lu_solver(A, b)
    if (size(A, 1) ~= size(A, 2))
        error("matrice A non quadrata")
    else
        if det(A) == 0
            error("matrice A non invertibile")
        else
            [L, U, P] = lu(A);
            y = L \ (P * b);
            x = y \ U;
        end
    end

end