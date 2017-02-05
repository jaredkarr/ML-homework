function [ Ytest ] = new_classifier( Xtest, mu1, mu2 )
%NEW_CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

b = 1/2*(mu1+mu2);
Ytest = sign((mu1-mu2)*(Xtest-b)'/(norm(mu1-mu2)^2));
end

