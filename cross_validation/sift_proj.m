function [re_train, ps] = sift_proj(train_people, cloc, imgsize)

svm_sift_train = [];
for ii = 1:size(train_people, 2)
    peo = train_people(:, ii);
    peo = im2single(peo./255);
    peo = reshape(peo, imgsize);

    [~, d] =  vl_sift(peo,'frames', cloc) ;
    svm_sift_train = [svm_sift_train, d(:)]; 
end
[re_train, ps] = mapminmax(double(svm_sift_train));