# U is Upper Triangular matrix U transposedfunction [w] = solve_Utwe(U)  ##  % z is solution to U z = y   n = columns(U);    e(1:n, 1) = 1.0;  t(1:n, 1) = 0.0;  t_p(1:n, 1) = 0.0;  t_m(1:n, 1) = 0.0;  w_p(1:n, 1) = 0.0;  w_m(1:n, 1) = 0.0;  w(1:n, 1) = 0.0;    for k = 1 : n    if(k > 1)      t(k:n) += U(k-1, k:n)' * w(k-1);    endif    if(t(k) ~= 0.0)    e(k) = sign(- t(k));  endif        if(U(k,k) ~= 0.0)      w_p(k) = (e(k) - t(k)) / U(k,k);      w_m(k) = (- e(k) - t(k)) / U(k,k);    else      w_p(k) = 1.0;      w_m(k) = 1.0;    endif        t_p(k) = e(k) - t(k);    t_m(k) = - e(k) - t(k);        t_p(k+1:n) = t(k+1:n) + U(k, k+1:n)' * w_p(k);    t_m(k+1:n) = t(k+1:n) + U(k, k+1:n)' * w_m(k);        sum_p = sum(abs(t_p(k:end)));    sum_m = sum(abs(t_m(k:end)));   if(sum_p > sum_m)      w(k) = w_p(k);   else      w(k) = w_m(k);   endif   endforendfunction
