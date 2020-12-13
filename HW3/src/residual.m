function [r] = residual(A, x_hat, b, norm_A)
    validateattributes(A, {"numeric"}, {'square'});
    validateattributes(b, {"numeric"}, {'column'});
    validateattributes(x_hat, {"numeric"}, {'column'});

    [m, n] = size(A);

    if (length(b) != n |length(x_hat) != n)
        error("The vectors x and b have to be the same size as A");
    endif

    if ~exist('norm_A','var')
      norm_A = norm(A);
    end

    r = norm(A * x_hat - b) / (norm_A * norm (x_hat));

endfunction