function  [iter, res_vec] = read_exec(file)
    [A, rows, cols, entries] = mmread(file);
    A = sparse(A);
    b = rand(rows,1);
    x0 = rand(rows,1);
    tol = 1e-6;
    maxit = uint32(rows);
    

    [x, iter, res_vec] = cg(A, b, tol, maxit, x0);
    
endfunction