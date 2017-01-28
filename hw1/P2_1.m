load('dataset1.mat');

scatter(x(:,1),x(:,2));
N = size(x);
[mu, sigma] = sge(x);
hold on

for i=1:3
    theta = 0:0.01:2*pi;
    p = plot(i*sigma*cos(theta)+mu(1),i*sigma*sin(theta)+mu(2));
    inside = sum(hypot(x(:,1)-mu(1),x(:,2)-mu(2))< i*sigma);
    set(p, 'DisplayName', sprintf('%.4f points inside %d', (inside/N(1)),i));
end

legend('show');
