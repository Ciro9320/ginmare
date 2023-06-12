function demo_colebrook
    clc;

    e = 1;
    d = 1;
    Nr = 1000;

    x0 = 1;
    toll  = 1e-8;
    maxit = 100000;

    %punto fisso
    g = @(x) -2*log10((e / 3.51 * d) + (2.52 * x / Nr));
    [solF, xvF, stepF] = puntofisso(g, x0, toll, maxit);

    fprintf("soluzione = %1.15e\n", solF);
    fprintf("iterate = %8.0f\n", stepF);
    fprintf("abs(xvF(end)-g(xvF(end))) = %1.15e\n", abs(xvF(end)-g(xvF(end))));
    fprintf("abs(xvF(end-1)-g(xvF(end-1))) = %1.15e\n", abs(xvF(end-1)-g(xvF(end-1))));

    %newton
    f = @(x) -2*log10( (e / 3.51 * d) + (2.52 * x / Nr)) - x;
    Df = @(x) - (1 + 2/log(10) * (2.52 / Nr) / ((e / 3.51 * d) + (2.52 * x / Nr)));
    [solN, xvN, stepN] = newton(f, Df, x0, toll, maxit);
    fprintf("soluzione = %1.15e\n", solN);
    fprintf("iterate = %8.0f\n", stepN);
    fprintf("abs(xvF(end)-f(xvF(end))) = %1.15e\n", abs(xvF(end)-f(xvF(end))));
    fprintf("abs(xvF(end-1)-f(xvF(end-1))) = %1.15e\n", abs(xvF(end-1)-f(xvF(end-1))));

end