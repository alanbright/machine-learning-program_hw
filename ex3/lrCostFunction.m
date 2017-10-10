%costFunction with regularization  & gradient descent with regularization

newTheta = theta;
newTheta(1)=0;

J = (1/m)*sum(-y.*log(sigmoid(X*theta))-(1-y).*log(1-sigmoid(X*theta))) + (lambda/(2*m))*sum(newTheta .^2);

grad = (1/m)* X' *( sigmoid(X * theta) - y ) + lambda * newTheta / m;
