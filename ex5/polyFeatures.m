size(X_poly); % (12 , 8)
size(X); %(12 1)
p; % 8
size(X_poly(:, 1)); % (12, 1)
for i = 1:p
  X_poly(:, i) = X .^ i;
end
X_poly;
