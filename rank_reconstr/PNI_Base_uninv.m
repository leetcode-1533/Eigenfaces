function [pvector, pavg, w, sbase] = PNI_Base_uninv(nmfdata, k)
% pca, ica, nmf base calculation
[perc, pavg, pvector, ~] = opca(k, nmfdata);

for i = 1:k
    pvector(:,i) = pvector(:,i)./norm(pvector(:,i));
end


[w, ~] = boardnmf(nmfdata, k, 0);
for i = 1 : k
    w(:,i) = w(:,i)./norm(w(:,i));
end

sbase = fastica(nmfdata', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off');

for ii = 1 : k
    reversev = sbase(ii, :);
    maxpick = max(reversev);
    minpick = min(reversev);
    avgpick = mean(reversev);

    if(abs(avgpick - maxpick) < abs(avgpick - minpick))
        sbase(ii, :) = -reversev;
    end
    
    sbase(ii,:) = sbase(ii,:)./norm(sbase(ii,:));
end

