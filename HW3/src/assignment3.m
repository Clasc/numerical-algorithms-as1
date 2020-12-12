A = [1,2,4; 2,4,1; 1,2,3];
b = [2;2;1];
tol = 2;
maxit = uint32(100);
x0 = [4;2;2];

[x, iter, res_vec] = cg(A, b, tol, maxit, x0);
x
res_vec(iter)
iter

A\b