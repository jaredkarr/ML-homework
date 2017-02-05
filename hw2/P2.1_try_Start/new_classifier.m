function [ Ytest ] = new_classifier( Xtest, mu1, mu2 )
%NEW_CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

b = 1/2*(mu1+mu2);
Ytest = sign(bsxfun(@minus, Xtest, b)*(mu1-mu2)');
end
