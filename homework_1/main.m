%% Homework 1

%% Inicialización
clear ; close all; clc

fprintf('Loading Data ...\n');

data = csvread('autos.csv');
X=data(:,1:7);
y=data(:,8);

% ======================= Ejercicio 1: Estadísticas ============================

fprintf('Estadisticas: \n');

[xMean, xSTD, xMin, xMax] = estadisticas(data);

fprintf('Program paused. Press enter to continue.\n');
pause;

% ======================= Ejercicio 2: Modelo de regresión =====================

fprintf('Creando conjunto de test y de trainig: \n\n');

[testCmp, trainingCmp] = testTraining(data);

trainingX = trainingCmp(:,1:7);
trainingY = trainingCmp(:,8);

testX = testCmp(:,1:7);
testY = testCmp(:,8);

fprintf('Calculando thetas: \n\n');

[m,n] = size(trainingX);
[a,b] = size(testX);

testX = [ones(a,1) testX];

[trainingX mu sigma] = normalize(trainingX);

trainingX = [ones(m,1) trainingX];

theta = zeros(n+1, 1);

[thetaDes, thetaPeso, thetaAcel, theta] = normalEqn(trainingX,trainingY);

fprintf('Calculando y mostrando errores: \n\n');

JDes = computeCost(testX, testY, thetaDes)
  
JPeso = computeCost(testX, testY, thetaPeso)
  
JAcel = computeCost(testX, testY, thetaAcel)
  
J = computeCost(testX, testY, theta)

fprintf('Program paused. Press enter to continue.\n');
pause;

% ======================= Ejercicio 3: Graficas ================================

visualizandoDatos(data, thetaDes, thetaPeso, thetaAcel, theta);

% ======================= Ejercicio 4: Descenso del Gradiente ==================

fprintf('Calculando thetas: \n\n');

%Normalizar datos



%================

alpha = 0.05;
iterations = 300;

theta0 = zeros(n+1,1);
thetaDes0 = zeros(1,1);
thetaPeso0 = zeros(1,1);
thetaAcel0 = zeros(1,1); 

[theta0, J_history] = gradientDescent(trainingX, trainingY, theta0, alpha, iterations);
[thetaDes0, J_historyDes] = gradientDescent(trainingX(:,3), trainingY, thetaDes0, alpha, iterations);
[thetaPeso0, J_historyPeso] = gradientDescent(trainingX(:,5), trainingY, thetaPeso0, alpha, iterations);
[thetaAcel0, J_historyAcel] = gradientDescent(trainingX(:,6), trainingY, thetaAcel0, alpha, iterations);

figure;
plot(1:numel(J_history), J_history, '-b','LineWidth',2);
xlabel('Number of iterations');
ylabel('Cost J');

%theta0
%thetaDes0
%thetaPeso0
%thetaAcel0

fprintf('Calculando y mostrando errores: \n\n');

%JDes0 = computeCost(testX, testY, thetaDes0);
JDes0 = J_historyDes(end);  

JPeso0 = computeCost(testX, testY, thetaPeso0);
  
JAcel0 = computeCost(testX, testY, thetaAcel0);

J0 = computeCost(testX, testY, theta0);

JDes
JDes0

JPeso
JPeso0

JAcel
JAcel0

J
J0
