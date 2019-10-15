function [test, trainig] = testTraining(X)
  
  m = length(X);
  P = 0.70;

  idx = randperm(m);
  test =  X(idx(1:round(P*m)),:); 
  trainig = X(idx(round(P*m)+1:end),:);
  
endfunction