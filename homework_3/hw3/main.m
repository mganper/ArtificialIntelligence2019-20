%% Homework#3

%% Initialization
clear ; close all; clc
warning('off','all');

%% Parameter setup
input_layer_size  = 2;  
hidden_layer_size = 1;   
num_labels = 1;          

%% ================ EJ1. Plotting data =========================================
fprintf('================ EJ1. Plotting data ================\n');
% Load Training Data
fprintf('Loading Data ...\n')

data = load('data_15.txt');

X = data(:,1:2);
y = data(:,3);

m = size(X, 1);

% Plot Data

plotData(X, y);

%% ================ EJ2. Implementing Neural Network ===========================
fprintf('\n\n================ EJ2. Implementing Neural Network ================\n');
% Definig initial thetas

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);

initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);


% Unroll parameters 

nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

lambda = 0;

[J, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

J

%grad

execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
title("Ejercicio 2");


%% ================ EJ3. Neural Network Neurons Behavior =======================
fprintf('\n\n================ EJ3. Neural Network Neurons Behavior ================\n');

% Neuronas en la capa oculta: 1
hidden_layer_size = 1;
fprintf('##########\n');
fprintf('Neurons: 1');
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 1");

% Neuronas en la capa oculta: 2
hidden_layer_size = 2;
fprintf('##########\n');
fprintf("Neurons: 2");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 2");

% Neuronas en la capa oculta: 3
hidden_layer_size = 3;
fprintf('##########\n');
fprintf("Neurons: 3");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 3");

% Neuronas en la capa oculta: 4
hidden_layer_size = 4;
fprintf('##########\n');
fprintf("Neurons: 4");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 4");

% Neuronas en la capa oculta: 5
hidden_layer_size = 5;
fprintf('##########\n');
fprintf("Neurons: 5");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 5");

% Neuronas en la capa oculta: 10
hidden_layer_size = 10;
fprintf('##########\n');
fprintf("Neurons: 10");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 10");

% Neuronas en la capa oculta: 20
hidden_layer_size = 20;
fprintf('##########\n');
fprintf("Neurons: 20");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 20");

% Neuronas en la capa oculta: 50
hidden_layer_size = 50;
fprintf('##########\n');
fprintf("Neurons: 50");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 50");


%% ================ EJ4. Neural Network Lambda Behavior ========================
fprintf('\n\n================ EJ4. Neural Network Lambda Behavior ================\n');

% Neuronas en la capa oculta: 10
hidden_layer_size = 10;

% Lambda = 0.01
lambda = 0.01;
fprintf('##########\n');
fprintf("Neurons: 10, Lambda = 0.01");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 10, Lambda = 0.01");

% Lambda = 0.03
lambda = 0.03;
fprintf('##########\n');
fprintf("Neurons: 10, Lambda = 0.03");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 10, Lambda = 0.03");

% Lambda = 0.1
lambda = 0.1;
fprintf('##########\n');
fprintf("Neurons: 10, Lambda = 0.1");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 10, Lambda = 0.1");

% Lambda = 0.3
lambda = 0.3;
fprintf('##########\n');
fprintf("Neurons: 10, Lambda = 0.3");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 10, Lambda = 0.3");

% Lambda = 1
lambda = 1;
fprintf('##########\n');
fprintf("Neurons: 10, Lambda = 1");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 10, Lambda = 1");

% Lambda = 3
lambda = 3;
fprintf('##########\n');
fprintf("Neurons: 10, Lambda = 3");
execute(input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
title("Neurons: 10, Lambda = 3");

