function [x, iter, res vec] = cg(A, b, tol, maxit, x0)
    validateattributes(A, {"numeric"}, {'square'});

    validateattributes(b, {"numeric"}, {'column'});
    validateattributes(x0, {"numeric"}, {'column'});
    
    validateattributes(tol, {"numeric"}, {'scalar'});
    validateattributes(maxit, {"int64"}, {'scalar'});

endfunction