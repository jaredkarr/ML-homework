close all; clear all;
X = load('dataset0.txt');
covX = cov(X);
corX = corrcoef(X);

Y = (X - min(X))./(max(X)-min(X));
covY = cov(Y);
corY = corrcoef(Y);

[minimumCorrelation, index] = min(corY(:));
[feature2, feature1] = ind2sub(size(corY), index);

figure('Color', 'w',...
       'Position', [10 10 800 600])

subplot(2, 2, 1)
imagesc(covX)
title('Covariance of X')
colorbar

subplot(2, 2, 2)
imagesc(corX)
title('Correlation coefficients of X')
colorbar

subplot(2, 2, 3)
imagesc(covY)
title('Covariance of Y')
colorbar

subplot(2, 2, 4)
imagesc(corY)
title('Correlation coefficients of Y')
colorbar

figure('Color', 'w',...
       'Position', [10 10 800 600])
plot(Y(:, feature1), Y(:, feature2), 'k.')
title(sprintf('Minimum correlation %f', minimumCorrelation))
xlabel(sprintf('feature %d', feature1))
ylabel(sprintf('feature %d', feature2))
