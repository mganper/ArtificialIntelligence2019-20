function execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
  
  initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 50);

  costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size,...
                                   hidden_layer_size,...
                                   num_labels, X, y, lambda);

  [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

  thN = hidden_layer_size * (input_layer_size + 1);
  Theta1 = reshape(nn_params(1:thN), hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(nn_params((1 + thN):end), num_labels, (hidden_layer_size + 1));

  plot_decision_boundary(Theta1,Theta2, X, y)

  p = predict(Theta1, Theta2, X);

  fprintf("\nExactitud: %f\n", mean(p==y)*100);
  
endfunction