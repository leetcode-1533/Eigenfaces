clear
nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
pick = nmfdata(:, 1);
imgsize = [112,92]; 

% Base Creation : Most Time consuming
[pvector, pavg, nmfw, sbase] = PNI_Base(nmfdata, 30); % Original
nmfw = nmfw';

% peekbase(pvector, imgsize, 5,6);
% peekbase(nmfw, imgsize, 5, 6);
% peekbase(sbase, imgsize, 5, 6);
% 
% figure()
% hold on
% plot(max(pvector),'r');
% plot(min(pvector),'r');
% 
% plot(max(nmfw),'b');
% plot(min(nmfw),'b');
% 
% plot(max(sbase), 'g');
% plot(min(sbase),'g');


[pv,~] = mapminmax(pvector', 0, 1);
pv = pv';
[nm,~] = mapminmax(nmfw', 0, 1);
nm = nm';
sb = mapminmax(sbase', 0, 1);
sb = sb';
% peekbase(pv, imgsize, 5,6);
% peekbase(nm, imgsize, 5,6);
% peekbase(sb, imgsize, 5,6);
% 
% figure()
% hold on
% plot(max(pv),'r');
% plot(min(pv),'r');
% 
% plot(max(nm),'b');
% plot(min(nm),'b');
% 
% plot(max(sb), 'g');
% plot(min(sb),'g');

pavg = mapminmax(pavg', 0, 1); % per row

opts = ['euclidean', 'seuclidean', 'cityblock', 'minkowski', 'chebychev', 'mahalanobis', 'cosine', 'correlation', 'spearman', 'hamming', 'jaccard'];
[test, idx] = rankaccto(pv', pavg, opts(1));

[test, idx] = rankaccto(test, pavg, opts(1));


% map_avg = mapminmax(pavg');