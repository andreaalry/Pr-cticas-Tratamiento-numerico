function calor_explicito
  a=0;
  b=1;
  tfinal=0.1;
  n=20;
  m=320;
  h=(b-a)/(n+1);
  k=(tfinal-0)/(m+1);
  r=k/h^2;
  x=a:h:b;
  unew=sin(pi*x); %condicion inicial y se supone que no vamos a guardar todos solo dos niveles

  for j=1:m+1
    uold=unew;
    t=j*k;



    for i=2:n+1   %dada la solución j-1 se saca la solución en el nivel j
    unew(i)=r*uold(i+1)+r*uold(i-1)+(1-2*r)*uold(i);
  end

  %condiciones de contorno con t=t
unew(1)=0;
unew(n+2)=0;
solex=exp(-pi*pi*t)*sin(pi*x);
error(j)=max(abs(unew-solex));     %error para cada nivel j
plot(x,unew)
text(0.4,0.3,['Tiempo =',num2str(t)],'Fontsize',18)
grid on
axis([0 1 0 1] );
pause(0.5)
end
maxerror=max(error)
display(maxerror)
