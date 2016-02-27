function [pvector, pavg , inv_sbase] = PI_Base(nmfdata, k)
% do a pca, ica base calculation
[perc, pavg, pvector, ~] = opca(k, nmfdata);

sbase = fastica(nmfdata', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off');
inv_sbase = pinv(sbase); % ica created weight

