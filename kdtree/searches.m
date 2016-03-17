clear 
load '~/Dropbox/lfw2.mat'

target = '/Users/y1275963/Pictures/images-1.jpg';

vrange = 1:29;

nimgdata = imgdata(vrange, :);
[re, msetting] = mapminmax(nimgdata);
elm_num = size(re, 2);

matweights  = repmat(weights(vrange, :), 1, elm_num);
re = re .* matweights;

mdl = KDTreeSearcher(re');
mdl.Distance = 'euclidean';

% search
me = imread(target);
FDetect = vision.CascadeObjectDetector;
BB = step(FDetect, me);
i2 = imcrop(me, BB);
i2 = rgb2gray(i2);
i2 = imresize(i2, imgsize);
i2 = double(i2);
i2w = PNI_Projection(pvector, pavg, 0, 0, i2(:));
mapi2w = mapminmax('apply', i2w(vrange), msetting);
w_mapi2w = mapi2w .* weights(vrange, :);

[res, Distance] = knnsearch(mdl, w_mapi2w');
Distance
% show
% for idx = res{1}
    [x, ~] = find(retable == res);
    k = 2 + x;
    similar = imread(fullfile('/Users/y1275963/Desktop/imgs', file(k).name));
    
    pause
    subplot(1, 2, 1)
    imshow(me, []);
    title(target);
    subplot(1, 2, 2)
    imshow(similar, []);
    title(file(k).name);
% end