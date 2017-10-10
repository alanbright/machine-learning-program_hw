size(X); % 300 * 2
m; % 300
n; % 2
for i = 1: K
  properIDV = idx' == i;
  %size(properIDV); %(1, 300)
  % get the same groups left data , and sum it up by matrix multiple
    %size(properIDV * X) %(1, 2)
  % and divide by numbers of groups member
    %(properIDV * X) / sum(properIDV);
  centroids(i, :) = (properIDV * X) / sum(properIDV);
end
