function [pvector, pavg, wpinv, inv_sbase] = PNI_Base(nmfdata, k)

[perc, pavg, pvector, ~] = opca(k, nmfdata);


[w, ~] = boardnmf(nmfdata, k, 0);
for i = 1 : k
    w(:,i) = w(:,i)./norm(w(:,i));
end
wpinv = pinv(w); % nmf craeted weight

sbase = fastica(nmfdata', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off');
inv_sbase = pinv(sbase); % ica created weight

