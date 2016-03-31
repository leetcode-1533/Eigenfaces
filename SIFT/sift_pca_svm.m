clear 

ratiorange = 8:8;

imgsize = [112,92]; 
numofpeople = 40;
numofperspective = 10;

locrange = 3:3;

re = [];
    cloc = sift_dim(20);
    [~, sift_pca_avg, sift_pca_vector, ~] = sift_pca_base();
    
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
            peo = calibrate_img(peo, imgsize);
            raw_patch = sift_patches(peo, cloc);
            sift_pca_weight = sift_pca_projection(raw_patch, sift_pca_vector, sift_pca_avg);
            
            svm_sift_train = [svm_sift_train, sift_pca_weight(:)]; 
        end
        [re_train, ps] = mapminmax(double(svm_sift_train));

        model = svmtrain(train_label, re_train');

        svm_sift_test = [];
        for ii = 1:size(test_people, 2)
            peo = test_people(:, ii);
            peo = calibrate_img(peo, imgsize);
            raw_patch = sift_patches(peo, cloc);
            sift_pca_weight = sift_pca_projection(raw_patch, sift_pca_vector, sift_pca_avg);

            svm_sift_test = [svm_sift_test, sift_pca_weight(:)]; 
        end
        re_test = mapminmax.apply(double(svm_sift_test), ps);

        [predicted_labeln, accur, ~] = svmpredict(test_label, re_test', model);
        eachlearnrate = [eachlearnrate, accur(1)];
    end    