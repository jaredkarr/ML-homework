function [ P1,P2 , YTest ] = sph_bayes( XTest, mu1, mu2, sigma1, sigma2 )%Other parameters needed.

[N, ~] = size(XTest);

x1 = bsxfun(@minus, XTest, mu1);
x2 = bsxfun(@minus, XTest, mu2);

LH1 = (1 / sigma1^2) * exp(-sum(x1 .* x1, 2) / 2 / sigma1^2);
LH2 = (1 / sigma2^2) * exp(-sum(x2 .* x2, 2) / 2 / sigma2^2);

P1 = LH1./(LH1+LH2);
P2 = 1 - P1;

YTest = ones(N, 1);
YTest(P2 > 0.5) = -1;

end
