n = 3;
n_s = 5:5:400;

iterations = length(n_s);
R = zeros(iterations, 1);
Rr = R;
RrO = R;
Rf = R;
RfO = R;

for i = 1:iterations
    x = ones(n, 1);
    A = rand(n);
    b = rand(n, 1)

    x = linSolve(A, b, n);
    corrx = A \ b;

    Rr(i) = relative_residual(A, x, b);

    Rf(i) = accuracy(corrx, x);

endfor

figure
semilogy(n_s, RL, n_s, RU);
title("Forward error");
xlabel("matrix size n");
ylabel("Forware error f");
grid("on");
legend('Forward error L', "forward error U", 'Location', 'northwest');
