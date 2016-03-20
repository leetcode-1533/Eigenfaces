% rank_reconstr
pick = nmfdata(:, 1);
pick = mapminmax(pick', 0, 1);
pick = pick';

testbase = nmfdata(:,2);


% 'error with mahalanobis',

ica_inv = pinv(icabase);
% nmf 
% [ref, ~] = rankaccto(nmf_inv, pavg, opts{1});
ica_all = [];

for basesize = 1:5:60
    icacol = [];
    for ii = 1:length(opts)
        [test, idx] = rankaccto(ica_inv, pick', opts{ii});
    %     bar(idx);
    %     title(opts{ii});
        sel_base = icabase(:, idx(1:basesize));
        inv_base = pinv(sel_base);

        
        w_ica = inv_base * pick;
        ica_re = sel_base*w_ica;
       
        icacol = [icacol, ica_re];
    end
    ica_all = [ica_all, icacol];
end

peekbase(ica_all, imgsize, 10, 12);