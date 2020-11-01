function [L,U] = get_lu(A)  validateattributes(A, {"numeric"}, {'square'});  n = rows(A);  L = eye(n);  U = A;    for i = 2:n    for j = 1:i-1      L(i,j) = A(i,j);      U(i,j) = 0;    endfor  endfor  
endfunction
