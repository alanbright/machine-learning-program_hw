m; % 307
n; % 2
size(X); % 307,2

mu = (1/m)*sum(X)'; % (2, 1)
repeatMu = repmat(mu', m ,1);
sigma2 = (1/m)*sum((X - repeatMu).^2)';
%size(sigma2);
