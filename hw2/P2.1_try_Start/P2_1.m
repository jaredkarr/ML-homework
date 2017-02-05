clear, clc

load('dataset2.mat');
class1 = find(y==1);
class2 = find(y==-1);

[mu1,sigma1] = sge(x(class1,:));
[mu2,sigma2] = sge(x(class2,:));

mu=[mu1;mu2];
sigma = [sigma1;sigma2];

