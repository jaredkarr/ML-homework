function res = func(x, r)
    mu = [1; 1];
    sigma = [0.1 -0.05; -0.05 0.2];
    res = (transpose(x - mu) * inv(sigma) * (x - mu)) ./ 2 - r;
end

