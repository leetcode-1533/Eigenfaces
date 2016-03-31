im = imread('/Users/y1275963/Pictures/imgtest.png') ;
imgs = im2single(rgb2gray(im)) ;
frames = sift_dim(10);

imshow(imgs);
vl_plotframe(frames);

figure()
[frames, descrs] = vl_covdet(imgs, 'frames', frames, 'descriptor', 'patch', 'PatchResolution', 20);
w = sqrt(size(descrs,1)) ;
patches = reshape(descrs(:, 1:10), w, w,[]);
vl_imarraysc(patches);
colormap('gray');

figure()
[gx, gy] = imgradient(patches(:, :, 1), 'central');
imshowpair(gx, gy, 'montage');