%% Homework#3

%% Initialization
clear ; close all; clc

%% Parameter setup
input_layer_size  = 2;  
hidden_layer_size = 2;   
num_labels = 2;          

%% ================ EJ1. Plotting data ================

% Load Training Data
fprintf('Loading Data ...\n')

data = load('data_15.txt');

X = data(:,1:2);
y = data(:,3);

m = size(X, 1);

% Plot Data

plotData(X, y);

%% ================ EJ2. Implementing Neural Network ================

% Definig initial thetas

initial_Theta1 = [-0.0893, -0.0789, 0.0147; 0.1198, -0.1122, 0.0916];

initial_Theta2 = [0.0406, -0.0743, -0.0315];

% Unroll parameters 

%nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

lambda = 0;

%[J, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

%J

%grad

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

% ejersisio 3

hidden_layer_size = 1;

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 10);

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

hidden_layer_size = 2;

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 10);

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

hidden_layer_size = 3;

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 10);

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

hidden_layer_size = 4;

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 10);

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

hidden_layer_size = 5;

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 10);

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

hidden_layer_size = 20;

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 10);

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

hidden_layer_size = 50;

%execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

initial_nn_params = generateThetas(input_layer_size, hidden_layer_size, num_labels);
  
  options = optimset('MaxIter', 10);

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

% ejersisio 4
