#Funcion encargada de realizar la interpolacion de Newton
#Recibe como parametro un vector para las x, otro para las y e la x a estimar

function result = InterpolacionNewton(xPoints, yPoints, x)
  #Se verifica que exista la misma cantidad de puntos X como Y
  if(size(xPoints,2) == size(yPoints, 2))
    coefficients = diferenciaDividida(xPoints, yPoints);
    n = size(coefficients, 2);
    #se construye la funcion, primero creandolo como string en base, 
    #al numero de coeficientes obtenidos, y luego
    #transformandolo con inline para volverlo una funcion utilizable
    #Una desventaja de este approach es que los coeficientes son numericos y no fraccion
    #por lo cual es suceptible a errores de redondeo
    funcString = num2str(coefficients(1),"%.7f");
    factorsString = strcat("*(x-(", num2str(xPoints(1),"%.7f") , "))");
    for i = 2:n
      newTerm = strcat("(", num2str(coefficients(i),"%.7f"),factorsString, ")");
      funcString = [funcString, "+", newTerm];
      factorsString = strcat(factorsString, "*(x-(", num2str(xPoints(i),"%.7f") , "))");
    endfor
    #En este punto se transforman las funciones, primero el logaritmo base 10 el cual 
    #es al que se quiere comparar, y luego el polinomio resultante de la interpolacion
    Logarithm = inline("log10(x)");
    Polynomial = inline(funcString);
    estimateValue = Polynomial(x);
    realValue = Logarithm(x);
    #En este punto se grafican las funciones en el intervalo [xMin, xMax]
    #siendo xMin y xMax los puntos menores y mayores de x respectivamente
    #resaltando en la grafica el punto x buscado, tanto real como estimado
    hold on;
    ezplot(Logarithm, [xPoints(1),xPoints(end)]);
    graficador(xPoints(1), xPoints(end), Polynomial, "Comparacion");
    legend("Logaritmo", "Polinomio", "location", "southeast");
    graficadorPuntos(x, estimateValue);
    graficadorPuntos(x, realValue);
    hold off;
    #Se imprime en pantalla la conclusion de los calculos junto con una tabla
    #mostrando los valores computados de los coeficientes y el error relativo porcentual
    fprintf("coeficiente      valor\n");
    for i = 1:n
      key = strcat("b",num2str(i - 1));
      fprintf("     %s          %s\n", key, num2str(coefficients(i)));
    endfor
    errorRelativo = (realValue - estimateValue)/realValue * 100;
    fprintf("valor estimado de f(%d) = %.6f\n", x, estimateValue);
    fprintf("Error relativo porcentual con respecto al valor real: %.2f%%\n",errorRelativo);
  endif
endfunction