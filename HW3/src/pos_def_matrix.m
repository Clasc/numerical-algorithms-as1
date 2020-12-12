function [A] = pos_def_matrix(m)
    A = rand(m);
    A = A*A.';
endfunction