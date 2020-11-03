n = 50;
A = rand(n);

[np_L,np_U] = my_lu(A, n);
[Res, P] = plu(A, n);
[L, U] = get_lu(Res);

result_no_pivot = np_L * np_U;
result_pivot = P.' * L * U;

R_pivoting = accuracy(result_pivot, A) 
R_np_pivoting = accuracy(result_no_pivot, A) 


