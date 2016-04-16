%% Cross Valid base generator
clear

basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);

[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);
[train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, testdata);

label = repmat(1:40,10,1);
label = label(:);
%% Cross Validation 

vals = crossval(@svm_crov,train_n', label, 'kfold', 8);

%% Cross Validation
% train_p = train_p';
% 
% indices = crossvalind('Kfold',numel(label), 10);
% for i = 1:10
%     test = (indices == i); train = ~test;
%     
%     test_label = label(test);
%     train_label = label(train);
%     
%     test_samples = train_p(test, :);
%     train_samples = train_p(train,:);
%     
%     svm_crov(train_samples, train_label, test_samples, test_label);
% end