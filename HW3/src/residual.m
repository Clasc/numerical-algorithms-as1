function r= residual(A, x_hat, b)
    validateattributes(A, {"numeric"}, {'square'});
    validateattributes(b, {"numeric"}, {'column'});
    validateattributes(x_hat, {"numeric"}, {'column'});

    [m, n] = size(A);

    if (length(b) != n |length(n) != n)
        error("The vectors x and b have to be the same size as A");
    endif

    r = norm(A * x_hat - b) / (norm(A) * norm (x_hat));

endfunction