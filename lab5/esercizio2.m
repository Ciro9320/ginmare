clear all;
clc;

n = 5;

x = linspace(-1, 1, n + 1);

f = @(x) 1 / 3 * exp(-2 * x) + x .^ 2 + 7 * x .^ 3;
y = f(x);

s = linspace(-1, 1, 500);
t = interpol(x, y, s);

figure(1)
plot(s, f(s), 'b')
hold on;
plot(s, t, 'r--')

err = max(abs(t - f(s)));
fprintf("\n \t Errore di interpolazione %2.5e \n", err);