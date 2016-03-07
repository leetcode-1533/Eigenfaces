clear;
imgsize = [112,92]; 

im1 = imread('cameraman.tif');
im1 = imresize(im1, imgsize);
im2 = imread('moon.tif');
im2 = imresize(im2, imgsize);
im3 = imread('AT3_1m4_06.tif');
im3 = imresize(im3, imgsize);

imgs = [double(im1(:)), double(im2(:)), double(im3(:))];
tm = randn(3, 5);

inp = imgs * tm;

sbase = fastica(inp', 'numOfIC', 4, 'displayMode', 'off', 'verbose', 'off');  

peekbase(inp, imgsize, 1, 3)
peekbase(sbase', imgsize, 1, 3)