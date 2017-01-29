function [mu, sigma] = sge(x)
%
% SGE Mean and variance estimator for spherical Gaussian distribution                               
%
% x     : Data matrix of size n x p where each row represents a 
%         p-dimensional data point e.g. 
%            x = [2 1;
%                 3 7;
%                 4 5 ] is a dataset having 3 samples each
%                 having two co-ordinates.
%
% mu    : Estimated mean of the dataset [mu_1 mu_2 ... mu_p] 
% sigma : Estimated standard deviation of the dataset (number)                 
%
[n, p] = size(x);
mu = sum(x) / n;
centeredx = bsxfun(@minus, x, mu);
<<<<<<< HEAD
variance = centeredx' * centeredx;
sigma = sqrt(sum(variance(:))/n/p);
=======
sigma = sqrt(sum(centeredx(:) .^ 2)/n);

end

>>>>>>> df3562eb6989d66ce7a86ee68e02a6063f2e4143
