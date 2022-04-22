#funcion de utilidad para graficar un punto en la grafica, indicando la iteracion actual
#si last == 0, quiere decir que no es la ultima iteracion y por lo tanto debe eliminar 
#las lineas guia
#ERP se refiere al error relativo

function graficadorPuntos(xPoint, yPoint)
        plot(xPoint,yPoint,"ro-","MarkerSize",10);
        verticalGuide = plot([xPoint,xPoint],ylim,"--","color","k");
        horizontalGuide = plot(xlim,[yPoint,yPoint],"--","color","k");
endfunction
