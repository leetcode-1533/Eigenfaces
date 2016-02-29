function [svmpred, predicted_labelp, predicted_labeli] = dct_svmcomp(train_people, train_label, test_people, test_label, argcell) 
    % ICA, PCA Base
    % doesn't support NMF
 
    pvector = argcell{1};
    pavg = argcell{2};
    inv_sbase = argcell{3};



    [train_p, ~, train_i] = PNI_Projection(pvector, pavg, 0, inv_sbase, train_people);
    [test_p, ~, test_i] = PNI_Projection(pvector, pavg, 0, inv_sbase, test_people);

    % Test
    
    train = train_p;
    test = test_p;
    [re_train_p, ps] = mapminmax(train); 
    re_test_p = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train_p');
    [predicted_labelp, accurp, ~] = svmpredict(test_label, re_test_p', model);

    
    train = train_i;
    test = test_i;  
    [re_train_i, ps] = mapminmax(train); 
    re_test_i = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train_i');
    [predicted_labeli, accuri, ~] = svmpredict(test_label, re_test_i', model);
    
    
    svmpred = [accurp(1), accuri(1)];

