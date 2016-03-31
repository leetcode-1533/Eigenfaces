function sift_pca_weight = sift_pca_projection(peo_patch, sift_pca_vector, sift_pca_avg)

    for ii = 1 : size(peo_patch, 2)
        sift_pca_weight(:, ii) = sift_pca_vector'*(peo_patch(:, ii) - sift_pca_avg);
    end