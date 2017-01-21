hold on

mu = [1; 1];
sigma = [0.1 -0.05; -0.05 0.2];

points = arrayfun(@(x)(mvnrnd(mu, sigma)), 1:1000, 'UniformOutput', false);


val = arrayfun(@(k) func(transpose(points{k}),3), 1:numel(points));

inPoints = arrayfun(@(x) points(x), find(val >= 0));
outPoints = arrayfun(@(x) points(x), find(val < 0));

inX = cellfun(@(p) p(1), inPoints);
inY = cellfun(@(p) p(2), inPoints);

outX = cellfun(@(p) p(1), outPoints);
outY = cellfun(@(p) p(2), outPoints);

axis = [min([(min([outX inX])) (min([outY inY]))]) max([(max([outX inX])) (max([outY inY]))])];

r1 = ezplot(@(x,y) func([x;y], 1), axis);
r2 = ezplot(@(x,y) func([x;y], 2), axis);
r3 = ezplot(@(x,y) func([x;y], 3), axis);

set(r1, 'Color', 'red');
set(r2, 'Color', 'cyan');
set(r3, 'Color', 'green');
set(r1, 'DisplayName', 'r=1');
set(r2, 'DisplayName', 'r=2');
set(r3, 'DisplayName', 'r=3');
legend('show');
scatter(inX, inY, 30, 'blue', 'x');
scatter(outX, outY, 30, 'black', 'x');

p = size(outPoints);
i = p(2);
title(strcat({'Points outside f(x,3)=0 is '}, num2str((i))))


hold off


