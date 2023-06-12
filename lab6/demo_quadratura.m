function demo_quadratura
    f = @(x) 1 ./ (x + 1);
    a = 0;
    b = 1;

    trap = (b - a) / 2 * (f(a) + f(b));
    simp = (b - a) / 6 * (f(a) + 4*f((a + b) / 2) + f(b));

    sol = log(2);
    err_trap = abs(sol - trap);
    err_simp = abs(sol - simp);
    fprintf("trap: %1.4d\n", err_trap);
    fprintf("simp: %1.4d\n", err_simp);
end