[Ans, AnsIndex] = max( sigmoid( X * all_theta' ) , [], 2);

p = AnsIndex;

% one line solution
[Ans, p] = max(sigmoid(X * all_theta'), [], 2);
