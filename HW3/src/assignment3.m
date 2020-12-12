A = [1,2,4; 2,4,1; 1,2,3];
b = [2;2;1];
tol = 0.5;
maxit = uint32(23);
x0 = [4;2;2];

[x, iter, res_vec] = cg(A, b, tol, maxit, x0);

last_residual = res_vec(:, iter)
iter
x
correct_x = A\b
expcted_cg_x =  cgs(A,b)

%read_exec("matrix1.mtx");