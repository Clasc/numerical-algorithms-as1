function c = est_cond(A)   validateattributes(A, {"numeric"}, {'square'});      if(det(A) == 0)    c = Inf;    return;   endif      c = norm(A) * norm(inv(A));
endfunction
