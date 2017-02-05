function [ P1,P2 , YTest ] = sph_bayes( XTest, mu1, mu2, sigma1, sigma2 )%Other parameters needed.
%SPH_BAYES Summary of this function goes here
%   Detailed explanation goes here

LH1 = (1/(2*pi*(sigma1^2)))*exp(-((x-mu1)*(x-mu1)')/(2*(sigma1^2)));
LH2 = (1/(2*pi*(sigma2^2)))*exp(-((x-mu2)*(x-mu2)')/(2*(sigma2^2)));
P1 = LH1/(LH1+LH2)
P2 = LH2/(LH1+LH2)

if (P1 > P2)
    Ytest = 1;
else
    Ytest = -1;
end
end

