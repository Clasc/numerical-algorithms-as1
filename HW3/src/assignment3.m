n = 3;

% A = pos_def_matrix(n);

A = [0.18324   0.38799   0.33530
   0.38799   1.07096   0.74656
   0.33530   0.74656   0.67923];

b = [2;2;1];
tol = 0.5;
maxit = uint32(3);
x0 = [4;2;2];

[x, iter, res_vec] = cg(A, b, tol, maxit, x0);

last_residual = res_vec(:, iter)
iter
x
correct_x = A\b
expcted_cg_x =  cgs(A,b)

%read_exec("matrix1.mtx");