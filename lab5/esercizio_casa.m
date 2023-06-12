clear all;
clc;

f = @(x) cos(x) - sin(x);
s = linspace(-1, 1, 500);

nmax = 30;

errEquis = zeros(1, nmax);
errCheb = zeros(1, nmax);

for i = 1 : nmax
    xEquis = linspace(-1, 1, i+1);
    xCheb = -cos(0 : i) * pi / i;
    
    yEquis = f(xEquis);
    yCheb = f(xCheb);

    tEquis = interpol_bary(xEquis, yEquis, s')';
    tCheb = interpol_bary(xCheb, yCheb, s')';

    errEquis(i) = max(abs(tEquis - f(s)));
    errCheb(i) = max(abs(tCheb - f(s)));
end

figure(1)
semilogy(1 : nmax, errEquis, 'b')
hold on;
semilogy(1 : nmax, errCheb, 'm')
title('Errori');
legend('Pol Equis', 'Pol Cheb');