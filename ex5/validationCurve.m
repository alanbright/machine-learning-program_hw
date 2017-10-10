for i = 1:length(lambda_vec)
  lambda = lambda_vec(i);
  theta = trainLinearReg(X, y, lambda);
  error_train(i) = linearRegCostFunction(X, y, theta , 0);
  error_val(i) = linearRegCostFunction(Xval, yval, theta , 0);
end
