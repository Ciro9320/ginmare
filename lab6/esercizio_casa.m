clear all;
clc;

f = @(x) x ./ (x.^2 + 1);
a = 0;
b = 5;
sol = log(26) / 2;
nmax = 20;

errT = zeros(1, nmax);
errS = zeros(1, nmax);
errP = zeros(1, nmax);

for i = 1 : nmax
    [xT, wT] = trapezi_composta(a, b, i);
    [xS, wS] = simpson_composta(a, b, i);
    [xP, wP] = ptomed_composta(a, b, i);

    intT = sum(wT .* f(xT));
    intS = sum(wS .* f(xS));
    intP = sum(wP .* f(xP));

    errT(i) = abs(sol - intT) / abs(sol);
    errS(i) = abs(sol - intS) / abs(sol);
    errP(i) = abs(sol - intP) / abs(sol);
end

figure(1)
semilogy(1 : nmax, errT, "-bo");
hold on;
semilogy(1 : nmax, errS, "-mo");
semilogy(1 : nmax, errP, "-ko");
legend("Trapezi", "Simpson", "Pto medio");


