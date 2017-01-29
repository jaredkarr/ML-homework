function f = plotSGE(x)

f = figure('Color', 'w',...
           'Position', [10 10 800 600]);
hold on
set(gca, 'Box', 'on');

[n, p] = size(x);
plot(x(:,1), x(:,2), 'k.')

[mu, sigma] = sge(x);
centeredx = bsxfun(@minus, x, mu);
z = sqrt(sum(centeredx.^2,2)) / sigma;

rectangle('Position', [mu([1 2]) - sigma, 2 * sigma, 2 * sigma],...
          'Curvature', 1,...
          'EdgeColor', 'g');
rectangle('Position', [mu([1 2]) - 2 * sigma, 4 * sigma, 4 * sigma],...
          'Curvature', 1,...
          'EdgeColor', 'r')
rectangle('Position', [mu([1 2]) - 3 * sigma, 6 * sigma, 6 * sigma],...
          'Curvature', 1,...
          'EdgeColor', 'b')

% invisible plots for legend
r1 = plot(mu(1), mu(2), 'g-');
r2 = plot(mu(1), mu(2), 'r-');
r3 = plot(mu(1), mu(2), 'b-');

l = legend([r1 r2 r3],...
    sprintf('k=1  %1.4f',nnz(z>1)/n),...
    sprintf('k=2  %1.4f',nnz(z>2)/n),...
    sprintf('k=3  %1.4f',nnz(z>3)/n));
legend boxoff
t = get(l, 'title')
set(t, 'string', 'Fraction outside');

title('Spherical Gaussian estimation')
xlabel('x_1'); ylabel('x_2', 'rot', 0);