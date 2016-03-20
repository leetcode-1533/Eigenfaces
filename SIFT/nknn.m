% kd forest
warning('off','all')
clear 

ratiorange = 5:5;

imgsize = [112,92]; 
numofpeople = 40;
numofperspective = 10;

re = [];

test_peo = cell(0);
forest = cell(0);
for iter = ratiorange
    for peoi = 1 : numofpeople
        trs = randperm(numofperspective);

        train_people = imagedata2(peoi, trs(1 : iter)); % training sample for class peoi
        test_people = imagedata2(peoi, iter+1 : numofperspective)
        test_peo{peoi} = test_people;
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
    
    re = cell(0);
    % testing on the samples
    for peoi = 1 : numofpeople
        cur_test = test_peo{peoi};
        
        ans = []; % should be a length of 5 vector
        % test each people
        for item = 1 : size(cur_test,2)
            peo = cur_test(:, item);
            peo = im2single(peo./255);
            peo = reshape(peo, imgsize);

            [~, d] = vl_sift(peo);
            
            d_list = [];
            for tree = 1:length(forest)
                dis_all = 0;

                for ditem = 1 : size(d, 2)
                    [~, dis] = knnsearch(forest{tree}, d(:, ditem)');
                    dis_all = dis_all + dis;
                end
                
                d_list = [d_list, dis_all];
            end
            [~, Idx] = min(d_list);
            ans = [ans, Idx];
        end
        re{peoi} = ans;     
        peoi
    end
end

% report results
retest = cell2mat(re');
for i = 1 : numofpeople
    result(i,:) = retest(i,:) - i;
end
[sx, sy] = size(result);
1 - length(find(result ~= 0))/(sx*sy)