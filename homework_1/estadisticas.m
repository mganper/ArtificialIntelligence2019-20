function [xMean, xSTD, xMin, xMax] = estadisticas(data)
  xMean = mean(data);
  xSTD = std(data);
  xMin = min(data);
  xMax = max(data);
  
  fprintf("#######|| Cilindros || Desplazamiento || Potencia ||   Peso    || Aceleracion ||   Año   ||  Pais  ||   MPG   ||\n");
  fprintf(" Media ||  %.4f   ||    %.4f    || %.4f || %.4f ||   %.4f   || %.4f || %.4f || %.4f ||\n",...
  xMean(1), xMean(2), xMean(3), xMean(4), xMean(5), xMean(6), xMean(7), xMean(8));
  fprintf(" Std.  ||  %.4f   ||    %.4f    || %.4f  || %.4f  ||   %.4f    || %.4f  || %.4f || %.4f  ||\n",...
  xSTD(1), xSTD(2), xSTD(3), xSTD(4), xSTD(5), xSTD(6), xSTD(7), xSTD(8));
  fprintf(" Min.  ||     %d     ||       %d       ||    %d    ||    %d   ||      %d      ||    %d   ||    %d   ||    %d    ||\n",...
  xMin(1), xMin(2), xMin(3), xMin(4), xMin(5), xMin(6), xMin(7), xMin(8));
  fprintf(" Max.  ||     %d     ||       %d      ||    %d   ||    %d   ||     %d    ||    %d   ||    %d   ||   %d  ||\n",...
  xMax(1), xMax(2), xMax(3), xMax(4), xMax(5), xMax(6), xMax(7), xMax(8));
 endfunction