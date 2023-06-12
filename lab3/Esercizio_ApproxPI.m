clear all;
clc;

n  = 1e+2;

% Costruzione con l'uso del ciclo FOR
Sn1(1) = 1;
for i = 2:n
    Sn1(i) = Sn1(i-1) + 1/i^2;
end

% Possibile costruzione senza l'utilizzo del ciclo
Sn2 = cumsum(1./((1:n).^2));

% Approssimazione di Pi
SN1 = sqrt(6*Sn1);
SN2 = sqrt(6*Sn2);

% Errore relativo con Pi
err_relSn1 = abs(SN1-pi)/pi;
err_relSn2 = abs(SN2-pi)/pi;

% Plot della differenza per mostrare che i due costrutti sono uguali avendo 
% la differenza sempre valore 0 
diff_errZero = err_relSn2 - err_relSn1;
figure;
plot(1:n, diff_errZero)

% Plot in scala logaritmica dell'errore relativo
figure;
semilogy(1:n,err_relSn1,'-.k')


% Costruzione instabile della sequenza ricorsiva
x(1) = 2;
for i=3:n
    x(i-1) = 2^((i-1)-1/2)*sqrt(1-sqrt(1-4^(1-(i-1))*x(i-2)^2));
end

% Costruzione stabile 
y(1) = 2;
for i=3:n
    y(i-1) = sqrt(2)*y(i-2)/sqrt(1+sqrt(1-4^(1-(i-1))*y(i-2)^2));
end

% Calcolo degli errori relativi
err_rel1 = abs(x-pi)/pi;
err_rel2 = abs(y-pi)/pi;

% Plot in scala logaritmica sovrascritti con il precedente 
hold on;
semilogy(1:(n-1),err_rel1,'-r')
semilogy(1:(n-1),err_rel2,'--b')