im = imread('/Users/y1275963/Pictures/imgtest.png') ;
imgs = im2single(rgb2gray(im)) ;
frames = sift_dim(10);

imshow(imgs);
vl_plotframe(frames);

figure()
[frames, descrs] = vl_covdet(imgs, 'frames', frames, 'descriptor', 'patch', 'PatchResolution', 40);
w = sqrt(size(descrs,1)) ;
vl_imarraysc(reshape(descrs(:, 1:10), w, w,[]));
colormap('gray');


