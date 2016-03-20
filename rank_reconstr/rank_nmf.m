pick = nmfdata(:, 1);
pick = mapminmax(pick', 0, 1);
pick = pick';

nmf_inv = pinv(nmfbase);
% nmf 
% [ref, ~] = rankaccto(nmf_inv, pavg, opts{1});
nmf_all = [];
for basesize = 1:5:60
    nmfcol = [];
    for ii = 1:length(opts)
        [test, idx] = rankaccto(nmf_inv, pavg, opts{ii});
    %     bar(idx);
    %     title(opts{ii});
        sel_base = nmfbase(:, idx(1:basesize));
        inv_base = pinv(sel_base);
        
        w_nmf = inv_base * pick;
        nmf_re = sel_base*w_nmf;
       
        nmfcol = [nmfcol, nmf_re];
    end
    nmf_all = [nmf_all, nmfcol];
end

peekbase(nmf_all, imgsize, 10, 12);