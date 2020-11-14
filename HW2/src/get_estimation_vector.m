# Upper Triangular matrix Ufunction [y,z, opt_ratio] = get_estimation_vector(A)  % z is solution to A z = y   n = columns(A);  opt_ratio = 0;  opts.UT = true;    for i = 1:10    _y = rand(n);    _z = linsolve(A,_y, opts);        new_ratio = norm(_z) / norm(_y);    if(opt_ratio < new_ratio)      opt_ratio = new_ratio;      y = _y;      z = _z;    endif  endfor  
  endfunction
  