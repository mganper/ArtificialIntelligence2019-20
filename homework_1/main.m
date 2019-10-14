%% EPD 6: Machine Learning – Regresión

%% Initialization
clear ; close all; clc

%% ======================= EJ1. Cargar y visualizar =======================

fprintf('Loading Data ...\n')


data = load('ex1data1.txt');
X=data(:,1);
y=data(:,2);

m = length(y);

% Plot Data
% Note: You have to complete the code in plotData.m

fprintf('Plotting Data ...\n')
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== EJ2.Función de coste ===================
fprintf('Running Cost Function ...\n')

% Some gradient descent settings
% Añada una columna con todos sus elementos a 1 a la matriz X como primera columna, e inicializar los parámetros theta a 0

X = [ones(m,1),X];
theta = zeros(2,1);

% compute and display initial cost
computeCost(X, y, theta)

%% =================== EJ3.Gradiente ===================
% run gradient descent
fprintf('Running Gradient Descent ...\n')

% Some gradient descent settings
% alpha 0.01 y 1500 como número de iteraciones

alpha = 0.01;
iterations = 1500;

[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen



%% =================== EJ4.Visualización ===================

% Plot the linear fit
% keep previous plot visible


% don't overlay any more plots on this figure


% Predict values for population sizes of 35,000 and 70,000

fprintf('Program paused. Press enter to continue.\n');
pause;
