cloc = sift_dim(20);
[~, sift_pca_avg, sift_pca_vector, ~] = sift_pca_base(); %itself used 20 as well
imgsize = [112,92]; 

train_people = imagedata2(1:40, 1:10);
svm_sift_train = [];
for ii = 1:size(train_people, 2)
    peo = train_people(:, ii);
    peo = calibrate_img(peo, imgsize);
    raw_patch = sift_patches(peo, cloc);
    sift_pca_weight = sift_pca_projection(raw_patch, sift_pca_vector, sift_pca_avg);

    svm_sift_train = [svm_sift_train, sift_pca_weight(:)];  % observation per column
end
test = svm_sift_train';
dis_matrix = pdist2(test, test);
 colormap('hot');   % set colormap
 imagesc(dis_matrix);        % draw image and scale colormap to values range
 colorbar;          % show color scale
 grid on
 set(gca,'Xcolor',[0.5 0.5 0.5]);
set(gca,'Ycolor',[0.5 0.5 0.5]);