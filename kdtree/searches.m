target = '/Users/y1275963/Pictures/Pedro_Almodovar.jpg';

vrange = 1:29;

nimgdata = imgdata(vrange, :);
% [pw, ~, ~] = PNI_Projection(pvector, pavg, 0, 0, imgdata');
mdl = KDTreeSearcher(nimgdata');
mdl.Distance = 'chebychev';

% search
me = imread(target);
FDetect = vision.CascadeObjectDetector;
BB = step(FDetect, me);
i2 = imcrop(me, BB);
i2 = rgb2gray(i2);
i2 = imresize(i2, imgsize);
i2 = double(i2);
i2w = PNI_Projection(pvector, pavg, 0, 0, i2(:));

% idx = knnsearch(mdl, i2w(vrange)');
 res = rangesearch(mdl, i2w(vrange)', 4000);
 for idx = res{1}
    [x, ~] = find(retable == idx);
    k = 2 + x;
    similar = imread(fullfile('/Users/y1275963/Desktop/imgs', file(k).name));
    
    pause
    subplot(1, 2, 1)
    imshow(me, []);
    title(target);
    subplot(1, 2, 2)
    imshow(similar, []);
    title(file(k).name);
end