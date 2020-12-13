function plot_cg_tol_relres(file)  [A, rows, cols, entries] = mmread(file);  A = sparse(A);  b = rand(rows,1);  x0 = rand(rows,1);  maxit = uint32(rows);    tol = 1;  for i = 1:20    [x, iter, res_vec] = cg(A, b, tol, maxit, x0);    tols(end+1) = tol;    iterations(end+1) = iter;    residuals(end+1) = res_vec(end);    tol = tol/2;    endfor    figure  semilogy(tols, residuals);  title("Tolerance compared to last relative residual");  xlabel("Tolerance");  ylabel("Last relative residual");  grid("on");    figure  plot(tols, iterations);  title("Tolerance compared to executed iterations");  xlabel("Tolerance");  ylabel("Iterations");  grid("on");
endfunction
