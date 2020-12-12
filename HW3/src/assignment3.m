A = [1,2,4; 2,4,1; 1,2,3];
b = [2;2;1];
tol = 1;
maxit = uint32(50);
x0 = [4;2;2];
x0 = A\b;

[x, iter, res_vec] = cg(A, b, tol, maxit, x0);

last_residual = res_vec(:, iter)
iter
x
expected_x = A\b