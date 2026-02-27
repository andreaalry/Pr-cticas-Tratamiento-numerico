  f = double(imread('cameraman.png'))/255;  %imagen 
  f = rgb2gray(f);
  u = f + randn(size(f))*16/255;   %imagen + ruido
  subplot(1,2,1); imshow(f); title Original
  subplot(1,2,2); imshow(u); title Ruido

  uorigin=u;
  [n n]=size(u);
  size(u);

  r= 0.10; %si es muy alto desaparece la imagen
 for k= 1:3
   uold = u;
   for j = 2:n-1
     for i=2:n-1 %nodos interiores
       unew(i,j)=uold(i,j) + r*(uold(i+1,j)+uold(i-1,j)+uold(i,j+1)+uold(i,j-1)-4*uold(i,j));
     end
   end
  for j = 2:n-1 %dcho
    unew(n,j)=uold(n,j) + r*(2*uold(n-1,j)+uold(n,j+1)+uold(n,j-1)-4*uold(n,j));
  end
   for j = 2:n-1 %izq
    unew(1,j)=uold(1,j) + r*(2*uold(2,j)+uold(1,j+1)+uold(1,j-1)-4*uold(1,j));
   end
  for i = 2:n-1 %sup
    unew(i,n)=uold(i,n) + r*(uold(i+1,n)+uold(i-1,n)+2*uold(i,n-1)-4*uold(i,n));
  end
  for i = 2:n-1  %inf
    unew(i,1)=uold(i,1) + r*(uold(i+1,1)+uold(i-1,1)+2*uold(i,2)-4*uold(i,1));
  end

  %esq
  unew(1,1) = uold(1,1) + r*(2*uold(2,1)+ 2*uold(1,2)-4*uold(1,1));
  unew(1,n) = uold(1,n) + r*(2*uold(2,n)+ 2*uold(1,n-1)-4*uold(1,n));
  unew(n,1) = uold(n,1) + r*(2*uold(n-1,1)+ 2*uold(n,2)-4*uold(n,1));
  unew(n,n) = uold(n,n) + r*(2*uold(n-1,n)+ 2*uold(n,n-1)-4*uold(n,n));

  u=unew;
 end


  figure(2)
  subplot(1,2,1); imshow(uorigin); title Ruido
  subplot(1,2,2); imshow(u); title Denoising
  figure(3)
  subplot(1,2,1); imshow(f); title Original
  subplot(1,2,2); imshow(u); title Denoising


