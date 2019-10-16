function visualizandoDatos(data, thetaDes, thetaPeso, thetaAcel, theta)
  
  USA = data(find(data(:,7) == 1),:);  
  xUSA = USA(:,1:7);
  yUSA = USA(:,8);
  
  EUR = data(find(data(:,7) == 2),:);
  xEUR = EUR(:,1:7);
  yEUR = EUR(:,8);
  
  JAP = data(find(data(:,7) == 3),:);
  xJAP = JAP(:,1:7);
  yJAP = JAP(:,8);
  
  repDes = thetaDes * data(:,2);
  repPeso = thetaPeso * data(:,4);
  repAcel = thetaAcel * data(:,5);

  
  subplot(2,2,1); 
  hist (data(:,8), '-b');
  xlabel('MPG');

  
  subplot(2,2,2); 
  plot(xUSA(:,2), yUSA, 'rx', xEUR(:,2), yEUR, 'gx', xJAP(:,2), yJAP, 'bx', repDes);
  ylabel('MPG');
  xlabel('Desplazamiento');
  legend("USA","EUR","JAP");
  
  subplot(2,2,3); 
  plot(xUSA(:,4), yUSA, 'rx', xEUR(:,4), yEUR, 'gx', xJAP(:,4), yJAP, 'bx');
  ylabel('MPG');
  xlabel('Peso');
  
  subplot(2,2,4); 
  plot(xUSA(:,5), yUSA, 'rx', xEUR(:,5), yEUR, 'gx', xJAP(:,5), yJAP, 'bx');
  ylabel('MPG');
  xlabel('Aceleracion');
  
  
endfunction
  
