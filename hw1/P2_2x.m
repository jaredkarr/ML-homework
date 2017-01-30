load dataset1.mat

[n, ~] = size(x)

alphaA = 1;
betaA = 1;
alphaB = 10;
betaB = 1;

[~, sigma] = sge(x)
sMLE = sigma * sigma;

alphaApost = alphaA + n;
betaApost = betaA + n * sMLE;
alphaBpost = alphaB + n;
betaBpost = betaB + n * sMLE;

invgamma = @(s, a, b) exp(a * log(b)-gammaln(a)-(a+1)*log(s)-b./s);

s = linspace(0, 1.5, 800);
hold on
plot(s, invgamma(s, alphaA, betaA))
plot(s, invgamma(s, alphaApost, betaApost))
plot(s, invgamma(s, alphaB, betaB))
plot(s, invgamma(s, alphaBpost, betaBpost))

% MAP estimates
sA = betaApost / (alphaApost + 1)
sB = betaBpost / (alphaBpost + 1)

bayesFactor = exp(n * (log(sB) - log(sA) + sMLE / sB - sMLE / sA))

% posterior probability that model A is the "true" model
pMA = bayesFactor / (1 + bayesFactor)