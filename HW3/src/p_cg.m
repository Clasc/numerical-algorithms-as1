function [x, iter, res_vec] = p_cg(A, b, tol, maxit, x0, M1, M2)
    validateattributes(A, {"numeric"}, {'square'});
    
    validateattributes(b, {"numeric"}, {'column'});
    validateattributes(x0, {"numeric"}, {'column'});

    validateattributes(tol, {"numeric"}, {'scalar'});
    validateattributes(maxit, {"uint32"}, {'scalar'});
    validateattributes(M1, {"numeric"}, {'square'});  
    validateattributes(M2, {"numeric"}, {'square'});
     
      
     [m_n1,~] = size(M1);
     [m_n2,~] = size(M2);     
     
     if(m_n1 == 0 && m_n2 == 0)
      [x, iter, res_vec] = cg(A, b, tol, maxit, x0);
      return;
    endif
    
    if (m_n2 == 0)
      inv_M = inv(M1);
    else
      inv_M = M1 * M2;
    endif
    
    norm_A = normest(A);
    % Folien Sparse Linear Systems S.36
    r_k = b - (A * x0);
    s_k = inv_M * r_k;
    x = x0;
    
    for k = 1:maxit
        iter = k;
        temp_prod = A * s_k;
        r_k_dot_last = dot(r_k' * inv_M, r_k);

        % Finde von xk in Richtung sk | dk  den Ort xk+1
        a_k = r_k_dot_last / (s_k' * temp_prod);

        % aktualisiere Lösung von x E(k) und Residuum
        x = x + a_k * s_k;
        r_k = r_k - a_k * temp_prod;

        % korrigiere suchrichtung s 
        beta_k = dot(r_k' * inv_M, r_k) / r_k_dot_last;
        s_k = inv_M * r_k + beta_k * s_k;

        % bis residuum ist kleiner als Toleranz
        abs_res = norm(r_k,1);
        res_vec(end + 1) = residual(A, x, b, norm_A);
        if (abs_res < tol)
            break;
        endif
    endfor 
endfunction