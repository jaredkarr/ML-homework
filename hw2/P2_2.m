clear, clc
load digits

data = data(:, :, [5 8]);
NperK = size(data, 2);
N = NperK * 2;

x = reshape(data, [256, N])';
y = repmat([1 -1], NperK, 1);
y = y(:);

scaledData = reshape(data, [16 16 N]) / 255;
rowvar = var(scaledData, 0, 2);
colvar = var(scaledData, 0, 1);
xvar = [reshape(rowvar, [16, N])', reshape(colvar, [16, N])'];

xcomb = [x, xvar];

numFolds = 5;
foldIndex = repmat(1:numFolds, ceil(N/numFolds), 1);
foldIndex = foldIndex(randperm(N));

errors = 0;
errorarr = [];
errorarr1 = [];
errorsvar = 0;
errorscomb = 0;

for fold = 1:numFolds
  validate = foldIndex(:) == fold;
  train = ~validate;

  [mu1, ~] = sge(x(y==1 & train, :));
  [mu2, ~] = sge(x(y==-1 & train, :));

  Ytest = new_classifier(x(validate, :), mu1, mu2);
  errors = errors + sum(Ytest ~= y(validate));
  errorarr = [errorarr sum(Ytest ~= y(validate))];

  [muvar1, ~] = sge(xvar(y==1 & train, :));
  [muvar2, ~] = sge(xvar(y==-1 & train, :));

  Ytestvar = new_classifier(xvar(validate, :), muvar1, muvar2);
  errorsvar = errorsvar + sum(Ytestvar ~= y(validate));
  errorarr1 = [errorarr1 sum(Ytestvar ~= y(validate))];

  [mucomb1, ~] = sge(xcomb(y==1 & train, :));
  [mucomb2, ~] = sge(xcomb(y==-1 & train, :));

  Ytestcomb = new_classifier(xcomb(validate, :), mucomb1, mucomb2);
  errorscomb = errorscomb + sum(Ytestcomb ~= y(validate));

end

errors
errorsvar
errorscomb
errorarr./length(Ytest)
errorarr1./length(Ytestvar)
err = sum(errorarr./length(Ytest))/5
err1 = sum(errorarr1./length(Ytestvar))/5
