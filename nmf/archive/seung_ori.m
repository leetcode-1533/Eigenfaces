V=double(imread('cameraman.tif'));

% function [W,H]=seung(V,r)
s=size(V);
r=128;
W=10*rand(s(1),r);
W = W ./ (ones(s(1),1)*sum(W));
H=10*rand(r,s(2));
for iter=1:400   
    H = H .* (W' * (V ./ (W * H) ));
    W = W .*(( V ./ (W * H)) * H');
    W = W ./ (ones(s(1),1) * sum(W));
end
% OO=W*H;
figure,
subplot(121),imshow(V,[]);
subplot(122),imshow(W*H,[])