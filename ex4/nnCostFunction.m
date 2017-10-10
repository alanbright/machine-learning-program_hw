%%%%%%%%%%%%%% Feedforward and Cost Function with Regularized

%X has size 5000 x 400
%Theta1 has size 25 x 401                                                                             
%Theta2 has size 10 x 26

% Add ones to the X data matrix
X = [ones(m, 1) X]; % 5000 x 401

size(y); % 5000 1 (labels)

%we need to get the h(x)
h = sigmoid([ones(m, 1) sigmoid(X*Theta1')] * Theta2'); % 5000 x 10

% here we prepare for the regularization, we should exclude the each theta the first column
newTheta1 = Theta1;
newTheta1(:,1)=0;
newTheta2 = Theta2;
newTheta2(:,1)=0;
newTheta = [newTheta1(:); newTheta2(:)]; % merge as theta vector

%now we need to transform the y label matrix to y oneVsAll matrix (only 1 and 0)
newColumn = num_labels; % the number of classes
warning('off', 'all');% if you want to ignore warning..
newY = [1:newColumn] == y; %this line will cause warning (mx_el_eq: automatic broadcasting operation applied) but, we ignore it for convinient

%the size of (1/m)*sum(-newY.*log( h ) - (1-newY).*log( 1 - h )) is 1 * 10
% we need to sum it up again. then add the regularization part.
J = sum((1/m)*sum(-newY.*log( h ) - (1-newY).*log( 1 - h ))) + (lambda/(2*m))*sum(newTheta .^2);

%%%%%%%%%%%%%% Backpropagation (for loop)
%%%%%%%% backpropagation PART %%%%%%%%%%%%%%
for i=1:m % 1 ~ 5000
% calculate a_1 z_2 a_2 ....
% don't forget the bias.
    a_1 = X(i,:); % (1, 401) , this X , we already add bias unit
    z_2 = Theta1 * a_1'; % (25,401) * (401,1) = (25,1)
    a_2 = sigmoid(z_2);
    a_2 = [1 ; a_2]; % add the bias unit. (26,1)
    z_3 = Theta2 * a_2; % (10,26) * (26,1) = (10,1)
    a_3 = sigmoid(z_3);

% delta_3 of k = a_3 of k - y of k (y of k is 0 or 1)
% You may find logical arrays helpful for this task
    % let get the y of k, and we change it to multiclass format vector
    Yk = [1:num_labels] == y(i); % here is (1,10)
    Yk = Yk';% now we got the vector (10,1)

    delta_3 = a_3 - Yk; % (10,1)
    size(Theta2'); % (26,10)
    size(delta_3); % (10,1)

    % now we got (Theta2' * delta_3) as (26,10) * (10,1) = (26,1)
    % the formula tell us g'(z^2) = sigmoidGradient(a_2) which is (26,1)
    delta_2 = (Theta2' * delta_3) .* (a_2 .* (1- a_2));
    % newZ = [0; z_2]; delta_2 = (Theta2' * delta_3) .* sigmoidGradient(newZ); % alter right answer

    % remove delta_2 of zero index
    delta_2 = delta_2(2:end); %(25,1)

% Accumulate the gradient by formula
    Theta1_grad = Theta1_grad + delta_2 * (a_1);% (25,1) * (1,401) = (25,401)
    Theta2_grad = Theta2_grad + delta_3 * (a_2)';% (10,1) * (1,26) = (10,26)
end

Theta1_grad = Theta1_grad/m;
Theta2_grad = Theta2_grad/m;


%%%%%%%%%%%%% Backpropagation (vectorized)
a1 = X'; %(401 ,5000)
z2 = Theta1 * a1; % (25,401) * (401,5000) = (25,5000)
a2 = sigmoid(z2); % (25,5000)
a2 = [ones(1,m); a2]; % add the bias unit. (26,5000)
z3 = Theta2 * a2; % (10,26) * (26,5000) = (10,5000)
a3 = sigmoid(z3); % (10,5000)
delta3 = a3 - newY'; % (10,5000)
% now we got (Theta2' * delta3) as (26,10) * (10,5000) = (26,5000)
delta2 = (Theta2' * delta3) .* (a2 .* (1- a2));
% remove delta_2 of zero index(first row) (26, 5000) -> (25, 5000)
% delta2'(m+1:end) , it will remove first column as a vector, so we need to transform it
% coz we want to remove the first row
delta2 = reshape(delta2'(m+1 :end) ,m ,hidden_layer_size)'; % (25, 5000)

% or you can use delta2 = delta2(2:size(delta2,2), :) , it will return the same matrix as you desire

Theta1_grad = (1/m)* delta2 * a1';% (25,5000) * (5000,401) = (25,401)
Theta2_grad = (1/m)* delta3 * a2';% (10,5000) * (5000,26) = (10,26)

%%%%%%%% Regularized PART %%%%%%%%%%%%%%

Theta1_grad = Theta1_grad + (lambda/m)* newTheta1;
Theta2_grad = Theta2_grad + (lambda/m)* newTheta2;




