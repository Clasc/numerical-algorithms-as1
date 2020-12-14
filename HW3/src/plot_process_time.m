function plot_process_time(file, precon_type)  [A, rows, cols, entries] = mmread(file);  A = sparse(A);  b = rand(rows,1);  x0 = rand(rows,1);  maxit = uint32(rows);    [M1,M2] = get_precondition(rows, precon_type);    tol = 1;  for i = 1:20    tic;    [~, cg_iter, cg_res_vec] = cg(A, b, tol, maxit, x0);    cg_toc(i) = toc;    tic;    [~, iter, res_vec] = p_cg(A, b, tol, maxit, x0, M1, M2);    pcg_toc(i) = toc;        tols(i) = tol;    tol = tol/2;    endfor    figure  semilogx(tols, cg_toc, tols, pcg_toc);  title("Comparing execution time of cg and pcg");  xlabel("Toleration");  ylabel("Processing time");  grid("on");  legend("cg", strcat("pcg precondition:", precon_type));
endfunction
