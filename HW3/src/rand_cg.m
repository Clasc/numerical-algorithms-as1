function rand_cg()
    n = 20;

    A = sparse(pos_def_matrix(n));

    b = rand(n,1);
    tol = 1e-6;
    maxit = uint32(20);
    x0 = rand(n,1);

    [x, iter, res_vec] = cg(A, b, tol, maxit, x0);
    
    iter
    
    x
    
    expcted_cg_x =  cgs(A,b, tol, maxit)
    isequal(expcted_cg_x, x)
endfunction