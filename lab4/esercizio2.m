clear all;
clc;

f = @(x) sin(x) + x - 1;
figure(1)
fplot(f);
grid on;

a = 0;
b = 1;
dom = linspace(a, b, 100);

g = @(x) 1 - sin(x);
figure(2)
plot(dom, g(dom))
h = @(x) x;
hold on;
plot(dom, h(dom))

x0 = 0.5;
tol = 1e-8;
max_iter = 500;

[res,xall,iter] = puntofisso(g, x0, tol, max_iter);

sol = 0.510973429388569;
err_rel = abs(sol - xall) / sol;

figure(3)
semilogy(1:iter,err_rel,'ko-','MarkerFaceColor','g')
