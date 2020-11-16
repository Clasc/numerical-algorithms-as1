function part2()  for n = 100 : 50 : 1500    [E, delta_b] = rhs_perturbation(n);        for i = 1:10      A = rand(n);      b = rand(n,1);        [lb(i), rb(i)] = bounds(A, E, b, delta_b);    endfor          avg_lbounds(n) = mean(lb);    avg_rbounds(n) = mean(rb);  endfor    
endfunction
