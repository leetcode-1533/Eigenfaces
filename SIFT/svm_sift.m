clear 

ratiorange = 8:8;

imgsize = [112,92]; 
numofpeople = 40;
numofperspective = 10;


    
for iter = ratiorange
    
    train_people = zeros(imgsize(1) * imgsize(2), iter * numofpeople);
    train_label = zeros(iter * numofpeople , 1);
    test_people = [];
    test_label = [];

    for i = 1 : numofpeople
        trs = randperm(numofperspective);

        train_people(:, ((i - 1) * iter + 1) : i * iter)  = imagedata2(i, trs(1 : iter));
        train_label(((i - 1) * iter + 1) : i * iter,  1) =  repmat(i, iter, 1);
        test_people = [test_people, imagedata2(i, trs(iter+1 : numofperspective))];
        test_label = [test_label; repmat(i, numofperspective - iter, 1)];
    end

    % shuffle
    perm1 = randperm(size(train_people,2));
    train_people = train_people(:, perm1);
    train_label = train_label(perm1);

    perm2 = randperm(size(test_people,2));
    test_people = test_people(:, perm2);
    test_label = test_label(perm2);

end