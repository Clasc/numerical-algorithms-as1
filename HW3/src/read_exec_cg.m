function  [iter, res_vec] = read_exec_cg(file, precon_type)
    [A, rows, cols, entries] = mmread(file);
    A = sparse(A);
    b = rand(rows,1);
    x0 = rand(rows,1);
    tol = 1e-6;
    maxit = uint32(rows);
    
    [M1,M2] = get_precondition(rows, precon_type);
    [x, iter, res_vec] = p_cg(A, b, tol, maxit, x0, M1, M2);
    
endfunction