function [svmpred, predicted_labelp, predicted_labeln,predicted_labeli]  = svmcomp(train_people, train_label, test_people, test_label, basesize) 
    % NMF, ICA, PCA Base
    % calculate svm prediction using NMF, ICA, PCA

    nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
    [pvector, pavg, wpinv, inv_sbase] = PNI_Base(nmfdata, basesize); % output base adjustable


    [train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, train_people);
    [test_p, test_n, test_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, test_people);

    % Test
    
    train = train_p;
    test = test_p;
    [re_train_p, ps] = mapminmax(train); 
    re_test_p = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train_p');
    [predicted_labelp, accurp, ~] = svmpredict(test_label, re_test_p', model);

    train = train_n;
    test = test_n;
    [re_train_n, ps] = mapminmax(train); 
    re_test_n = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train_n');
    [predicted_labeln, accurn, ~] = svmpredict(test_label, re_test_n', model);
    
    train = train_i;
    test = test_i;  
    [re_train_i, ps] = mapminmax(train); 
    re_test_i = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train_i');
    [predicted_labeli, accuri, ~] = svmpredict(test_label, re_test_i', model);
       
    svmpred = [accurp(1), accurn(1), accuri(1)];

