close all
load d1b

figure('Color', 'w',...
       'Position', [10 10 800 600])

classifier = svmtrain(X, Y, 'autoscale', false, 'boxconstraint', 1, 'showplot', true);
w = classifier.Alpha' * classifier.SupportVectors;
b = classifier.Bias;
margin = max(2 * abs(w * classifier.SupportVectors' + b)/ norm(w));
Y2 = svmclassify(classifier, X, 'showplot', false);
hold on

misclassified = Y ~= Y2;
bias = sum(Y2(misclassified))/numel(Y2);
plot(X(misclassified, 1), X(misclassified, 2), 'ks', 'MarkerSize', 12)
classifier.FigureHandles{2}(2).Color = [0 0 1];
l = legend('location', 'northwest');
l.String{4} = sprintf('%0.5g x_1+%0.5g x_2 - %0.5g = 0',w(1),w(2), -b);
l.String{5} = 'misclassified';
l.EdgeColor = 'none';

title(sprintf('Box parameter: %0.5g, Margin: %0.5g, Bias: %0.5g', 1, margin, bias));

saveas(gcf, 'P2_1', 'png')