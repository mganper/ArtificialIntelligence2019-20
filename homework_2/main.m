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

%% ======================= Ejercicio 2: Modelo y frontera de decision ==========


%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);
X = [ones(m,1) X];

% Initialize fitting parameters


% Compute and display initial cost and gradient
initial_theta = zeros(n+1, 1);

[cost, grad] = costFunction(initial_theta, X, y);

fprintf('\n\nCost at initial theta (zeros): %f\n', cost);
%fprintf('Gradient at initial theta (zeros): \n');
%fprintf(' %f \n', grad);

theta = zeros(n+1, 1);

alpha = 0.01;
iterations = 200;

fprintf('\nAlpha: %.2f',alpha);
fprintf('\nIterations: %d',iterations);
fprintf('\nExecuting Gradient Descent...');
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

%Grafica de convergencia del error del descenso del gradiente.
subplot(2,2,1); 
plot(1:numel(J_history), J_history, '-b','LineWidth',2);
xlabel('Number of iterations');
ylabel('Cost J');

% Plot Boundary
subplot(2,2,2);
plotDecisionBoundary(theta, X, y);
 

p = predict(theta, X);
fprintf("\nAccuracy: %.2f \n", mean(p==y)*100);     %Porcentaje de acierto

%% ======================= Ejercicio 3: Modelo y frontera de decision ==========

fprintf('\nApplying Map Feature...\n');

X = mapFeature(data(:,1), data(:,2));

[m, n] = size(X);
%X = [ones(m,1) X];

% Initialize fitting parameters


% Compute and display initial cost and gradient
%initial_theta = zeros(n+1, 1);

initial_theta = zeros(n, 1);

[cost, grad] = costFunction(initial_theta, X, y);

%fprintf('Gradient at initial theta (zeros): \n');
%fprintf(' %f \n', grad);

%theta = zeros(n+1, 1);

theta = zeros(n, 1);

alpha = 0.0000007;
iterations = 200;

fprintf('\nAlpha: %.7f',alpha);
fprintf('\nIterations: %d',iterations);
fprintf('\nExecuting Gradient Descent...');

[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

%Grafica de convergencia del error del descenso del gradiente.
subplot(2,2,3);
plot(1:numel(J_history), J_history, '-b','LineWidth',2);
xlabel('Number of iterations');
ylabel('Cost J');

% Plot Boundary
subplot(2,2,4);
plotDecisionBoundary(theta, X, y);

%% ============== Prediction ===================================================
p = predict(theta, X);
fprintf("\nAccuracy: %.2f \n", mean(p==y)*100);     %Porcentaje de acierto


