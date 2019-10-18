function visualizandoDatos(data, thetaDes, thetaPeso, thetaAcel, theta)
  
  % Separamos el dataset segun el pais
  
  USA = data(find(data(:,7) == 1),:);  
  xUSA = USA(:,1:7);
  yUSA = USA(:,8);
  
  EUR = data(find(data(:,7) == 2),:);
  xEUR = EUR(:,1:7);
  yEUR = EUR(:,8);
  
  JAP = data(find(data(:,7) == 3),:);
  xJAP = JAP(:,1:7);
  yJAP = JAP(:,8);
    
  [m,n] = size(data(:,1:7));
  X = [ones(m, 1) data(:,1:7)];

  % Histograma MPG
  subplot(2,2,1); 
  hist (data(:,8), '-b');
  xlabel('MPG');
  
  % Grafica Desplazamiento/MPG
  subplot(2,2,2); 
  plot(xUSA(:,2), yUSA, 'rx', xEUR(:,2), yEUR, 'gx', xJAP(:,2), yJAP, 'bx');
  hold on;
  plot(X(:,3), [ones(size(data),1) data(:,2)] * thetaDes, "b-"); % Linea de regresion
  ylabel('MPG');
  xlabel('Desplazamiento');
  legend("USA","EUR","JAP");
  hold off;
  
  % Grafica Peso/MPG
  subplot(2,2,3); 
  plot(xUSA(:,4), yUSA, 'rx', xEUR(:,4), yEUR, 'gx', xJAP(:,4), yJAP, 'bx');
  hold on;
  plot(X(:,5), [ones(size(data),1) data(:,4)] * thetaPeso, "b-"); % Linea de regresion
  ylabel('MPG');
  xlabel('Peso');
  
  % Grafica Aceleracion/MPG
  subplot(2,2,4); 
  plot(xUSA(:,5), yUSA, 'rx', xEUR(:,5), yEUR, 'gx', xJAP(:,5), yJAP, 'bx');
  hold on;
  plot(X(:,6), [ones(size(data),1) data(:,5)] * thetaAcel, "b-"); % Linea de regresion
  ylabel('MPG');
  xlabel('Aceleracion');
  
  
endfunction
  
