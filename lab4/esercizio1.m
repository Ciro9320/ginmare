clear all;
clc;

space = linspace(0, 1, 1000);

f = @(x) exp(x) - 2 + x;

figure(1)
plot(space, f(space));

disp(f(0) * f(1));

[x,xall,iter] = bisezione(f, 0, 1, 10^(-8), 1000);

real_res = 0.4428544010023885;
errRel = abs(real_res - xall) / abs(real_res);
figure(2)
semilogy(errRel);






