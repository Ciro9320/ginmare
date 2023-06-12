clear all;

% Variabile che indica quanto è fitta la discretizzazione del dominio
n = 50;
% Discretizzo il mio dominio [0,1]
x = linspace(0,1,n);

% Definisco la funzione attraverso la anonymous function
f = @(x) sin(x).^2+cos(3*x);

% Uso il comando figure per generare una finestra dedicata al plot 
% e faccio il plot della funzione f nei punti x
figure(1) 
plot(x,f(x),'--r')