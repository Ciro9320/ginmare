%esercizio 1

yexact = 1;
x = linspace(-1e-10, 1e-10, 2000);

y = ((1 + x) - 1) ./ x;

errRel = abs(y - yexact) / abs(yexact);

figure(1);
plot(x, y);
title("Valore di f(x)");
xlabel('x');

figure(2);
semilogy(x, errRel);
title("Errore relativo");
xlabel('x')