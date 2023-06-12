% Mettere due comandi di "pulizia" a volte può aiutare l'ordine

clc;
clear all;

x = linspace(0,2*pi,200);
f = @(x) sin(x);
p = @(x) x-x.^3./6;

figure
plot(x,f(x),'-b')
hold on
plot(x,p(x),'--r')
grid on
% Per fare una legenda, usiamo il seguente comando. Inserire f e p 
% nell'ordine in cui li plottiamo.
legend('f(x)','p(x)',Location='southwest') 
% Per mettere anche un titolo al grafico
title('Funzione e polinomio')

err = @(x) abs(f(x)-p(x));

figure
plot(x,err(x),'-k')
grid on
title('Errore assoluto')

figure
semilogy(x,err(x),'-k') % I valori dell'asse y saranno log10(err(x))
grid on
title('Errore assoluto in scala semilogaritmica')
