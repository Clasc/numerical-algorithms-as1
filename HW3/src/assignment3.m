A = [1,2,4; 2,4,1; 1,2,3];
b = [2;2;1];
tol = 2;
maxit = int64(4);
x0 = [4;2;2];

r = cg(A, b, tol, maxit, x0);