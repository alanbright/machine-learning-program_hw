size(X); % 5 3
size(Theta); % 4 3
size(Y); % 5,4
%J = sum(sum(((X * Theta').*R  - Y).^2)) / 2;

%(X * Theta').*R  - Y % 5,4
%X_grad = ((X * Theta').*R  - Y) * Theta; % (5, 4) * (4 , 3) = (5, 3)
%Theta_grad = ((X * Theta').*R  - Y)' * X; % (4, 5) * (5 , 3) = (4, 3)

J = sum(sum(((X * Theta').*R  - Y).^2)) / 2 + (sum(Theta(:).^2)+sum(X(:).^2))*lambda/2;
X_grad = ((X * Theta').*R  - Y) * Theta + lambda * X ; 
Theta_grad = ((X * Theta').*R  - Y)' * X + lambda * Theta;
