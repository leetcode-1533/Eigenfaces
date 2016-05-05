clear 

ratiorange = 1:4:9;

numofpeople = 40;
numofperspective = 10;

locrange = 0.9:-0.4:0.3;
loci = 15; % region number, configurable

re = [];
ori_imgsize = [112,92];

sam_image = imagedata2(1,1);
sam_image = reshape(sam_image, ori_imgsize);
for imgratio = 1 : length(locrange)
    imgsize = size(imresize(sam_image,locrange(imgratio)));

    cloc = sift_dim(loci, imgsize);
    
    eachlearnrate = [];
    for iter = ratiorange

        train_people = [];
        train_label = zeros(iter * numofpeople , 1);
        test_people = [];
        test_label = [];

        for ii = 1 : numofpeople
            trs = randperm(numofperspective);

            train_people = [train_people, imagedata2(ii, trs(1 : iter))];
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
            peo = reshape(peo, ori_imgsize);
            peo = seamada(peo, imgsize);
            peo = im2single(peo);


            [~, d] =  vl_sift(peo,'frames', cloc) ;
            svm_sift_train = [svm_sift_train, d(:)]; 
        end
        [re_train, ps] = mapminmax(double(svm_sift_train));

        model = svmtrain(train_label, re_train');

        svm_sift_test = [];
        for ii = 1:size(test_people, 2)
            peo = test_people(:, ii);
            peo = im2single(peo./255);
            peo = reshape(peo, ori_imgsize);
            peo = seamada(peo, imgsize);
            peo = im2single(peo);



            [~, d] =  vl_sift(peo,'frames', cloc) ;
            svm_sift_test = [svm_sift_test, d(:)]; 
        end
        re_test = mapminmax.apply(double(svm_sift_test), ps);

        [predicted_labeln, accur, ~] = svmpredict(test_label, re_test', model);
        eachlearnrate = [eachlearnrate, accur(1)];
    end
    re = [re;eachlearnrate];
    
end