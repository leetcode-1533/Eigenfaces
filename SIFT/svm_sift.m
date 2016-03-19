clear 

ratiorange = 1:9;

imgsize = [112,92]; 
numofpeople = 40;
numofperspective = 10;

locrange = 2 : 5 :50;

re = [];
for loci = 1 : length(locrange)
    cloc = sift_dim(locrange(loci));
    
    eachlearnrate = [];
    for iter = ratiorange

        train_people = zeros(imgsize(1) * imgsize(2), iter * numofpeople);
        train_label = zeros(iter * numofpeople , 1);
        test_people = [];
        test_label = [];

        for ii = 1 : numofpeople
            trs = randperm(numofperspective);

            train_people(:, ((ii - 1) * iter + 1) : ii * iter)  = imagedata2(ii, trs(1 : iter));
            train_label(((ii - 1) * iter + 1) : ii * iter,  1) =  repmat(ii, iter, 1);
            test_people = [test_people, imagedata2(ii, trs(iter+1 : numofperspective))];
            test_label = [test_label; repmat(ii, numofperspective - iter, 1)];
        end

        % shuffle
        perm1 = randperm(size(train_people,2));
        train_people = train_people(:, perm1);
        train_label = train_label(perm1);

        perm2 = randperm(size(test_people,2));
        test_people = test_people(:, perm2);
        test_label = test_label(perm2);

        svm_sift_train = [];
        for ii = 1:size(train_people, 2)
            peo = train_people(:, ii);
            peo = im2single(peo./255);
            peo = reshape(peo, imgsize);

            [~, d] =  vl_sift(peo,'frames', cloc) ;
            svm_sift_train = [svm_sift_train, d(:)]; 
        end
        [re_train, ps] = mapminmax(double(svm_sift_train));

        model = svmtrain(train_label, re_train');

        svm_sift_test = [];
        for ii = 1:size(test_people, 2)
            peo = test_people(:, ii);
            peo = im2single(peo./255);
            peo = reshape(peo, imgsize);

            [~, d] =  vl_sift(peo,'frames', cloc) ;
            svm_sift_test = [svm_sift_test, d(:)]; 
        end
        re_test = mapminmax.apply(double(svm_sift_test), ps);

        [predicted_labeln, accur, ~] = svmpredict(test_label, re_test', model);
        eachlearnrate = [eachlearnrate, accur(1)];
    end
    re = [re;eachlearnrate];
    
end