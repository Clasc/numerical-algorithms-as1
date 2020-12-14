function [J] = create_jacobi(M)  v = diag(M);  J = sparse(diag(v)); 
endfunction
