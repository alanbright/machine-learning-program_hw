% cost function
J = sum(( X * theta - y ) .^2 ) / (2 * m)

% gradient descent
theta = theta - (alpha /m) * (( X * theta - y )' * X)';

% this is more simplier
theta = theta - (alpha /m) * X' * ( X * theta - y );

% feature normalize
X_norm = (X - mean(X)) ./ std(X)
