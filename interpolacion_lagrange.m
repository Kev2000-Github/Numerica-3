function [C,L] = interpolacion_lagrange (X,Y)
  
  %Inicalizacion de Variables
  w = length(X);
  n = w - 1;
  L = zeros(w,w);

 %Ciclo que genera los terminos del polinomio:
 %(antes de multiplicar por f(xi))
  for k=1:n+1
    V=1;
    
    %Ciclo que calcula los Li(xi)
    for r=1:n+1
      if k~=r
        V=conv(V,poly(X(r)))/(X(k)-X(r)); 
      endif
    endfor
    L(k,:) = V;
  endfor
  
  %CALCULO DE LOS COEFICIENTES DEL POLINOMIO INTERPOLADOR
  C = Y*L;
  
