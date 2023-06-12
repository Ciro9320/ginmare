clear all;
clc;

f = @(x) exp(x) - 2 + x;
dom = linspace(-2, 2, 100);
figure(1)
plot(dom, f(dom))

Df = @(x) exp(x) + 1;
x0 = 0;
tol = 1e-6;
max_iter = 500;

[x,xall,iter] = newton(f,Df,x0,tol,max_iter);

sol = 0.442854401002389;
err_rel = abs(sol -xall) / sol;

figure(2)
semilogy(1:iter, err_rel, 'ko-', 'MarkerFaceColor','m')