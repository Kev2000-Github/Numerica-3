
%Configuracion Inicial
clc
clear

%Vectores de X e Y
X=[8 9 11 12];
Y = [0.9030900 0.9542425 1.0413927 1.0791812];

%Ejecucion de la Interpolacion de Lagrange
format rat
[C, L] = interpolacion_lagrange(X,Y);

%GRAFICAS
%Guia: 
%grafica (limiteinferior, limitesuperior, C, X, Y, punto a evaluar para aproximar);
grafica (8, 12, C, X , Y, 10);




