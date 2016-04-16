%% Cross Valid base generator
clear

basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);

[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);
[pca_set, nmf_set, ica_set] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, testdata);

mapped_pca = mapminmax(pca_set);
mapped_pca = mapped_pca';

label = repmat(1:40,10,1);
label = label(:);

%% Cross Validation
clear acc

fold = 1;
indices = crossvalind('Kfold', 10, fold);
indices = repmat(indices, 40, 1);
for i = 1:fold
    test = (indices == i); train = ~test;
    
    test_label = label(test);
    train_label = label(train);
    
    test_samples = mapped_pca(test, :);
    train_samples = mapped_pca(train,:);
    
    acc(i) = svm_crov(train_samples, train_label, test_samples, test_label);
end