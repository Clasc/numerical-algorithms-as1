n=5;
Input = rand(n);

[np_L,np_U] = my_lu(Input, n);
[Res, P] = plu(Input, n);
[L, U] = get_lu(Res);

result_no_pivot = np_L * np_U
result_pivot = P.' * L * U
Input



