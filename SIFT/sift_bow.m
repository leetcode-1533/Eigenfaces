function center = sift_bow(numClusters)
    imgs = imagedata2(1:40, 1:3);
    imgsize = [112,92]; 

    dcontainer = [];

    for ii = 1:size(imgs,2) 
        peo = imgs(:, ii);

        peo = im2single(peo./255);
        peo = reshape(peo, imgsize);
        [f, d] = vl_sift(peo);

        for jj = 1:size(d,2)
            dcontainer = [dcontainer, d(:,jj)];
        end
    end

    [center] = vl_kmeans(single(dcontainer), numClusters);
