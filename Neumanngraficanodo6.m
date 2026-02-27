

[m0,mxx,myy,mxy,l0]=matriz2;
ns1  = 3;                       % Subdivisiones en la direccion x e y para gráfica de varphi6
ns2  = 3;                                        
d    = 3;                       % Grados de libertad por elemento,  como vamos a hacer p1 solo es tres 
nt = (ns1+1)*(ns2+1);      

[globales,x,y,nel]=gen2(ns1,ns2); 

coord=zeros(nt,2);
a=zeros(nt,nt);
b=zeros(nt,1);
nodos=zeros(1,3);
c=zeros(2,2);
mk=zeros(d,d);
lk=zeros(d,1);
sol=zeros(nt,1);
exac=zeros(nt,1);
coord = [x;y]';

%Ensamblado                                            

for k=1:nel 
	nodos=globales(k,:);    
	[c,deter]=InvDet(coord(nodos,:));
	mk=deter*(m0+c(1,1)*mxx+c(1,2)*(mxy+mxy')+c(2,2)*myy);
	a(nodos,nodos)=a(nodos,nodos)+mk;  %sumamos mk donde toca
	lk=pf(coord(nodos,:))*deter*l0;
    b(nodos)=b(nodos)+lk;
end
%Resolvemos sistema

sol=a\b;

%PARA HACER LA GRÁFICA DE VARPHI6
sol(6,:)=1;
sol(1:5,:)=0;
sol(7:nt,:)=0;

for j = 1:nt
    exac(j,1) = (x(j)^2-16)^2*(y(j)^2-16)^2; %solucion exacta del problema
end

max(abs(sol-exac))

%Dibujamos la solucion

trisurf(globales,x,y,sol,'facecolor','interp')

