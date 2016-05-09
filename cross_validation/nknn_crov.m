function acc = nknn_crov(xtrain, ytrain, xtest, ytest)

% kd forest
warning('off','all')
ytrain = ytrain';
classes = unique(ytrain);
forest = cell(0);

parfor clas = classes
    indx = find(ytrain == clas);
    cls = xtrain(indx);
    d_all = cell2mat(cls);

    peoi_tree = KDTreeSearcher(double(d_all'));
    forest{clas} = peoi_tree;
end

answer = [];
parfor peoi = 1 : size(xtest, 2)
    d_list = [];
    d = xtest{peoi};
    for tree = 1:length(forest)
        dis_all = 0;
        
        for ditem = 1:size(d,2)
            [~, dis] = knnsearch(forest{tree}, double(d(:, ditem)'));
            dis_all = dis_all + dis;
        end
        
        d_list = [d_list, dis_all];
    end
    [~, Idx] = min(d_list);
    answer = [answer, Idx];     
end
acc = length(find(answer == ytest'))./length(ytest);


