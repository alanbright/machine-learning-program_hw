C_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
% this model already training by C = 1, sigma = 0.1
C = 1;
sigma = 0.1;
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
my_mean = mean(double(predictions ~= yval))
for i = 1:length(C_vec)
  for j = 1:length(sigma_vec)
    C_vec(i)
    sigma_vec(j)
    model= svmTrain(X, y, C_vec(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vec(j)));
    predictions = svmPredict(model, Xval);
    tempMean = mean(double(predictions ~= yval))
    if my_mean > tempMean ,
      disp('get into my_mean > tempMean');
      C = C_vec(i)
      sigma = sigma_vec(j)
      my_mean = tempMean
    end
  end
end
my_mean
C
sigma
