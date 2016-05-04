%% Startup Original
clear
imgsize = [112, 92];
cloc = sift_dim(15);

basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);
svm_sift_train = [];
for ii = 1:size(testdata, 2)
    peo = testdata(:, ii);
    peo = im2single(peo./255);
    peo = reshape(peo, imgsize);

    [~, d] =  vl_sift(peo,'frames', cloc) ;
    svm_sift_train = [svm_sift_train, d(:)]; 
end
label = repmat(1:40,10,1);
label = label(:);
class_data = [svm_sift_train', label];
%% PCA-sift Part
clear
imgsize = [112, 92];
testdata = imagedata2(1:40, 1:10);

svm_sift_train = [];

[~, sift_pca_avg, sift_pca_vector, ~] = sift_pca_base(20);
cloc = sift_dim(15);

for ii = 1:size(testdata, 2)
    peo = testdata(:, ii);
    peo = calibrate_img(peo, imgsize);
    raw_patch = sift_patches(peo, cloc);
    sift_pca_weight = sift_pca_projection(raw_patch, sift_pca_vector, sift_pca_avg);

    svm_sift_train = [svm_sift_train, sift_pca_weight(:)]; 
end
label = repmat(1:40,10,1);
label = label(:);
class_data = [svm_sift_train', label];

%% Results
pcare = [56.2, 34.2, 9.8, 92.8, 88, 89.5, 91.8,91.5, 12.5, 85.2, 51.7,91.8, 70.2, 32.2,81.2, 68.8, 86.2, 69.5, 86.5, 96.0, 94.5, 66.5];
res_img = [63.2, 37.2, 9.5, 84, 89.5, 89.8, 93, 93, 44.2, 95.2, 51, 96.5, 66.8, 9.8, 66, 66.2, 94, 71.5, 90, 95, 97.5, 58.2];

sift_re = [54.2, 31, 8.5, 93.5, 91.8, 94.2, 95.2, 94.5, 8.5, 60.5, 56.5, 95, 70.8, 19.5, 77.2, 69.5, 88.5, 71.8, 92, 97.5, 94.5, 66.2];
sift_pca_re = [43, 27.3, 7.2, 90, 82.5, 90.2, 91.8, 91.5, 9.5, 81.5, 53.2, 89.8, 64, 20, 65.5, 62, 80, 58.2, 78.5, 95.8, 91.5, 52.8];
res = [pcare;res_img;sift_re;sift_pca_re];

figure(1)
hold on
grid on

% pplot = stem(1:22, pcare, 'r', 'LineWidth', 5);
% nplot = stem(1:22, nmfre, 'g', 'LineWidth', 3);
% iplot = stem(1:22, icare, 'b');

bar(res');

title('SIFT Classifiers Performances');
xlabel('Classifiers ID');
ylabel('Accurancy');

ax = gca;
ax.XTick = 1:1:22;

legend('PCA', 'Resized-Image', 'SIFT', 'SIFT-PCA');
sdf(1, 'tk');

export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pni_sift_res','-pdf')

