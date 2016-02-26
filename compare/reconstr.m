%% PCA Usage
% [perc, avg, pvector, ~] = opca(5, data);
%  weight = pvector'*(testdata(:,i)-avg);
%  reconstr(:,i) = pvector*weight+avg;
%% NMF Usage
% [w,h] = boardnmf(data,80,0);
% for i = 1:80
%     w(:,i) = w(:,i)./norm(w(:,i));
% end
% wpinv = pinv(w);
% weight = wpinv*testdata(:,i);
% reconstr(:,i) = w*weight; 
% plot(weight);
%% ICA Usage
% sbase = fastica(data', 'numOfIC', 80, 'displayMode', 'off', 'verbose', 'off'); 
% inv_sbase = pinv(sbase);
% w = testdata' * inv_sbase;
% reconstr = w * sbase;
%% cal
% reconstruction compares
imgsize = [112,92]; 

fulldata = imagedata(40, 10);
nmfdata = imagedata(40,3);
pick = fulldata(:, 1);
recs = []; % reconstruction container

% Create Base
for k = 1 : 5 : 51
    pcabasebegin = tic;
    [perc, avg, pvector, ~] = opca(k, nmfdata);
    pcabasetime = toc(pcabasebegin);

    nmfbasebegin = tic;
    [w, ~] = boardnmf(nmfdata, k, 0);
    nmfbasetime = toc(nmfbasebegin);

    icabasebegin = tic;
    sbase = fastica(nmfdata', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off'); 
    icabasetime = toc(icabasebegin);

    disp(sprintf('Create base of size %d, PCA: %f, NMF: %f, ICA: %f', k, pcabasetime, nmfbasetime, icabasetime));

    % reconstruction
    pcarecbegin = tic;
    pcaweight = pvector'*(pick-avg);
    pcareconstr = pvector*pcaweight+avg;
    pcarectime = toc(pcarecbegin);

    nmfrecbegin = tic;
    for i = 1 : k
        w(:,i) = w(:,i)./norm(w(:,i));
    end
    wpinv = pinv(w); % nmf craeted weight
    nmfweight = wpinv*pick; % related individual image weight
    nmfreconstr = w*nmfweight; 
    nmfrectime = toc(nmfrecbegin);

    icarecbegin = tic;
    inv_sbase = pinv(sbase); % ica careted weight
    w_ica = pick' * inv_sbase; % related individual image weight
    ica_reconstr = w_ica * sbase;
    icarectime = toc(icarecbegin);
    disp(sprintf('Reconstruction of size %d, PCA: %f, NMF: %f, ICA: %f', k, pcarectime, nmfrectime, icarectime));

    % show images
    recs = [recs, pcareconstr, nmfreconstr, ica_reconstr'];
end


