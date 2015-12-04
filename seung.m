V=double(imread('concordorthophoto.png'));

% function [W,H]=seung(V,r)
s=size(V);
r=200;

W = zeros(s(1),r);
W = imnoise(W,'gaussian');
W = W ./ (ones(s(1),1)*sum(W));

H = zeros(r,s(2));
H = imnoise(H,'gaussian');
for iter=1:400 
    H = H .* (W' * (V ./ (W * H) ));
    W = W .*(( V ./ (W * H)) * H');
    W = W ./ (ones(s(1),1) * sum(W));
end
% OO=W*H;
figure,
subplot(221),imshow(V,[]);
subplot(222),imshow(W*H,[])
subplot(223),imshow(W,[]);
subplot(224),imshow(H,[]);