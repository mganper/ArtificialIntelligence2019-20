function [thetaDes, thetaPeso, thetaAcel, theta] = normalEqn(X,y)

  X1 = X(:,3);
  X2 = X(:,5);
  X3 = X(:,6);

  thetaDes = ((X1' * X1)^(-1)) * X1' * y;
  
  thetaPeso = ((X2' * X2)^(-1)) * X2' * y;
  
  thetaAcel = ((X3' * X3)^(-1)) * X3' * y;
  
  theta = ((X' * X)^(-1)) * X' * y;
  
endfunction