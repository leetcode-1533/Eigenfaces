function [pvector, pavg, w, sbase] = PNI_Base_uninv(nmfdata, k)
% pca, ica, nmf base calculation
[perc, pavg, pvector, ~] = opca(k, nmfdata);
pavg = mapminmax(pavg', 0, 1);
pavg = pavg';

[pv,~] = mapminmax(pvector', 0, 1);
pvector = pv';

[w, ~] = boardnmf(nmfdata, k, 0);
for i = 1 : k
    w(:,i) = w(:,i)./norm(w(:,i));
end
[w,~] = mapminmax(w', 0, 1);
w = w';

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
sb = mapminmax(sbase', 0, 1);
sbase = sb;




