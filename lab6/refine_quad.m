function [integrale, i, step, flag] = refine_quad(a, b, f, formula, tol, maxn)
    %a,b : estremi dell%intervallo di integrazione
    %f : funzione integranda
    %formula : : parametro per determinare il metodo da usare, 1-trapezi, 2-Simpson 
    %tol : tolleranza
    %maxn : N relativo alla suddivisione massima

    %integrale : valore approssimato dell%integrale finale
    %i : vettore contenente tutte le approssimazioni effettuate step : errore tra gli ultimi due raffinamenti
    %flag : parametro per il raggiungimento della tolleranza, 0 - non raggiungimento, 1 - raggiungimento
    
    n = 1;
    flag = 0;
    step = tol + 1;
    
    switch formula
        case 1
            [x, w] = trapezi_composta(a, b, n);
        case 2
            [x, w] = simpson_composta(a, b, n);
    end

    i = w' * f(x);
    
    while (step > tol) && (n <= maxn / 2)
        i = [i, w' * f(x)];
        step = abs(i(end) - i(end - 1));
    end

    integrale = i(end);
    if (abs(step) <= tol)
        flag = 1;
    end
end