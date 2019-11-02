function [theta, J_history] = gradientDescent(X, y, theta, alpha, iterations)
  m = length(y);
  J_history = zeros(iterations,1);
  for i = 1:iterations
    h = sigmoid(X * theta);
    theta = theta - alpha * (1/m) * (X' * (h - y));
    J_history(i) = costFunction(theta, X,y);
  end
endfunction