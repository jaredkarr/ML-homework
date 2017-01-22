figure('Color', 'w',...
       'Position', [10 10 800 600])
hold on
set(gca, 'Box', 'on')

N = 1000;
mu = 1;
sigma = [0.1 -0.05; -0.05 0.2];
f = @(x, r) sum(((x - mu) /sigma) .* (x - mu), 2) / 2 - r;

points = mu + randn(N, 2) * chol(sigma);

isIn = f(points, 3) < 0;

range = [min(points)-0.05; max(points)+0.05];
range = range(:)';

r1 = ezplot(@(x, y)(f([x, y], 1)), range);
r2 = ezplot(@(x, y)(f([x, y], 2)), range);
r3 = ezplot(@(x, y)(f([x, y], 3)), range);

set(r1, 'Color', 'red', 'DisplayName', 'r=1');
set(r2, 'Color', 'green', 'DisplayName', 'r=2');
set(r3, 'Color', 'blue', 'DisplayName', 'r=3');
legend('show');

plot(points(isIn, 1), points(isIn, 2), 'b.');
plot(points(~isIn, 1), points(~isIn, 2), 'k.');

title(sprintf('%d points outside f(x, 3) = 0', nnz(~isIn)))
xlabel('x_1')
ylabel('x_2', 'rot', 0)
saveas(gcf, 'P2_1', 'epsc')

