function [error_train, error_val] = ...
    learningCurve_random(X, y, Xval, yval, lambda)

% Number of training examples
m = size(X, 1);
% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
    % we will random choose the element in x, not the first-th element in X
    % and we need to repeat this about 50 times, use the average error as result
    % we shuffle the X rows to choose first-th row in X and y
    
    for j = 1:50
      %the random shuffle serialize number
      randSerial = randperm(size(X,1));
      %then we get the correspond X and y
      newX = X(randSerial, :);
      newy = y(randSerial, :);
      %now we can always get the random rows to compute theta
      theta = trainLinearReg(newX(1:i, :), newy(1:i), lambda);
      error_train(i) = error_train(i) + linearRegCostFunction(newX(1:i, :), newy(1:i), theta , 0);
      error_val(i) = error_val(i) + linearRegCostFunction(Xval, yval, theta , 0);
    end
    
    %get the average error as result
    error_train(i) = error_train(i)/50;
    error_val(i) = error_val(i)/50;
end

end
