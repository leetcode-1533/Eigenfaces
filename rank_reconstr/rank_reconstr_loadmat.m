clear
nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
pick = nmfdata(:, 1);
imgsize = [112,92]; 

% Base Creation : Most Time consuming
[pbase, pavg, nmfbase, icabase] = PNI_Base_uninv(nmfdata, 30); % Original

% figure()
% hold on
% plot(max(pbase),'r');
% plot(min(pbase),'r');
% 
% plot(max(nmfbase),'b');
% plot(min(nmfbase),'b');
% 
% plot(max(icabase), 'g');
% plot(min(icabase),'g');
% 
% inv_pca = pbase';
% inv_nmf = pinv(nmfbase);
% inv_ica = pinv(icabase);
% figure()
% hold on
% plot(max(inv_pca'),'r');
% plot(min(inv_pca'),'r');
% 
% plot(max(inv_nmf'),'b');
% plot(min(inv_nmf'),'b');
% 
% plot(max(inv_ica'), 'g');
% plot(min(inv_ica'),'g');

% pavg = mapminmax(pavg', 0, 1); % per row
% 
% opts = {'euclidean', 'seuclidean', 'cityblock', 'minkowski', 'chebychev', 'cosine', 'correlation', 'spearman', 'hamming', 'jaccard'};
% % 'error with mahalanobis',
% 
% % pca at dim 5
% [ref, idx] = rankaccto(pv', pavg, opts{1});
% pcacol = [];
% for ii = 1:length(opts)
%     [test, idx] = rankaccto(ref, pavg, opts{ii});
% %     bar(idx);
% %     title(opts{ii});
%     sel_base = test(1:5, :);
%     
%     pick = nmfdata(:, 1);
%     
%     pcaweight = sel_base * (pick - pavg');
%     pcareconstr = sel_base'*pcaweight + pavg';
%     
%     pcacolumn = [pcacol, pcareconstr];
% end
% 
% % nmf at dim 5
% [ref, idx] = rankaccto(nm', pavg, opts{1});
% 
% for ii = 1:length(opts)
%     pause
%     [test, idx] = rankaccto(ref, pavg, opts{ii});
% %     bar(idx);
% %     title(opts{ii});
%     sel_base = test(1:5, :);
%     
%     pick = nmfdata(:, 1);
%     
%     w_nmf = nm*pick;
%     w_rec = w*w_nmf;
% end


% map_avg = mapminmax(pavg');