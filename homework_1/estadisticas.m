function [xMean, xSTD, xMin, xMax] = estadisticas(data)
  fprintf("Medias: \n");
  xMean = mean(data)
  fprintf("Deviaciones típicas: \n");
  xSTD = std(data)
  fprintf("Mínimos: \n");
  xMin = min(data)
  fprintf("Máximos: \n");
  xMax = max(data)
 endfunction