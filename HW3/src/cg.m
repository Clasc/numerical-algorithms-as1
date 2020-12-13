% tol: largest admissible relative residual r.
% The iteration is terminated either when the residual drops below tol, or when the number of iterations exceeds a specified amount maxit. 
% The initial guess: vector x0.
% solution vector x, 
% iter: number of iterations actually performed
% residual history in res_vec, where res-vec(i) contains the relative residual after iteration i−1 and res vec(1) contains the relative residual of the initial guess.

function [x, iter, res_vec] = cg(A, b, tol, maxit, x0)
    validateattributes(A, {"numeric"}, {'square'});

    validateattributes(b, {"numeric"}, {'column'});
    validateattributes(x0, {"numeric"}, {'column'});

    validateattributes(tol, {"numeric"}, {'scalar'});
    validateattributes(maxit, {"uint32"}, {'scalar'});

    [n, ~] = size(A);
    if(length(x0)!=n || length(b) != n)
        error("vectors need to have the same length as the n x n Matrix A");
    endif

    norm_A = normest(A);
    % Folien Sparse Linear Systems S.31
    r_k = b - (A * x0);
    s_k = r_k;
    x = x0;
    
    for k = 1:maxit
        iter = k;
        temp_prod = A * s_k;
        r_k_dot_last = dot(r_k, r_k);

        % Finde von xk in Richtung sk | dk  den Ort xk+1
        a_k = r_k_dot_last / (s_k' * temp_prod);

        % aktualisiere Lösung von x E(k) und Residuum
        x = x + a_k * s_k;
        r_k = r_k - a_k * temp_prod;

        % korrigiere suchrichtung s 
        beta_k = dot(r_k, r_k) / r_k_dot_last;
        s_k = r_k + beta_k * s_k;

        % bis residuum ist kleiner als Toleranz
        abs_res = norm(r_k,1);
        res_vec(end + 1) = residual(A, x, b, norm_A);
        if (abs_res < tol)
            break;
        endif
    endfor 
endfunction