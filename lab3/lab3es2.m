%esercizio 2
clc
p =  4.999999999995 * 10^4;
q = 10^(-2);
sol_esatta = 10^(-7);

y_1 = -p + sqrt(p^2 + q);

y_2 = q / (p + sqrt(p^2 + q));

err_1 = abs(y_1 - sol_esatta) / abs(sol_esatta);

err_2 = abs(y_2 - sol_esatta) / abs(sol_esatta);

fprintf("y_1 : %10.19f\n", y_1);
fprintf("y_2 : %10.19f\n", y_2);

fprintf("err_1 : %10.19f\n", err_1);
fprintf("err_2 : %10.19f\n", err_2);