Input = [3.0,1.0,4.0;5.0,5.0,1.0;1.0,4.0,5.0]
Y = [0, 1; 1, 1];


[corrL, corrU, P] = lu(Input);


[myU, myL] = my_lu(Input, 3);

[pA, pP] = plu(Input, 3);

[pL, pU] = get_lu(pA);

actual = pP * pL * pU

isequal(actual, Input)


