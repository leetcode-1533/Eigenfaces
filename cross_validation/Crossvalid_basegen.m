%% Cross Valid base generator
function acc_con = Crossvalid_basegen(imgratio)
% imgratio = 0.4;

ori_imgsize = [112,92]; 
sam_image = imagedata2(1,1);
sam_image = reshape(sam_image, ori_imgsize);
imgsize = size(imresize(sam_image,imgratio));


basedata = imagedata2_resol(1:40, 1:3, imgsize);  
testdata = imagedata2_resol(1:40, 1:10, imgsize);

label = repmat(1:40,10,1);
label = label(:);
%% PCA & ICA
% [pvector, pavg, inv_sbase] = PI_Base(basedata, 64);
% [pca_set, ~, ica_set] = PNI_Projection(pvector, pavg, 0, inv_sbase, testdata);
% 
% mapped_pca = mapminmax(pca_set);
% mapped_pca = mapped_pca';

%% SIFT
% cloc = sift_dim_resol(20,basedata, imgsize);
% sift_encoded = sift_proj(testdata, cloc, imgsize);
% 
% sift_encoded = mapminmax(double(sift_encoded));
% sift_encoded = sift_encoded';
%% SIFT NKNN
sift_nknn = sift_nknn_proj(testdata, imgsize);
%% SVM Demo
acc_con = [];
for fold = 2:9
    acc = crossvalidation_nknn(sift_nknn, label, fold);
    acc = mean(acc');
    acc_con = [acc_con, acc];
end

%% Plot
% figure(1)
% hold on;
% plot(2:9, acc_con,'b-');
% plot(2:9, acc_con,'rx');
% 
% title('Cross Validation Fold Size');
% xlabel('Fold Size');
% ylabel('Accurancy');
% sdf(1, 'tk');
% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/svm_fold','-pdf')
