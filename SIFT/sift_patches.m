function raw_concat = sift_patches(imgs)

% im = imread('/Users/y1275963/Pictures/imgtest.png') ;
% imgs = im2single(rgb2gray(im)) ;

frames = vl_sift(imgs);
num_frames = size(frames, 2);

[~, raw_patches] = vl_covdet(imgs, 'frames', frames, 'descriptor', 'patch', 'PatchResolution', 20); % configurable
w = sqrt(size(raw_patches, 1));
raw_patches = reshape(raw_patches, w, w,[]);

raw_concat = zeros( (w - 2) * (w - 2) * 2, num_frames);

rect = [2, 2, w - 3, w - 3]; % crop box

for index = 1 : num_frames
    [gxtemp, gytemp] = imgradient(raw_patches(:, :, index));
    gxtemp = imcrop(gxtemp, rect);
    gytemp = imcrop(gytemp, rect);
    raw_concat(:, index) = [gxtemp(:); gytemp(:)];
end
    


