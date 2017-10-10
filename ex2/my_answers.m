% sigmoid
g = 1 ./ (1 + exp(-z));

% costFunction
J = (1/m)*sum( -y .* log(sigmoid(X * theta)) - (1-y) .* log(1 - sigmoid(X * theta)) );

% gradient descent
grad = (1/m)* X' *( sigmoid(X * theta) - y );

%predict (my original version)
result = sigmoid(X * theta);
%https://www.coursera.org/learn/machine-learning/supplement/AqSH6/hypothesis-representation
pos = find(result >= 0.5);
neg = find(result < 0.5);
result(pos) = 1;
result(neg) = 0;
p = result;

%predict (real good version)
p = sigmoid(X * theta) > 0.5

% costFunction with regularization
% gradient descent with regularization

%the regualization part do not need the theta0, so we eliminate it as newTheta.
newTheta = theta;
newTheta(1)=0;

J = (1/m)*sum(-y.*log(sigmoid(X*theta))-(1-y).*log(1-sigmoid(X*theta))) + (lambda/(2*m))*sum(newTheta .^2);

grad = (1/m)* X' *( sigmoid(X * theta) - y ) + lambda * newTheta / m;
