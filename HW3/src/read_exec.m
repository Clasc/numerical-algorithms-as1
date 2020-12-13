function read_exec(file)
    [A, rows, cols, entries] = mmread(file);

    b = rand(rows,1);
    x0 = rand(rows,1);
    tol = 1e-6;
    maxit = uint32(23);
    
    [x, iter, res_vec] = cg(A, b, tol, maxit, x0);
endfunction