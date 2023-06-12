function y = segno(x)

% Attraverso un if indichiamo i vari casi per l'output y
if x>0       % Se x è  positivo
    y = 1;
elseif x<0   % Se x è negativo
    y = -1;
else         % Altrimenti (quindi se è l'unica opzione restante ovvero zero) 
    y = 0;
    fprintf('\n \t Input uguale a zero! \n')
end

end