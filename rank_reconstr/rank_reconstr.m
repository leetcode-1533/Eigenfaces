clear

nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
imgsize = [112,92]; 
opts = {'euclidean', 'seuclidean', 'cityblock', 'minkowski', 'chebychev', 'cosine', 'correlation', 'spearman', 'hamming', 'jaccard'};

% Base Creation : Most Time consuming
[pbase, pavg, nmfbase, icabase] = PNI_Base_uninv(nmfdata, 60); % Original
pavg = pavg';
