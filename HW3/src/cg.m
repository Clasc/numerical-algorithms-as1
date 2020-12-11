function [x, iter, r, vec] = cg(A, b, tol, maxit, x0)
    validateattributes(A, {"numeric"}, {'square'});

    validateattributes(b, {"numeric"}, {'column'});
    validateattributes(x0, {"numeric"}, {'column'});

    validateattributes(tol, {"numeric"}, {'scalar'});
    validateattributes(maxit, {"int64"}, {'scalar'});

    [n, ~] = size(A);
    if(length(x0)!=n || length(b) != n)
        error("vectors need to have the same length as the n x n Matrix A");
    endif

    % Folien Sparse Linear Systems S.31
    r(1) = b - A * x0;
    s(1) = r(1);
    
    for k = 1:n
        temp_prod = A * s(k);
        
        % Finde von xk in Richtung sk | dk  den Ort xk+1
        a(k) = r(k)' * r(k) / (s(k)' * temp_prod);
        % aktualisiere Lösung von x E(k) und Residuum
        x(k+1) = x(k) + a(k) * s(k);
        r(k+1) = r(k) + a(k) * temp_prod;

        % korrigiere suchrichtung s 
        beta_k = (r(k+1)' * r(k+1)) / (r(k)' * r(k));
        s(k+1) = r(k+1) + beta_k * s(k);

        % bis residuum ist kleiner als Toleranz
        if (norm(r(k+1),1) < tol)
            iter = k;
            break;
        endif
    endfor 
endfunction