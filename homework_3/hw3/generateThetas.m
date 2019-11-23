function [initial_nn_params] = generateThetas(input_layer_size, hidden_layer_size, num_labels)
  W = randInitializeWeights(input_layer_size, hidden_layer_size);

  fprintf('\nInitializing Neural Network Parameters ...\n')

  initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
  initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

  % Unroll parameters
  initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
endfunction