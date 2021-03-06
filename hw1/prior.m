function p = prior(s, alpha, beta)

    p = beta.^alpha/gamma(alpha)*s.^(-alpha-1).*exp(-beta./s);
end

