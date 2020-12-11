function [x, iter, res vec] = p_cg(A, b, tol, maxit, x0, M1, M2)
    validateattributes(A, {"numeric"}, {'square'});
    validateattributes(M2, {"numeric"}, {'square'});
    validateattributes(M1, {"numeric"}, {'square'});

    validateattributes(b, {"numeric"}, {'column'});
    validateattributes(x0, {"numeric"}, {'column'});

    validateattributes(tol, {"numeric"}, {'scalar'});
    validateattributes(maxit, {"int64"}, {'scalar'});
    
endfunction