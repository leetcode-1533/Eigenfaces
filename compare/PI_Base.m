function [pvector, pavg , inv_sbase] = PI_Base(nmfdata, k)
% do a pca, ica base calculation
[perc, pavg, pvector, ~] = opca(k, nmfdata);

sbase = fastica(nmfdata', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off');
for ii = 1 : k
    reversev = sbase(ii, :);
    maxpick = max(reversev);
    minpick = min(reversev);
    avgpick = mean(reversev);

    if(abs(avgpick - maxpick) < abs(avgpick - minpick))
        sbase(ii, :) = -reversev;
    end
end
    
inv_sbase = pinv(sbase); % ica created weight

