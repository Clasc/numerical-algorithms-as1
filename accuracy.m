function [z] = accuracy(X, Y)
    [xm, xn] = size(X);
    [ym, yn] = size(Y);

    if (xm != ym || xn != yn)
        error("matrices / vectors have to be the same size");
    endif

    if (ismatrix(X) && ismatrix(Y))
        validateattributes(X, {"numeric"}, {'square'});
        validateattributes(Y, {"numeric"}, {'square'});
    endif

    z = norm(X - Y) / norm(Y);
endfunction
