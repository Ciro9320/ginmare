function [] = sistema_perturbato(A, b, Aap, bap)
    x = A \ b;
    xap = Aap \ bap;

    if (cond(A) * norm(Aap - A) / norm(A) < 1)
        stima = cond(A) / (1 - cond(A) * norm(Aap - A) / norm(A)) * (norm(Aap - A) / norm(A) + norm(bap - b) / norm(b));
        fprintf("il valore %1.2e è minore di %1.2e", norm(xap - x) / norm(x), stima);
    else
        error("Errore. κ(A)∥δA∥/∥A∥ >= 1")
    end
end