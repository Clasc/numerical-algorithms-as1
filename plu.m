function [A, L] = plu(A, n)
  validateattributes(A, {"numeric"}, {'square'});
  validateattributes(n, {"numeric"}, {'square'});
  [am, an] = size(A);
  
  if (am != n || an != n)
    error("Matrix size is not the same as n!");
  endif
  
  class(A)  
  L = eye(n);
  class(L)
  
  for k = 1:(n - 1)
    %partial pivoting:
    % Find index p such that
    % |apk| ≥ |aik| for k ≤ i ≤ n
    %if (p != k) then
    %interchange rows k and p
    %endifq
    
    if (A(k,k) == 0)
      continue;
    endif
    
    for i=(k + 1):n
       L(i,k) = double(A(i,k))/double(A(k,k));
    endfor
    
    for j = (k + 1):n 
      for i = (k + 1):n
        A(i,j) -= L(i,k) * A(k,j);
      endfor
    endfor
  endfor
  
  for i=2:n
    for j=1:i-1
      A(i,j) = 0;  
    endfor
  endfor
endfunction
