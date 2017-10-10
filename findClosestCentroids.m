X; % (m, 2)
idx; %(m, 1)
%now we build matrix , each column mapping to each centroids 's distance error
distance = zeros(size(X,1),K);
for i = 1:K
  % build a matrix subtract by the ith centroids
    %X - centroids(i,:);
  % we got square
    %(X - centroids(i,:)) .^2);
  % then we sum up the rows and
    %sum(((X - centroids(i,:)) .^2), 2);
  %put it as the ith columns
  distance(:,i) = sum(((X - centroids(i,:)) .^2), 2);
end
%then we got the idx of min distance of each column in the distance matrix
[minDistance, idx] = min(distance, [], 2);

% this can use more advance vectorlization.
% build (m , 6) matrix to multiple [1 0 0; 1 0 0; 0 1 0; 0 1 0; 0 0 1; 0 0 1];
% then we can (m, 6) * (6 , 3) = (m , 3) !
% but this implement is too complicated to apply. especially the build the matrix

%{
n = size(X,2)
sumM = zeros(K*n, K);
newX = [];
for i = 1:K
  for j = 1:n
    sumM((i-1)*n +j ,i) = 1;
  end
  % build the new X
  newX = [newX , X];
end
sumM;

% compute the distance at one operation.
distance = ((newX - centroids(:)') .^2) * sumM;
[minDistance, idx] = min(distance, [], 2);
%}
