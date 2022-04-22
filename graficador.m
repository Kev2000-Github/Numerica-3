#funcion para crear la grafica inicial por la cual se van a mostrar
#los puntos en donde caen las aproximaciones

function graficador(puntoMenor = 0, puntoMayor = 0, funcion, titulo = "Titulo")
  if(puntoMenor != puntoMayor)
    h = ezplot(funcion, [puntoMenor puntoMayor]);
  else
    ezplot(funcion);
  endif
  grid on;
  title(titulo);
  set(gca,'FontSize', 15);
endfunction
