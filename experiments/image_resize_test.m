% function img = seamada(image, scale)
imgsize = [112,92]; 

image = imagedata2(1,1);
image = reshape(image, imgsize);

subplot(3,1,1)
scale = 0.75;
seaimage = seamada(image,scale);
biimage = imresize(image,scale);
imshow([biimage,seaimage], []);
axis equal
img_size = size(seaimage);
title(['Image Size: ', num2str(img_size(1)),'x',num2str(img_size(2))])

subplot(3,1,2)
scale = 0.5;
seaimage = seamada(image,scale);
biimage = imresize(image,scale);
imshow([biimage,seaimage], []);
axis equal
img_size = size(seaimage);
title(['Image Size: ', num2str(img_size(1)),'x',num2str(img_size(2))])

subplot(3,1,3)
scale = 0.25;
seaimage = seamada(image,scale);
biimage = imresize(image,scale);
imshow([biimage,seaimage], []);
axis equal
img_size = size(seaimage);
title(['Image Size: ', num2str(img_size(1)),'x',num2str(img_size(2))])

export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/img_resize','-pdf')
