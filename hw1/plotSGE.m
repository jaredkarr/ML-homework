function f = plotSGE(x)

f = figure('Color', 'w',...
           'Position', [10 10 800 600]);
hold on
set(gca, 'Box', 'on');

plot(x(:,1), x(:,2), 'k.')

[mu, sigma] = sge(x);
disp(sigma)

rectangle('Position', [mu - sigma, 2 * sigma, 2 * sigma],...
          'Curvature', 1,...
          'EdgeColor', 'r');
rectangle('Position', [mu - 2 * sigma, 4 * sigma, 4 * sigma],...
          'Curvature', 1,...
          'EdgeColor', 'g')
rectangle('Position', [mu - 3 * sigma, 6 * sigma, 6 * sigma],...
          'Curvature', 1,...
          'EdgeColor', 'b')

% invisible plots for legend
r1 = plot(mu(1), mu(2), 'r-');
r2 = plot(mu(1), mu(2), 'g-');
r3 = plot(mu(1), mu(2), 'b-');

legend([r1 r2 r3], 'red', 'green', 'blue')
      