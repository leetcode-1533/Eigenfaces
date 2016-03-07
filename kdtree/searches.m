% search
me = imread('/Users/y1275963/Desktop/imgs/Aaron_Peirsol_0003.jpg');
FDetect = vision.CascadeObjectDetector;
BB = step(FDetect, me);
i2 = imcrop(me, BB);
i2 = rgb2gray(i2);
i2 = imresize(i2, imgsize);
i2 = double(i2);
i2w = PNI_Projection(pvector, pavg, 0, 0, i2(:));
% idx = knnsearch(mdl, i2w');

res = rangesearch(mdl, i2w', 4000);
for idx = res{1}
    [x, ~] = find(retable == idx);
    k = 2 + x;
    similar = imread(fullfile('/Users/y1275963/Desktop/imgs', file(k).name));
    
    pause
    subplot(1, 2, 1)
    imshow(me, []);
    subplot(1, 2, 2)
    imshow(similar, []);
end