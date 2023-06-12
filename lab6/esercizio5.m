clear all;
clc;

% Funzione integranda
alpha=1.1;
f = @(x) abs(x).^alpha;
% Estremi di integrazione
a=-sqrt(2);b=1;

% Valore esatto dell'integrale
intvero=1/(alpha+1)*(b^(alpha+1)+(-a)^(alpha+1));

% Parametri per la funzione RefineQuad
toll=10^-6;
maxN=1024;

% Raffinamento del metodo dei trapezi compositi
[intT,It,stepT,flagT]=refine_quad(a,b,f,1,toll,maxN);

% Calcolo del numero di intervalli
Ntrap=2^(length(It)-1);
% E conseguente calcolo dei punti utilizzati
Npuntit=Ntrap+1;

% Errore assoluto 
Errt=abs(intvero-intT);

% Raffinamento del metodo di Simpson composito
[intS,IS,stepS,flagS]=refine_quad(a,b,f,2,toll,maxN);

% Calcolo del numero di intervalli
NPara=2^(length(IS)-1);
% E conseguente calcolo dei punti utilizzati
Npuntip=2*NPara+1;

% Errore assoluto 
Errp=abs(intvero-intS);

% Matrice contenente i valori richiesti in due righe
ris=[[Ntrap;NPara],[Npuntit;Npuntip],[intT;intS],[Errt;Errp]];

if flagT==1
    fprintf('La formula dei trapezi ha raggiunto la tolleranza\n')
else
    fprintf('La formula dei trapezi non ha raggiunto la tolleranza\n')
end
if flagS==1
    fprintf('La formula delle parabole ha raggiunto la tolleranza\n')
else
    fprintf('La formula delle parabole non ha raggiunto la tolleranza\n')
end

fprintf('\n intervalli\t punti\t     integrale \t\t errore\n' )
fprintf('%10d \t %5d \t %5.12f \t %15.12e \n',ris');
