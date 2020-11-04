function [Z] = accuracy(X, Y)
    [xm, xn] = size(X);
    [ym, yn] = size(Y);

    if (xm != ym || xn != yn)
        error("matrices / vectors have to be the same size");
    endif

    if (!isvector(X) &&!isvector(Y))
        validateattributes(X, {"numeric"}, {'square'});
        validateattributes(Y, {"numeric"}, {'square'});
    endif

    Z = norm(X - Y) / norm(Y);
endfunction
