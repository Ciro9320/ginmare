u = ones(1,5);
v = linspace(0,1,5);
w = [1,3,6,-2,3];

p = u*v';
z = p.*w;
A = [0,2,-1,2,0;1,1,1,0,0];

disp(A*z')