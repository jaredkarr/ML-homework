close all
load d2

figure('Color', 'w',...
       'Position', [10 10 800 600])

classifier = svmtrain(X, Y, 'autoscale', false, 'boxconstraint', 1,'kernel_function','linear', 'showplot', true);
Y2 = svmclassify(classifier, X, 'showplot', false);
hold on

misclassified = Y ~= Y2;
bias = sum(Y2(misclassified))/numel(Y2);
plot(X(misclassified, 1), X(misclassified, 2), 'ks', 'MarkerSize', 12)

classifier.FigureHandles{2}(2).Color = [0 0 1];
l = legend('location', 'northwest');
l.String{4} = 'decision boundary';
l.String{5} = 'misclassified';
l.EdgeColor = 'none';

title('Linear kernel, C=1')
saveas(gcf, 'P2_2a', 'png')

figure('Color', 'w',...
       'Position', [10 10 800 600])

classifier2 = svmtrain(X, Y, 'autoscale', false, 'boxconstraint', 1,'kernel_function','quadratic', 'showplot', true);
Y2 = svmclassify(classifier2, X, 'showplot', false);
hold on
%{
misclassified = Y ~= Y2;
bias = sum(Y2(misclassified))/numel(Y2);
plot(X(misclassified, 1), X(misclassified, 2), 'ks', 'MarkerSize', 12)
%}
classifier2.FigureHandles{2}(2).Color = [0 0 1];
l = legend('location', 'northwest');
l.String{4} = 'decision boundary';
%l.String{5} = 'misclassified';
l.EdgeColor = 'none';

title('Quadratic kernel, C=1');
saveas(gcf, 'P2_2b', 'png')

figure('Color', 'w',...
       'Position', [10 10 800 600])

classifier3 = svmtrain(X, Y, 'autoscale', false, 'boxconstraint', 1,'kernel_function','rbf', 'showplot', true);
Y2 = svmclassify(classifier3, X, 'showplot', false);
hold on
%{
misclassified = Y ~= Y2;
bias = sum(Y2(misclassified))/numel(Y2);
plot(X(misclassified, 1), X(misclassified, 2), 'ks', 'MarkerSize', 12)
%}
classifier3.FigureHandles{2}(2).Color = [0 0 1];
l = legend('location', 'northwest');
l.String{4} = 'decision boundary';
%l.String{5} = 'misclassified';
l.EdgeColor = 'none';

title('RBF kernel, C=1');
saveas(gcf, 'P2_2c', 'png')
