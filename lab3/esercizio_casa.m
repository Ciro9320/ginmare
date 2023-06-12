clear all;
clc;

x1 = 1;
N = 70;

fprintf("x1 = %4.0f\nN = %4.0f\n", x1, 70);

sequenza = sequenza_log(x1, N);
fprintf("ultimo valore = %1.4e\n", sequenza(end));

sol = log(x1 + 1);
err_ass = abs(sequenza - sol);

figure(1)
semilogy(1 : N, err_ass, 'ko-')
hold on;

sequenza = sequenza_log2(x1, N);
err_ass = abs(sequenza - sol);
semilogy(1 : N, err_ass, 'ro-')