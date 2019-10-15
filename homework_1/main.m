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

[testCmp, trainigCmp] = testTraining(data);

trainigX = trainigCmp(:,1:7);
trainigY = trainigCmp(:,8);

testX = testCmp(:,1:7);
testY = testCmp(:,8);

fprintf('Calculando thetas: \n\n');

[thetaDes, thetaPeso, thetaAcel, theta] = normalEqn(trainigX,trainigY);

fprintf('Calculando y mostrando errores: \n\n');

JDes = computeCost(testX, testY, thetaDes)
  
JPeso = computeCost(testX, testY, thetaPeso)
  
JAcel = computeCost(testX, testY, thetaAcel)
  
J = computeCost(testX, testY, theta)

fprintf('Program paused. Press enter to continue.\n');
pause;

% ======================= Ejercicio 3: Graficas ================================

visualizandoDatos(data, thetaDes, thetaPeso, thetaAcel, theta);



