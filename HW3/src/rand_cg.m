function rand_cg()
    n = 3;

    A = sparse(pos_def_matrix(n));

    b = rand(n,1);
    tol = 1e-6;
    maxit = uint32(25);
    x0 = rand(n,1);

    [x, iter, res_vec] = cg(A, b, tol, maxit, x0);

    res_vec
    iter
    x
    correct_x = A\b
    expcted_cg_x =  cgs(A,b)
endfunction