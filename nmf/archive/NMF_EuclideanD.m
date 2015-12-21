function [W,H]=NMF_EuclideanD(V,r)
% D ???? n???* m???  r ??????
%  D=W*H   W ?????  H ????????
sizeD=size(V);   %??V????
n=sizeD(1);
m=sizeD(2);

W=abs(rand(n,r));   %????????W?H
H=abs(rand(r,m));

for iterate=1:500
    WD=W'*V;
     WWH=W'*W*H;
     H = H.*WD./WWH; %??H
%     for a = 1:r
%         for u=1:m
%             H(a,u)=H(a,u)*WD(a,u)/WWH(a,u);
%         end
%     end
    DH=V*H';
    WHH=W*H*H';
    W = W.*DH./WHH;  %??W
%     for i = 1:n
%         for a=1:r
%             W(i,a)=W(i,a)*DH(i,a)/WHH(i,a);
%         end
%     end

end
d=W*H;

