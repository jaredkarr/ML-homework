load('dataset1.mat');

[mu, sigma] = sge(x);
x1 = 0:0.01:10;
x2 = 0:0.001:1;

fig1 = figure(1)
plot(x_axis_1,prior(x1, 1,1))
hold on
plot(x_axis_1, posterior(x1,1,1,sigma))
saveas(fig1, 'P2_2a', 'png')

fig2 = figure(2)
plot(x_axis_1,prior(x2,10,1))
hold on
plot(x_axis_1, posterior(x2,10,1,sigma))
saveas(fig2, 'P2_2b', 'png')