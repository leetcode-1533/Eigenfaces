pick = nmfdata(:, 1);
pick = mapminmax(pick', 0, 1);
pick = pick';

% pca at dim 5
[ref, idx] = rankaccto(pbase', pick', opts{1});
pca_all = [];
for basesize = 1:5:60
    pcacol = [];
    for ii = 1:length(opts)
        [test, idx] = rankaccto(ref, pavg, opts{ii});
    %     bar(idx);
    %     title(opts{ii});
        sel_base = test(1:basesize, :);
        
        pcaweight = sel_base * (pick - pavg');
        pcareconstr = sel_base'*pcaweight + pavg';

        pcacol = [pcacol, pcareconstr];
    end
    pca_all = [pca_all, pcacol];
end

peekbase(pca_all, imgsize, 10, 12);