clear
% nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
% pick = nmfdata(:, 1);
% imgsize = [112,92]; 
% 
% % Base Creation : Most Time consuming
% [pvector, pavg, nmfw, sbase] = PNI_Base(nmfdata, 30); % Original
% nmfw = nmfw';
% 
% % peekbase(pvector, imgsize, 5,6);
% % peekbase(nmfw, imgsize, 5, 6);
% % peekbase(sbase, imgsize, 5, 6);
% % 
% % figure()
% % hold on
% % plot(max(pvector),'r');
% % plot(min(pvector),'r');
% % 
% % plot(max(nmfw),'b');
% % plot(min(nmfw),'b');
% % 
% % plot(max(sbase), 'g');
% % plot(min(sbase),'g');
% 
% 
% [pv,~] = mapminmax(pvector', 0, 1);
% pv = pv';
% [nm,~] = mapminmax(nmfw', 0, 1);
% nm = nm';
% sb = mapminmax(sbase', 0, 1);
% sb = sb';
% % peekbase(pv, imgsize, 5,6);
% % peekbase(nm, imgsize, 5,6);
% % peekbase(sb, imgsize, 5,6);
% % 
% % figure()
% % hold on
% % plot(max(pv),'r');
% % plot(min(pv),'r');
% % 
% % plot(max(nm),'b');
% % plot(min(nm),'b');
% % 
% % plot(max(sb), 'g');
% % plot(min(sb),'g');
% 
% pavg = mapminmax(pavg', 0, 1); % per row
% 
load('~/Dropbox/mat/rank_.mat');
opts = {'euclidean', 'seuclidean', 'cityblock', 'minkowski', 'chebychev', 'cosine', 'correlation', 'spearman', 'hamming', 'jaccard'};
% 'mahalanobis',

[ref, idx] = rankaccto(pv', pavg, opts{1});

for ii = 1:length(opts)
    pause
    [test, idx] = rankaccto(ref, pavg, opts{ii});
    bar(idx);
    title(opts{ii});
    sel_base = test(1:5, :);
end

pick = nmfdata(:, 1);

% map_avg = mapminmax(pavg');