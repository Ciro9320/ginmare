clear all;
clc;

% Definiamo il valore di n
n = 10;

% Inizializziamo la variabile somma a 0
s = 0;

% Aggiungiamo alla variabile s il valore di ogni intero da 1 a n
for i=1:n
    s = s+i;
end

s_true = n*(n+1)/2;

fprintf('\n Il valore della somma è: %d',s_true);
fprintf('\n E il valore ottenuto è : %2.0f \n',s);
