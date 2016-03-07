function [pvector, pavg, wpinv, inv_sbase] = PNI_Base(nmfdata, k)
% pca, ica, nmf base calculation
[perc, pavg, pvector, ~] = opca(k, nmfdata);


[w, ~] = boardnmf(nmfdata, k, 0);
for i = 1 : k
    w(:,i) = w(:,i)./norm(w(:,i));
end
wpinv = pinv(w); % nmf craeted weight

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

