%X has size 5000 x 400
%Theta1 has size 25 x 401
%Theta2 has size 10 x 26

% Add ones to the X data matrix
X = [ones(m, 1) X]; % 5000 x 401

%get z2 then get A2
z2 = X * Theta1' ;
A2 = sigmoid(z2); % 5000 x 25

% Add ones to the A2 matrix
A2 = [ones(m, 1) A2]; % 5000 x 26

[Ans, AnsIndex] = max(A2 * Theta2' , [] ,2);
p = AnsIndex;

% one line solution
[Ans, p ] = max(sigmoid( [ones(m, 1) sigmoid([ones(m, 1) X] * Theta1')] * Theta2')) , [] ,2);
