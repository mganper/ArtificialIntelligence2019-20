%% Homework 1

%% Inicialización
clear ; close all; clc

fprintf('Cargando datos ...\n\n');

data = csvread('autos.csv');
X=data(:,1:7);
y=data(:,8);

% ======================= Ejercicio 1: Estadísticas ============================

fprintf('Estadisticas: \n\n');

[xMean, xSTD, xMin, xMax] = estadisticas(data);

% ======================= Ejercicio 2: Modelo de regresion =====================

fprintf('\nCreando conjunto de test y de trainig... \n\n');
% Usamos la funcion testTraining para separar los datos en...
%   el conjunto de entrenamiento y test.
[testCmp, trainingCmp] = testTraining(data);

trainingX = trainingCmp(:,1:7);
trainingY = trainingCmp(:,8);

testX = testCmp(:,1:7);
testY = testCmp(:,8);

fprintf('Calculando ecuacion normal... \n\n');

[m,n] = size(trainingX);
[a,b] = size(testX);

testX = [ones(a,1) testX];
trainingX = [ones(m,1) trainingX];

theta = zeros(n+1, 1);

[thetaDes, thetaPeso, thetaAcel, theta] = normalEqn(trainingX,trainingY);

fprintf('Calculando y mostrando errores: \n\n');
% Usando el conjunto de test, calculamos el error...
%   del modelo obtenido por la ecuacion normal.
JDes = computeCost([ones(a,1) testX(:,3)], testY, thetaDes)
JPeso = computeCost([ones(a,1) testX(:,5)], testY, thetaPeso)
JAcel = computeCost([ones(a,1) testX(:,6)], testY, thetaAcel) 
J = computeCost(testX, testY, theta)

% ======================= Ejercicio 3: Visualizacion de Datos ==================

visualizandoDatos(data, thetaDes, thetaPeso, thetaAcel, theta);

% ======================= Ejercicio 4: Descenso del Gradiente ==================

alpha = 0.08;
alphaDes = 0.1;
alphaPeso = 0.1;
alphaAcel = 0.15;

iterations = 250;
iterationsDes = 250;
iterationsPeso = 300;
iterationsAcel = 400;

fprintf("Normalizando los datos...\n\n");
% Normalizamos los datos para facilitar la obtencion del alpha durante...
%   el descenso del gradiente y evitar la convergencia a infinito del error.
trainingX(:,2:end) = normalize(trainingX(:,2:end));
testX(:,2:end) = normalize(testX(:,2:end));
X(:,2:end) = normalize(X(:,2:end));

theta0 = zeros(n+1,1);
thetaDes0 = zeros(2,1);
thetaPeso0 = zeros(2,1);
thetaAcel0 = zeros(2,1); 

fprintf('\nCalculando descenso del gradiente... \n\n');

[theta0, J_history] = gradientDescent(trainingX, trainingY, theta0, alpha, iterations);
[thetaDes0, J_historyDes] = gradientDescent([ones(m,1) trainingX(:,3)], trainingY, thetaDes0, alphaDes, iterationsDes);
[thetaPeso0, J_historyPeso] = gradientDescent([ones(m,1) trainingX(:,5)], trainingY, thetaPeso0, alphaPeso, iterationsPeso);
[thetaAcel0, J_historyAcel] = gradientDescent([ones(m,1) trainingX(:,6)], trainingY, thetaAcel0, alphaAcel, iterationsAcel);

fprintf('Mostrando errores: \n\n');

JDes0 = J_historyDes(end);
JPeso0 = J_historyPeso(end);
JAcel0 = J_historyAcel(end);
J0 = J_history(end);

fprintf("################ || Con Atributo 2 || Con Atributo 4 || Con Atributo 5 || Conjunto Completo ||\n");
fprintf("Error Ec. Normal ||    %.4f     ||    %.4f     ||    %.4f     ||       %.4f      ||\n", JDes, JPeso, JAcel, J);
fprintf(" Error Gradiente ||     %.4f     ||     %.4f     ||    %.4f     ||       %.4f      ||\n", JDes0, JPeso0, JAcel0, J0);
fprintf("      Alpha      ||      %d       ||      %d      ||      %d      ||         %d       ||\n", alphaDes, alphaPeso, alphaAcel, alpha);
fprintf(" Nº Iteraciones  ||      %d       ||      %d       ||      %d       ||         %d       ||\n", iterationsDes, iterationsPeso, iterationsAcel, iterations);


% ======================= Ejercicio 5: Grafica de Convergencia =================

figure;
%Grafica de convergencia del error del descenso del gradiente.
plot(1:numel(J_history), J_history, '-b','LineWidth',2);
xlabel('Number of iterations');
ylabel('Cost J');