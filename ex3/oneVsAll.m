
% this is my original version. it can be improved

all_theta = [];
for c = 1:num_labels

     % Set Initial theta
     initial_theta = zeros(n + 1, 1);

     % Set options for fminunc
     options = optimset('GradObj', 'on', 'MaxIter', 50);

     % Run fmincg to obtain the optimal theta
     % This function will return theta and the cost
     [theta, cost] = ...
         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
                 initial_theta, options);

    all_theta = [all_theta; [theta]'];
end;

% or you can use all_theta(c,:) = [theta]' , so that we do not need to initial all_theta again

