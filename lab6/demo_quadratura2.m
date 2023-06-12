function demo_quadratura2
    f = @(x) 1 ./ (x + 1);
    a = 0;
    b = 1;
    nmax = 20;
    
    for n = 1 : nmax
        [xtrap, wtrap] = trapezi_composta(a, b, n);
        [xsimp, wsimp] = simpson_composta(a, b, n);
        strap(n) = f(xtrap)' * wtrap;
        ssimp(n) = f(xsimp)' * wsimp;
    end    

    sol = log(2);
    err_trap = abs(sol - strap);
    err_simp = abs(sol - ssimp);

    figure(1)
    semilogy(1:nmax, err_trap, 'ko-')
    hold on;
    semilogy(1:nmax, err_simp, 'ro-')

end