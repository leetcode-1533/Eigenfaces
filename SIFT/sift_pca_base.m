function [perc, avg, pvector, D] = sift_pca_base(basesize)
    imgs = imagedata2(1:40, 1:10);
    imgsize = [112,92]; 

    patches = [];
    frame = sift_dim(20,imgsize);
    for ii = 1:100 % first 100 samples
        peo = imgs(:, ii);

        peo = calibrate_img(peo, imgsize);

        peo_patch = sift_patches(peo, frame);
        patches = [patches, peo_patch]; 
    end

    [perc, avg, pvector, D] = opca(basesize, patches);


