function [xMean, xSTD, xMin, xMax] = estadisticas(data)
  fprintf("Medias: \n");
  xMean = mean(data)
  fprintf("Deviaciones t�picas: \n");
  xSTD = std(data)
  fprintf("M�nimos: \n");
  xMin = min(data)
  fprintf("M�ximos: \n");
  xMax = max(data)
 endfunction