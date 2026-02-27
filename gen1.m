% Programa para generar mallas 1D.

function [globales,x,nel]=gen1(~)
ns1=3;
nel  = ns1;        % Numero total de elementos.
nt   = (ns1+1);    % Numero total de nodos.



% En el siguiente bucle creamos la matriz de conectividad.                       

for i = 1:ns1
    elem = i;
    globales(elem,1:2)= [i,i+1];
end 

% En el siguiente bucle definimos las coordenadas de los nodos de la malla.
%a=0; %p2
%b=1;
a = 1; %p3
b = 2;
%a=0; %p4
%b=1/2;
h = (b-a)/ns1;

for i = 1:ns1+1
    x(i) = h*(i-1) + a;
    y(i) = 0;
end 

% Dibujamos la malla 

for i=1:nel
    nodos = globales(i,:);
    hold on
    plot(x,y)
    plot(x,y,'o')
    x1 = int2str(i);
    x2 = int2str(nodos(1));
    text(x(nodos(1))+0.3*h,y(nodos(1))+0.1,x1,'Color',[1 0 0]);
    text(x(nodos(1)),y(nodos(1))-0.1,x2,'Color',[0 0 0]);
end 
x2 = int2str(nodos(2));
text(x(nodos(2)),y(nodos(2))-0.1,x2,'Color',[0 0 0]);
pause
hold off
return
    