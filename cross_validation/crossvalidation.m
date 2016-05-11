function acc = crossvalidation(mapped_data, label, fold)

indices = crossvalind('Kfold', 10, fold);
indices = repmat(indices, 40, 1);
for i = 1:fold
    test = (indices == i); train = ~test;
    
    test_label = label(test);
    train_label = label(train);
    
    test_samples = mapped_data(test, :);
    train_samples = mapped_data(train,:);
    
    acc(i) = svm_crov(train_samples, train_label, test_samples, test_label);
end