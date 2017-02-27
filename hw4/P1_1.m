figure('Color', 'w',...
       'Position', [10 10 600 450])
hold on
set(gca, 'Box', 'on')
axis([-1, 5, -1, 5])

plot([2, 4, 4], [2, 4, 0], '^r')
plot([0, 0, 2], [0, 2, 0], 'sb')
plot([-1, 4], [4, -1], '--k')

plot([2, 1.5], [2, 1.5], ':k')
plot([4, 3.5], [0,-0.5], ':k')
plot([0, 0.5], [2, 2.5], ':k')
plot([2, 2.5], [0, 0.5], ':k')

legend('+1', '-1', 'x_1 + x_2 - 3 = 0', 'Location', 'north')

saveas(gcf, 'P1_1', 'png')
