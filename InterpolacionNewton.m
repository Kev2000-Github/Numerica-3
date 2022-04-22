function result = InterpolacionNewton(xPoints, yPoints, x)
  coefficients = diferenciaDividida(xPoints, yPoints);
  n = size(coefficients, 2);
  #construct function
  funcString = num2str(coefficients(1),"%.7f");
  factorsString = strcat("*(x-(", num2str(xPoints(1),"%.7f") , "))");
  for i = 2:n
    newTerm = strcat("(", num2str(coefficients(i),"%.7f"),factorsString, ")");
    funcString = [funcString, "+", newTerm];
    factorsString = strcat(factorsString, "*(x-(", num2str(xPoints(i),"%.7f") , "))");
  endfor
  Logarithm = inline("log(x)");
  Polynomial = inline(funcString);
  estimateValue = Polynomial(x);
  realValue = Logarithm(x);
  #graph
  hold on;
  ezplot(Logarithm);
  graficador(xPoints(1), xPoints(end), Polynomial, "Comparacion");
  legend("Logaritmo", "Polinomio", "location", "southeast");
  graficadorPuntos(x, estimateValue);
  graficadorPuntos(x, realValue);
  hold off;
  #conclusion
  fprintf("coeficiente      valor\n");
  for i = 1:n
    key = strcat("b",num2str(i - 1));
    fprintf("     %s          %s\n", key, num2str(coefficients(i)));
  endfor
  errorRelativo = (realValue - estimateValue)/realValue * 100;
  fprintf("valor estimado de f(%d) = %.6f\n", x, estimateValue);
  fprintf("Error relativo porcentual con respecto al valor real: %.2f%%\n",errorRelativo);
endfunction