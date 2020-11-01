Input = [3,1,4;5,5,1;1,4,5]
Y = [0, 1; 1, 1];


[corrL, corrU, P] = lu(Input)


[myU, myL] = my_lu(Input, 3)

[pA, pP] = plu(Input, 3)

