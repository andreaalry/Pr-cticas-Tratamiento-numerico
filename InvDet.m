function [c,deter]=InvDet(v)
%Calcula c=B_k^{-1}(B_k^{-1})^T y deter=abs(detB_k)         
% v es matriz 3x2 que corresponde a las cordenadas de los tres vertices del elemento k 
bk=[v(2,1)-v(1,1) v(3,1)-v(1,1);
    v(2,2)-v(1,2) v(3,2)-v(1,2)];

invb=inv(bk);
invtr=(invb)';
c=invb*(invtr);
deter=abs(det(bk));

return
