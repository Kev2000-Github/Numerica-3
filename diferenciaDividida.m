function val = diferenciaDividida(xPoints, yPoints)
  n = size(xPoints, 2);
  y = yPoints;
  for i=2:n
    for j=1:i-1
      y(i) =(y(j) - y(i))/(xPoints(j) - xPoints(i));
    endfor
  endfor
  val = y;
endfunction