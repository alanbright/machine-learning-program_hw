size(X) % 50,2
size(U) % 2,2
size(Z) % 50, 1
U_reduce = U(:, 1:K);
Z = X * U_reduce;
