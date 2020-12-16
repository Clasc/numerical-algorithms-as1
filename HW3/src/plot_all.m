function plot_all(file)
  [A, rows, cols, entries] = mmread(file);
  b = ones(rows,1);
  x0 = ones(rows,1);
  tol = 1e-6;
  maxit = uint32(rows);
   
  [~, iter_cg, res_vec_cg] = cg(A, b, tol, maxit, x0);
  
  [M1,M2] = get_precondition(A, "jacobi", rows);
  [~, iter, res_vec1] = p_cg(A, b, tol, maxit, x0, M1, M2);
  
  [M1,M2] = get_precondition(A, "ichol", rows);
  [~, iter, res_vec2] = p_cg(A, b, tol, maxit, x0, M1, M2);
   
   figure
   hold on;
   title(strcat("comparing cg and pcg on file: ", file));
   semilogy(res_vec_cg);
   semilogy(res_vec1);
   semilogy(res_vec2);
   xlabel("Iteration");
   ylabel("Relative residual");
   grid("on");
   legend("wo precondition", "jacobi", "ichol");
endfunction