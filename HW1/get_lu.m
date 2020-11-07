function [L,U] = get_lu(A)  validateattributes(A, {"numeric"}, {'square'});    L = tril(A,-1) + eye(rows(A));  U = triu(A);  
endfunction
