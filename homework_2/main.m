%% HOMEWORK#2 - Logistic regression

%% Initialization
clear ; close all; clc

% ======================= Ejercicio 1: Carga y visualizacion de datos ==========

data = load("data_flower.txt");

X = data(:,1:2);
y = data(:,3);

fprintf(['Data loaded.']);

fprintf(['Plotting data...']);

plotData(X, y);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% ======================= Ejercicio 2: Modelo y frontera de decision ==========


%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);
X = [ones(m,1) X];

% Initialize fitting parameters


% Compute and display initial cost and gradient
initial_theta = zeros(n+1, 1);

[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

fprintf('\nProgram paused. Press enter to continue.\n\n');
pause;

theta = zeros(n+1, 1);

alpha = 0.01;
iterations = 10;

[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

% Plot Boundary
% Only need 2 points to define a line, so choose two endpoints (min,max) of X1 and calculate X2
plotDecisionBoundary(theta, X, y);
    
% Labels and Legend
xlabel("Exam 1 score");
ylabel("Exam 2 score");
legend("Admitted", "Not Admitted", "Decision Boundary");

fprintf('\nProgram paused. Press enter to continue.\n\n');
pause;

%% ============== EJ5. Predict ==============
%  Predict probability for a student with score 45 on exam 1 
%  and score 85 on exam 2 
prob = sigmoid([1 45 85] * theta)


%% ============== EJ6. Predict and Accuracies ==============
% Compute accuracy on our training set
p = predict(theta, X);

fprintf("\nExactitud: %f\n", mean(p==y)*100);     %Porcentaje de acierto


fprintf('\nProgram paused. Press enter to continue.\n\n');
pause;

