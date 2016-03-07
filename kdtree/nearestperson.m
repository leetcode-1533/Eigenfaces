clear;
imgsize = [112,92];

pcadata = imagedata2(1:40, 1:10);

[~, pavg, pvector, ~] = opca(30, pcadata);
[pw, ~, ~] = PNI_Projection(pvector, pavg, 0, 0, pcadata);

mdl = KDTreeSearcher(pw');


me = imread('/Users/y1275963/Downloads/lfw/Ann_Godbehere/Ann_Godbehere_0001.jpg');
FDetect = vision.CascadeObjectDetector;
BB = step(FDetect, me);
i2 = imcrop(me, BB);
i2 = rgb2gray(i2);
i2 = imresize(i2, imgsize);
i2 = double(i2);
i2w = PNI_Projection(pvector, pavg, 0, 0, i2(:));

idx = knnsearch(mdl, i2w');

temp = [i2(:), pcadata(:, idx)];
peekbase(temp, imgsize, 1, 2)