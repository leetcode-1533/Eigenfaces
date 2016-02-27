function [pcaweight, nmfweight, w_ica] = PNI_Base(pick, k, input)

    k = 10; % Dimension: adjustable
    pick = train_people;

    [perc, avg, pvector, ~] = opca(k, nmfdata);
    for i = 1 : size(pick,2)
        pcaweight(:, i) = pvector'*(pick(:, i)-avg);
    end

    [w, ~] = boardnmf(nmfdata, k, 0);
    wpinv = pinv(w); % nmf craeted weight
    nmfweight = wpinv*pick; % related individual image weight
    for i = 1 : k
        w(:,i) = w(:,i)./norm(w(:,i));
    end
    sbase = fastica(nmfdata', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off');
    inv_sbase = pinv(sbase); % ica careted weight
    w_ica = pick' * inv_sbase; % related individual image weight
    w_ica = w_ica';