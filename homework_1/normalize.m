function X = normalize(X)
  [m, n] = size(X);
  mu = zeros(1, n);
  sigma = zeros(1, n);
    
  mu = mean(X);
  sigma = std(X);
  
  %X = (X - ones(m,1) * mu) ./ (ones(m, 1) * sigma);
  
  X = (X - mu) ./ sigma;
endfunction
  