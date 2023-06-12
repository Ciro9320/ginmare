clear all;
clc;

b = 2; % Base
iter = 0;
s = 1;
max_it = 1000;  % Mettiamo un numero massimo di iterazioni possibili

while (1+s > 1) && (iter <= max_it)
    s = s/b;
    iter = iter + 1;
end

s = s*b;
prec = (-(iter-1));

disp(s)
disp(prec)


