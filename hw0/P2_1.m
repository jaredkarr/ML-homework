figure('Color', 'w',...
       'Position', [10 10 800 600])
hold on
set(gca, 'Box', 'on')

N = 1000;
%mu = [1; 1];
mu = [1 1];
sigma = [0.1 -0.05; -0.05 0.2];
f = @(x, r) sum(((x - mu) * inv(sigma)) .* (x - mu), 2) / 2 - r;

%points = arrayfun(@(x)(mvnrnd(mu, sigma)), 1:1000, 'UniformOutput', false);
points = mu + randn(N, 2) * chol(sigma);

%val = arrayfun(@(k) func(transpose(points{k}),3), 1:numel(points));
isIn = f(points, 3) < 0;

%inPoints = arrayfun(@(x) points(x), find(val >= 0));
%outPoints = arrayfun(@(x) points(x), find(val < 0));

%inX = cellfun(@(p) p(1), inPoints);
%inY = cellfun(@(p) p(2), inPoints);

%outX = cellfun(@(p) p(1), outPoints);
%outY = cellfun(@(p) p(2), outPoints);

%axis = [min([(min([outX inX])) (min([outY inY]))]) max([(max([outX inX])) (max([outY inY]))])];
range = [min(points)-0.05; max(points)+0.05];
range = range(:)';

%r1 = ezplot(@(x,y) func([x;y], 1), axis);
%r2 = ezplot(@(x,y) func([x;y], 2), axis);
%r3 = ezplot(@(x,y) func([x;y], 3), axis);
r1 = ezplot(@(x, y)(f([x, y], 1)), range);
r2 = ezplot(@(x, y)(f([x, y], 2)), range);
r3 = ezplot(@(x, y)(f([x, y], 3)), range);

set(r1, 'Color', 'red', 'DisplayName', 'r=1');
set(r2, 'Color', 'green', 'DisplayName', 'r=2');
set(r3, 'Color', 'blue', 'DisplayName', 'r=3');
legend('show');

%scatter(inX, inY, 30, 'blue', 'x');
%scatter(outX, outY, 30, 'black', 'x');
plot(points(isIn, 1), points(isIn, 2), 'b.');
plot(points(~isIn, 1), points(~isIn, 2), 'k.');

%p = size(outPoints);
%i = p(2);
%title(strcat({'Points outside f(x,3)=0 is '}, num2str((i))))
title(sprintf('%d points outside f(x, 3) = 0', nnz(~isIn)))
xlabel('x_1')
ylabel('x_2', 'rot', 0)
