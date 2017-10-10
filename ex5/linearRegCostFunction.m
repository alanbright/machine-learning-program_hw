newTheta = theta;
newTheta(1) = 0;
J = sum(( X * theta - y ) .^2 ) / (2 * m) + (lambda/(2*m))*sum(newTheta .^2) ;
grad =  (1 /m) * X' * ( X * theta - y ) + (lambda * newTheta / m);
