clear
% Base Creation : Most Time consuming
nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
[pvector, pavg, nmfw, sbase] = PNI_Base_uninv(nmfdata, 30); % Original

opts = ['euclidean', 'seuclidean', 'cityblock', 'minkowski', 'chebychev', 'mahalanobis', 'cosine', 'correlation', 'spearman', 'hamming', 'jaccard'];
% [test, it] = rankaccto(pvector, pavg, opts(1));

map_avg = mapminmax(pavg');