# A is Upper Triangular matrix U transposedfunction [w, e] = get_estimation_vector(A, iterations = 30)  % z is solution to A z = y   n = columns(A);  _y = rand(n, iterations);    for i = 1 : iterations    _z(:, i) = A\_y(:, i);    new_ratio(i) = norm(_z(:,i),1) / norm(_y(:,i),1);  endfor  [opt_ratio, index] = max(new_ratio);  e = _y(:,index);  w = _z(:,index);
endfunction
