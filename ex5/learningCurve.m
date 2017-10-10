for i = 1:m
    theta = trainLinearReg(X(1:i, :), y(1:i), lambda);
    % careful about divide number, it is a variable.
    
    %these implement can pass the homework, too
    %error_train(i) = sum(( X(1:i,:) * theta - y(1:i)) .^2 ) / (2 * length(y(1:i)));
    %error_val(i) = sum( (Xval * theta - yval) .^2 ) / (2 * length(yval));
    
    
    %this is wrong, coz the training cost do not contain the regularization term
    %error_train(i) = linearRegCostFunction(X(1:i, :), y(1:i), theta , lambda); % wrong
    error_train(i) = linearRegCostFunction(X(1:i, :), y(1:i), theta , 0); 
    
    %error_val(i) = linearRegCostFunction(Xval(1:i, :), yval(1:i), theta , lambda);% this is wrong
    % we should use the entire valiation set to validate!
    
    %error_val(i) = linearRegCostFunction(Xval, yval, theta , lambda);  % wrong
    %this is wrong, coz the cost do not contain the regularization term
    
    error_val(i) = linearRegCostFunction(Xval, yval, theta , 0);
end
