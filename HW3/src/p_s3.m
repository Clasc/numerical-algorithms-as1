function p_s3()
  [A, rows, cols, entries] = mmread("s3rmt3m3.mtx");
  b = rand(rows,1);
  x0 = ones(rows,1);
  tol = 1e-6;
  maxit = uint32(rows);
   
  [~, iter_cg, res_vec_cg] = cg(A, b, tol, maxit, x0);
  
  [M1,M2] = get_precondition(A, "jacobi", rows);
  [~, iter1, res_vec1] = p_cg(A, b, tol, maxit, x0, M1, M2);
  
  [M1,M2] = get_precondition(A, "ichol.ict", rows);
  [~, iter3, res_vec2] = p_cg(A, b, tol, maxit, x0, M1, M2);
  
   figure
   hold on;
   title("comparing cg and pcg on file: s3rmt3m3");
   semilogy(res_vec_cg);
   semilogy(res_vec1);
   semilogy(res_vec2);
   xlabel("Iteration");
   ylabel("Relative residual");
   grid("on");
   legend("without precondition", "jacobi", "ichol with threshold");
endfunction