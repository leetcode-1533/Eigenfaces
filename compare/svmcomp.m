function svmpred = svmcomp() 
%     t = 5;
    n = 8;
    numofpeople = 40;
    numofperspective = 10;
    imgsize = [112,92]; 

    % read in data

    train_people = zeros(imgsize(1) * imgsize(2), n * numofpeople);
    train_label = zeros(n * numofpeople , 1);
    test_people = [];
    test_label = [];

    for i = 1 : numofpeople
        trs = randperm(numofperspective);
        train_people(:, ((i - 1) * n + 1) : i * n)  = imagedata2(i, trs(1 : n));
        train_label(((i - 1) * n + 1) : i * n,  1) =  repmat(i, n, 1);

        test_people = [test_people, imagedata2(i, trs(n+1 : numofperspective))];
        test_label = [test_label; repmat(i, numofperspective - n, 1)];
    end

    % shuffle
    perm1 = randperm(size(train_people,2));
    train_people = train_people(:, perm1);
    train_label = train_label(perm1);

    perm2 = randperm(size(test_people,2));
    test_people = test_people(:, perm2);
    test_label = test_label(perm2);

    % NMF, ICA, PCA Base

    nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
    [pvector, pavg, wpinv, inv_sbase] = PNI_Base(nmfdata, 30);


    [train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, train_people);
    [test_p, test_n, test_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, test_people);

    train = train_i;
    test = test_i;
    [re_train, ps] = mapminmax(train); 
    re_test = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train');
    [predicted_label, accurp, ~] = svmpredict(test_label, re_test', model);

    train = train_i;
    test = test_i;
    [re_train, ps] = mapminmax(train); 
    re_test = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train');
    [predicted_label, accurn, ~] = svmpredict(test_label, re_test', model);

    train = train_i;
    test = test_i;
    [re_train, ps] = mapminmax(train); 
    re_test = mapminmax.apply(test,ps);
    model = svmtrain(train_label, re_train');
    [predicted_label, accuri, ~] = svmpredict(test_label, re_test', model);
    svmpred = [accurp(1), accurn(1), accuri(1)];


