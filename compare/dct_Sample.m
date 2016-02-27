% How DCT is used?
% Dct Without Compression
RGB = imread('autumn.tif');
I = rgb2gray(RGB);
J = dct2(I);

K = idct2(J);
figure, imshow(I)
figure, imshow(K,[])
