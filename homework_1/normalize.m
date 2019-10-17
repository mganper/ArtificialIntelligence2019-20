function [X mu sigma] = normalize(X)
  mu = zeros(1, size(X, 2));
  sigma = zeros(1, size(X, 2));
  
  m = size(X, 1);
  
  mu = mean(X);
  sigma = std(X);
  
  %X = (X - ones(m,1) * mu) ./ (ones(m, 1) * sigma);
  
  X = (X - mu) ./ sigma;
endfunction
  