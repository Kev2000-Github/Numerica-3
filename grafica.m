function grafica (linf, lsup, c, equis, ye, x1)
  
  %INICIALIZACION VARIABLES LOCALES
    X = equis;
    C = c;
    Y = ye;
    p = x1;
    
    %limites de la grafica
    li = linf;
    ls = lsup;
    x = [li:0.1:ls];
  
  %GRAFICAS
  
  %Funcion original
  y = log10(x);
  plot(x,y,'b','linewidth',2, 'color', 'red')
  hold on
  
  %Funcion interpolada
  y1 = polyval(C,x);
  plot(x,y1,'m','linewidth',2)
  hold on
  
  %PUNTOS
  %Punto aproximado p
  yeval = polyval(C,p);
  graficadorPuntos(x1,yeval);
  
  %Punto Real 
  graficadorPuntos(x1,log10(x1));
  
  %Grafica de los puntos aproximados
  y2 = polyval(C,X);

  l = length(X);
  for i=1:l
    plot(X(i),y2(i),"linewidth", 5, "color", "white")
    hold on
  endfor
  
  title('Polinomio Interpolador de Lagrange');
  legend("Logaritmo", "Polinomio");
  grid on
  hold off
  
  %TABLA
  %Encabezados
  enc1 = "  Coeficientes";
  enc2 = "y aproximados";
  printf('%s\t %s\n', enc1, enc2)
  
  %Columnas de Valores
  for i=1:l        
    fprintf('  %f\t %f\n', C(i), y2(i))
  endfor
  
  %CALCULO DE ERROR RELATIVO PORCENTUAL
  
  error = ((log10(p) - yeval)/log10(p))*100;
  fprintf('Valor Aproximado: %f \n' , yeval )
  fprintf('Error Relativo Porcentual: %f%% \n' , error )

  endfunction
