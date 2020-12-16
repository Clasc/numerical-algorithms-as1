function plot_all(file)
  [A, rows, cols, entries] = mmread(file);
  b = ones(rows,1);
  x0 = rand(rows,1);
  tol = 1e-6;
  maxit = uint32(rows);
   
  [~, iter_cg, res_vec_cg] = cg(A, b, tol, maxit, x0);
  
  [M1,M2] = get_precondition(A, "jacobi", rows);
  [~, iter1, res_vec1] = p_cg(A, b, tol, maxit, x0, M1, M2);
  
  [M1,M2] = get_precondition(A, "ichol", rows);
  [~, iter2, res_vec2] = p_cg(A, b, tol, maxit, x0, M1, M2);
  
  [M1,M2] = get_precondition(A, "ichol.ict", rows);
  [~, iter3, res_vec3] = p_cg(A, b, tol, maxit, x0, M1, M2);
  
   figure
   hold on;
   title(strcat("comparing cg and pcg on file: ", file));
   semilogy(res_vec_cg);
   semilogy(res_vec1);
   semilogy(res_vec2);
   semilogy(res_vec3);
   xlabel("Iteration");
   ylabel("Relative residual");
   grid("on");
   legend("without precondition", "jacobi", "ichol", "ichol with threshold");
endfunction