

[m0,mxx,myy,mxy,l0]=matriz2;
ns1  = 16;                      % Subdivisiones en la direccion x
ns2  = 16;         
                                % Subdivisiones en la direccion y.
d    = 3;   % Grados de libertad por elemento,  como vamos a hacer p1 solo es tres 

%nt = (ns1+1)*(ns2+1);           % Numero total de vertices. %nel es el numero de triangulos 
%[globales,x,y,nel]=gen2(ns1,ns2); 

% ponemos la malla hecha con el dominio poligonal                                     
%globales=readmatrix("elementost.txt");                                         
%coordenada=readmatrix("coordenadasp.txt");  
%mallado refinado
globales=readmatrix("elementosfinos.txt")
coordenada=readmatrix("coordenada.txt");  


[n1,n2]=size(globales)
nel=n1;

[n,m]=size(coordenada)
nt=n;

x=coordenada(:,1); %1º col
y=coordenada(:,2); %2ºcol




coord=zeros(nt,2);
a=zeros(nt,nt);
b=zeros(nt,1);
nodos=zeros(1,3);
c=zeros(2,2);
mk=zeros(d,d);
lk=zeros(d,1);
sol=zeros(nt,1);
exac=zeros(nt,1);
coord = [x,y];

%Ensamblado                                            

for k=1:nel        %recorrermos cada uno triangulos y calculamos para cada uno la mk y el vector local/nodos devuelve los tres vertices del elemento k 
	nodos=globales(k,:);          
	[c,deter]=InvDet(coord(nodos,:));
	mk=deter*(m0+c(1,1)*mxx+c(1,2)*(mxy+mxy')+c(2,2)*myy);
	a(nodos,nodos)=a(nodos,nodos)+mk;        %sumamos mk donde toca
	lk=pf(coord(nodos,:))*deter*l0;
    b(nodos)=b(nodos)+lk;
end
%Resolvemos sistema
sol=a\b;
for j = 1:nt
    exac(j,1) = (x(j)^2-16)^2*(y(j)^2-16)^2; %solucion exacta del problema
end

max(abs(sol-exac))

%Dibujamos la solucion

trisurf(globales,x,y,sol,'facecolor','interp')

