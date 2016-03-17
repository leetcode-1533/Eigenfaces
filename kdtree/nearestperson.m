clear;
imgsize = [112,92];

pcadata = imagedata2(1:40, 1:10);

[~, pavg, pvector, ~, weights] = opca_eig(30, pcadata);



file = dir('/Users/y1275963/Desktop/imgs');
NF = length(file);
imgdata = [];

retable = zeros(NF, 10); % Assume have 10 people, which is impossible
% images = cell(NF,1);
for k = 4 : NF  
    if rem(k, 1000) == 0
        k
    end
    me = imread(fullfile('/Users/y1275963/Desktop/imgs', file(k).name));
    FDetect = vision.CascadeObjectDetector;
    BB = step(FDetect, me);
    for item = 1 : size(BB, 1) 

        
        i2 = imcrop(me, BB(item, :));
        i2 = rgb2gray(i2);
        i2 = imresize(i2, imgsize);
        i2 = double(i2);
        i2w = PNI_Projection(pvector, pavg, 0, 0, i2(:));
        imgdata = [imgdata, i2w]; 
        retable(k - 2, item) = size(imgdata, 2);
    end
%     imshow(imread(fullfile('/Users/y1275963/Desktop/imgs', file(k).name)));
%   images{k} = imread(fullfile('image.orig', file(k).name));
end






% if ~ifempty(k)
%     subplot(1, 2, 1)
%     imshow(me, []);
%     subplot(1, 2, 2)
%     imshow(similar, []);
% end
