N = 500;
x = zeros(1,N);

f = @(n) 2*n/(2*n-1)*2*n/(2*n+1);   % Funzione relativa alla produttoria


for i = 1:N
    if i == 1
        x(i) = f(1);        % Il caso iniziale
    else
        x(i) = f(i)*x(i-1);
    end
end

x = 2*x;            % Moltiplico alla fine per 2 per ottenere pi

figure 
plot(1:N, x,'k-')
hold on;
plot(1:N, pi*ones(size(1:N)),'--r')
title('Prodotto di Wallis: approssimazione di pi')

figure 
semilogy(1:N, abs(pi-x),'k-')
title('Prodotto di Wallis: errore assoluto') 
