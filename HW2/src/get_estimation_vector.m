# A is Upper Triangular matrix U transposedfunction [y,z, opt_ratio] = get_estimation_vector(A, iterations = 30)  % z is solution to A z = y   n = columns(A);  _y = rand(n, iterations);    for i = 1 : iterations    _z(:, i) = A\_y(:, i);    new_ratio(i) = norm(_z(:,i)) / norm(_y(:,i));  endfor  [opt_ratio, index] = max(new_ratio);  y= _y(:,index);  z= _z(:,index);
endfunction
