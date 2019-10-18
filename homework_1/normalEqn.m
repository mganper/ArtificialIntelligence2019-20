function [thetaDes, thetaPeso, thetaAcel, theta] = normalEqn(X,y)
  
  X1 = X(:,3);
  X1 = [ones(size(y),1) X1]; 
  
  X2 = X(:,5);
  X2 = [ones(size(y),1) X2];
  
  X3 = X(:,6);
  X3 = [ones(size(y),1) X3];
  
  thetaDes = inv(X1' * X1) * X1' * y;
  
  thetaPeso = inv(X2' * X2) * X2' * y;
  
  thetaAcel = inv(X3' * X3) * X3' * y;
  
  theta = inv(X' * X) * X' * y;
  
endfunction