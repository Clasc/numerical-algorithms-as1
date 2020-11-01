n=4;

Input = rand(n)

[corrL, corrU, P] = lu(Input)

[myU, myL] = my_lu(Input, n);

[pA, pP] = plu(Input, n);

[pL, pU] = get_lu(pA);

result = pP * pL * pU


