n_s = 5:5:100;
iterations = length(n_s);
R = zeros(iterations, 1);

for i = 1:iterations
  n = n_s(i);
  A = rand(n);

  [Res, P] = plu(A, n);
  [_L,_U] = lu(A);
  [L, U] = get_lu(Res);

  optimal_result =  _L * _U;
  result_pivot = P.' * L * U;
  
  Ro(i) = accuracy(optimal_result,A);
  R(i) = accuracy(result_pivot, A);
endfor

figure
semilogy(n_s, R, n_s, Ro);
title("relative Residual");
xlabel("matrix size n");
ylabel("residual R");
grid("on");
legend('my Residual',"octave's Residual (optimal)",'Location','northwest')



