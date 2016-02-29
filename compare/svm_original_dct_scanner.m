function answer = svm_original_dct_scanner(n, basesize)
% one base creatoin for multiply N

% Base Creation : Most Time consuming
nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
[pvector, pavg, wpinv, inv_sbase] = PNI_Base(nmfdata, basesize); % Original
argcell = {pvector, pavg, wpinv, inv_sbase};

dct_nmfdata = dct_imagedata(1:20,1:6); % triaing sets: adjustable
[pvector, pavg, inv_sbase] = PI_Base(dct_nmfdata, basesize); % SVM
svm_argcell = {pvector, pavg, inv_sbase};

numofpeople = 40;
numofperspective = 10;
imgsize = [112,92];
answer = [];
    
for iter = n
    % basesize: project size per method, less than 120 


    % read in data
    train_people = zeros(imgsize(1) * imgsize(2), iter * numofpeople);
    train_label = zeros(iter * numofpeople , 1);
    test_people = [];
    test_label = [];

    dct_train_people = zeros(imgsize(1) * imgsize(2), iter * numofpeople);
    dct_train_label = zeros(iter * numofpeople , 1);
    dct_test_people = [];
    dct_test_label = [];

    for i = 1 : numofpeople
        trs = randperm(numofperspective);

        train_people(:, ((i - 1) * iter + 1) : i * iter)  = imagedata2(i, trs(1 : iter));
        train_label(((i - 1) * iter + 1) : i * iter,  1) =  repmat(i, iter, 1);
        test_people = [test_people, imagedata2(i, trs(iter+1 : numofperspective))];
        test_label = [test_label; repmat(i, numofperspective - iter, 1)];

        dct_train_people(:, ((i - 1) * iter + 1) : i * iter)  = dct_imagedata(i, trs(1 : iter));
        dct_train_label(((i - 1) * iter + 1) : i * iter,  1) =  repmat(i, iter, 1);   
        dct_test_people = [dct_test_people, dct_imagedata(i, trs(iter+1 : numofperspective))];
        dct_test_label = [dct_test_label; repmat(i, numofperspective - iter, 1)];

    end

    % shuffle
    perm1 = randperm(size(dct_train_people,2));
    train_people = train_people(:, perm1);
    train_label = train_label(perm1);
    dct_train_people = dct_train_people(:, perm1);
    dct_train_label = dct_train_label(perm1);

    perm2 = randperm(size(dct_test_people,2));
    test_people = test_people(:, perm2);
    test_label = test_label(perm2);
    dct_test_people = dct_test_people(:, perm2);
    dct_test_label = dct_test_label(perm2);


    [ori, ~, ~, ~] = svmcomp(train_people, train_label, test_people, test_label, argcell);
    [dct, ~, ~] = dct_svmcomp(dct_train_people, dct_train_label, dct_test_people, dct_test_label, svm_argcell);

    answer = [answer; 
        ori, dct];
end

