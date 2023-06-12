clear all;
clc;

f = @(x) sin(x) + x;
Df = @(x) cos(x) + 1;

x0 = 3;
n = 5;
hvalue = logspace(-1, -n, n);

for i = 1 : n
    h = hvalue(i);
    sdes(i) = (f(x0 + h) - f(x0)) / h;
    ssin(i) = (f(x0) - f(x0 - h)) / h;
    ssim(i) = (f(x0 + h) - f(x0 - h)) / (2 * h);
end

sol = Df(x0);
errdes = abs(sol - sdes) / abs(sol);
errsin = abs(sol - ssin) / abs(sol);
errsim = abs(sol - ssim) / abs(sol);

figure(1)
semilogy(1:n, errdes, 'bo-')
hold on;
semilogy(1:n, errsin, 'ro-')
semilogy(1:n, errsim, 'ko-')
hold off;