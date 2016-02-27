function svmpred = dct_svmcomp(train_people, train_label, test_people, test_label, basesize) 
    % ICA, PCA Base
    % doesn't support NMF

    nmfdata = dct_imagedata(1:20,1:6); % triaing sets: adjustable
    [pvector, pavg, inv_sbase] = PI_Base(nmfdata, basesize); % output base adjustable


    [train_p, ~, train_i] = PNI_Projection(pvector, pavg, 0, inv_sbase, train_people);
    [test_p, ~, test_i] = PNI_Projection(pvector, pavg, 0, inv_sbase, test_people);

    % Test
    
    train = train_p;
    test = test_p;
    [re_train_p, ps] = mapminmax(train); 
    re_test_p = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train_p');
    [predicted_label, accurp, ~] = svmpredict(test_label, re_test_p', model);

    
    train = train_i;
    test = test_i;  
    [re_train_i, ps] = mapminmax(train); 
    re_test_i = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train_i');
    [predicted_label, accuri, ~] = svmpredict(test_label, re_test_i', model);
    
    
    svmpred = [accurp(1), accuri(1)];

