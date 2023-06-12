%esercizio 3

clc;

n = 1e+2; %e+2 corrisponde a 10^2 quindi n = 100

Sn1(1) = 1;
for i = 2 : n
    Sn1(i) = Sn1(i - 1) + 1 / i^2;
end

Sn2 = cumsum(1 ./ ((1 : n) .^2));

SN1 = sqrt(6 * Sn1);
SN2 = sqrt(6 * Sn2);

err_Sn1 = abs(SN1 - pi) / pi;
err_Sn2 = abs(SN2 - pi) / pi;

diff_errZero = err_Sn2 - err_Sn1;
figure;
plot(1 : n, diff_errZero)

figure;
semilogy(1 : n, err_Sn1, '-k')

%costruzione instabile
x(1) = 2;
for i = 3 : n
    x(i-1) = 2^((i-1)-1/2)*sqrt(1-sqrt(1-4^(1-(i-1))*x(i-2)^2));
end

%costruzione stabile
y(1) = 2;
for i = 3 : n
    y(i - 1) = sqrt(2) * y(i - 2) / sqrt(1 + sqrt(1 - 4^(1 - (i - 1)) * y(i - 2)^2));
end

err_1 = abs(x - pi) / pi;
err_2 = abs(y - pi) / pi;

hold on;
semilogy(1 : (n - 1), err_1, '-r')
semilogy(1 : (n - 1), err_2, '--b')

