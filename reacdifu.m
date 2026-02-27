

function reacdifu
a=0;
b=1;
tfinal=0.1;
n=10;
m=60;
h=(b-a)/(n+1);
k=(tfinal-0)/(m+1);
r=k/h^2;
x=a:h:b;

%cambiamos la condición inicial de t0
unew=(x>=0 & x<=0.5)*1 + (x>0.5)*0;

%sacamos cada nivel j
for j=1:m+1
  uold=unew;
  t=j*k;
    %dada solución nivel j-1 se saca la del nivel j
  for i=2:n+1
    unew(i)=r*uold(i+1)+r*uold(i-1)+(1-2*r-3*k)*uold(i);
  end

  %cond contorno nulas
unew(1)=0;
unew(n+2)=0;

% solex=exp(-pi*pi*t)*sin(pi*x); %solución real del problema
%error(j)=max(abs(unew-solex));


  plot(x,unew);
  text(0.4, 0.3,['Tiempo = ',num2str(t)], 'FontSize', 18)
  grid on
  axis([0 1 0 1]);
  pause(0.5)
end

%maxerror=max(error)
%display(maxerror)

