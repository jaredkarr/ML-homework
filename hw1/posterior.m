function p = posterior(s, alpha, beta, sigma )

    p = prior(s,alpha+1,beta+1/2*sigma^2);

end

