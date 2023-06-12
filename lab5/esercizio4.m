clear all;
clc;

nmax = 25;

f = @(x) 1 ./ (1 + 25 * x .^ 2);

s = linspace(-1, 1, 1000);

for n = 1 : nmax
    x_1 = linspace(-1, 1, n + 1);
    x_2 = - cos([0:n] * pi / n);

    t_1 = interpol(x_1, f(x_1), s);
    t_2 = interpol(x_2, f(x_2), s);

    err_1(n) = max(abs(t_1 - f(s)));
    err_2(n) = max(abs(t_2 - f(s)));
end

figure(1)
semilogy(1:nmax, err_1, 'ko-','MarkerFaceColor','g')
hold on;
semilogy(1:nmax, err_2, 'ro-','MarkerFaceColor','b')