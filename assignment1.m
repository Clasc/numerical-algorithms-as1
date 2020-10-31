Input = [3.73,1.34,2.4; 2.53, 2.2, 4.1; 4.42,4.44,8.55]
Y = [0, 1; 1, 1];


[corrL, corrU, P] = lu(Input)


[myU, myL] = plu(Input, 3)

myL * myU

