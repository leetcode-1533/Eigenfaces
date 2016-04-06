function [pvector, pavg, w, sbase] = PNI_Base_Nopinv(nmfdata, k)
% pca, ica, nmf base calculation
[perc, pavg, pvector, ~] = opca(k, nmfdata);


[w, ~] = boardnmf(nmfdata, k, 0);
for i = 1 : k
    w(:,i) = w(:,i)./norm(w(:,i));
end

sbase = fastica(nmfdata', 'numOfIC', k, 'verbose', 'off');
for ii = 1 : k
    reversev = sbase(ii, :);
    maxpick = max(reversev);
    minpick = min(reversev);
    avgpick = mean(reversev);

    if(abs(avgpick - maxpick) < abs(avgpick - minpick))
        sbase(ii, :) = -reversev;
    end
end

