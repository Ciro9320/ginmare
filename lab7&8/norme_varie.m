function [s] = norme_varie(x, p)
    [r, c] = size(x);
    if (p == 1)
        if (r == 1 || c == 1)
            s = sum(abs(x));
        else
            s = max(sum(abs(x), 1));
        end
    elseif (p == 2)
        if (r == 1 || c == 1)
            s = sqrt(sum(abs(x) .^ 2));
        else
            s = sqrt(max(abs(eig(x' * x))));
        end
    elseif (p == Inf)
        if (r == 1 || c == 1)
            s = max(abs(x));
        else
            s = max(sum(abs(x), 2));
        end
    else
        error("il parametro inserito è errato")
    end
end