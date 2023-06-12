clear all;
clc;

f = @(x) sin(2.*x) - x.^2;
n = 100;
d = 8;

x = linspace(-5, 5, n); 
s = linspace(-5, 5, 1000);
y = f(x);
y = y + 0.5 * rand(size(y));
true_fun = f(s);

%primo metodo: polyfit/polyval
fprintf('\n \t Metodo polyfit/polyval \n');
coeff_poly = polyfit(x, y, d);
rec_poly = polyval(coeff_poly, s);

figure(1)
plot(x, y, 'ob')
hold on;
plot(s, true_fun, 'r', 'LineWidth', 2)
plot(s, rec_poly, 'b', 'LineWidth', 2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: polyfit/polyval')

%secondo metodo: equazioni normali
fprintf('\n \t Metodo equazioni normali \n');
V = fliplr(vander(x));
A = V(:, 1 : d + 1);
coeff_normal = (A' * A) \ (A' * y');
rec_normal = polyval(coeff_normal(end : -1 : 1), s);

fprintf('\n \t Condizionamento della matrice A^t A: %1.2e \n', cond(A'*A));

figure(2)
plot(x, y, 'ob')
hold on;
plot(s, true_fun, '-r', 'LineWidth', 2)
plot(s, rec_normal, 'b', 'LineWidth', 2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: equazioni normali')

%terzo metodo: scomposizione QR di A
fprintf('\n \t Metodo QR su A \n');
V = fliplr(vander(x));
A = V(:, 1 : d + 1);
[Q, R] = qr(A);

Q1 = Q(:, 1 : d + 1);
R1 = R(1 : d + 1, 1 : d + 1);

b = Q1' * y';
coeff_qr = R1 \ b;
rec_qr = polyval(coeff_qr(end : -1 : 1), s);

fprintf('\n \t Condizionamento della matrice R: %1.2e \n', cond(R1));

figure(3)
plot(x, y, 'ob')
hold on;
plot(s, true_fun, '-r', 'LineWidth', 2)
plot(s, rec_qr, '-b', 'LineWidth', 2)
legend('Nodi','Funzione','Ricostruzione')
title('Interpolazione ai minimi quadrati: scomposizione QR')





