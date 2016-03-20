% kd forest

clear 

ratiorange = 5:5;

imgsize = [112,92]; 
numofpeople = 40;
numofperspective = 10;

locrange = 3:3;

re = [];

test_people = cell(0);
forest = cell(0);
for iter = ratiorange
    for peoi = 1 : numofpeople
        trs = randperm(numofperspective);

        train_people = imagedata2(peoi, trs(1 : iter)); % training sample for class peoi
        test_people = imagedata2(peoi, iter+1 : numofperspective);
        % shuffle
        perm1 = randperm(size(train_people,2));
        train_people = train_people(:, perm1);

        % exploit SIFT descriptor 
        d_all = [];
        for item = 1:size(train_people,2)
            peo = train_people(:, item);
            peo = im2single(peo./255);
            peo = reshape(peo, imgsize);

            [~, d] = vl_sift(peo);
            d_all = [d_all, d];
        end

        %construct current kdtree
        peoi_tree = KDTreeSearcher(d_all');
        forest{peoi} = peoi_tree;
    end
end
    