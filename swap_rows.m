function [M] = swap_rows(M, r1, r2)    if(!ismatrix(M))    error("Swapable has to be a matrix");  endif    [m, n] = size(M);    if(m < r1 || m < r2)    error("Rows to swap are out of Bounds");  endif    M([r1 r2],:)= M([r2 r1],:);
endfunction
