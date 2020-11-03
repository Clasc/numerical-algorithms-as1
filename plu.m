function [A, P] = plu(A, n)
  validateattributes(A, {"numeric"}, {'square'});
  validateattributes(n, {"numeric"}, {'square'});
  [am, an] = size(A);
  
  if (am != n || an != n)
    error("Matrix size is not the same as n!");
  endif
  
  
  P = eye(n);
  L = eye(n);
  
  for k = 1:n
    
    %partial pivoting    
    [~,pivot_idx] = max(abs(A(k:n,k)));
    pivot_idx += n-(n-k+1);
    
    if(pivot_idx != k)    
      A = swap_rows(A, pivot_idx, k);
      L = swap_rows(L, pivot_idx, k);
      P = swap_rows(P, pivot_idx, k);
    endif
    
    if (A(k,k) == 0)
      continue;
    endif
    
    L(k:n,k) = A(k:n,k)/A(k,k);
    
    ##    Converted loop to matrix operation:    
    ##    for j = (k + 1):n 
    ##      for i = (k + 1):n
    ##        A(i,j) -= L(i,k) * A(k,j);
    ##      endfor
    ##    endfor
    A(k+1:n,1:n) -= L(k+1:n,k) * A(k,1:n);
    
  endfor
  
  for i=2:n
    for j=1:i-1
      A(i,j) = L(i,j);  
    endfor
  endfor
  
endfunction
