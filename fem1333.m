[m0,m1,l0]=matriz;

ns1  = 10;              % Numero de subdivisiones para correr el programa
d    = 2;                % Grados de libertad por elemento. (cuadráticos o cúbicos 4 o 3 )
nt = (ns1+1);            % Numero de nodos

[globales,x,nel]=gen1(ns1);       %nos devuelvela mtriz de conectividad

A=zeros(nt,nt);
b=zeros(nt,1);
nodos=zeros(1,2);
mk=zeros(d,d);

lk=zeros(d,1);
sol=zeros(nt,1);
solEx=zeros(nt,1);


%Ensamblado

for k=1:nel
	nodos=globales(k,:); 
	h = x(nodos(2))-x(nodos(1));

    xmed=(x(nodos(1))+x(nodos(2)))/2; %sacamos punto medio
    fmed=(xmed)^4-16*(xmed)^3;
    lk=fmed*l0*h/2;
    mk=xmed*m1/h+m0*h;   
    %calculamos la matriz local
	A(nodos,nodos)=A(nodos,nodos)+mk;         %en la parte de nodos sumamos laparte global de la matriz mk
    b(nodos)=b(nodos)+lk;
    pause

end

%ponemos nuestras condiciones de contorno 
b(1)=b(1)-4; 

A(nt,nt)=A(nt,nt)+2;
b(nt)=b(nt)+96;
%Resolvemos sistema
sol=A\b
%Dibujamos la sol
for i=1:nt
   solEx(i)=x(i)^4; % sol del p3  
end
error=max(abs(sol-solEx));		% norma infinito del error en los nodos
format long; display(error)
pause
figure

axis([0,1,0,2])
plot(x,solEx,'-b');
axis(axis)
hold on
plot(x,sol,'ro');
title('Solucion por elementos finitos -0 en rojo, solucion exacta -en azul')
hold off

