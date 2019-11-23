function [J, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                                     num_labels, X, y, lambda)
                                     
  thN = hidden_layer_size * (input_layer_size + 1);
  
  Theta1 = reshape(nn_params(1:thN), hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(nn_params(thN + 1:end), num_labels, (hidden_layer_size + 1));
  
  m = size(X, 1);
  suma = 0;
  D1 = zeros(size(Theta1));
  D2 = zeros(size(Theta2));
  
  for i=1:m
    [a1 a2 a3] = forward(Theta1, Theta2, X, i);
    aux = (1:num_labels == y(i));
    h = a3;
    suma += aux * log(h) + (1 - aux) * log(1 - h);
    delta3 = a3 - aux';
    delta2 = (Theta2' * delta3) .* ((1-a2).*a2);
    delta2 = delta2(2:end);
    D1 = D1 + delta2 * a1';
    D2 = D2 + delta3 * a2';
  end
  
  J = (-1 / m) * suma;
  D1 = (1/m) * D1;
  D2 = (1/m) * D2;
  
  grad = [D1(:); D2(:)];
  
endfunction
  