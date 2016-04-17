% reconstruction script
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
clear;

imgsize = [112,92]; 

nmfdata = imagedata2(1:40,1:3);
pick = imagedata2(1:1, 10:10);
recs = []; % reconstruction container

pca1 = [];
nmf1 = [];
ica1 = [];

pca2 = [];
nmf2 = [];
ica2 = [];

% Create Base
for k = 1 : 10 : 100
    pcabasebegin = tic;
    [perc, avg, pvector, ~] = opca(k, nmfdata);
    pcabasetime = toc(pcabasebegin);

    nmfbasebegin = tic;
    [w, ~] = boardnmf(nmfdata, k, 0);
    nmfbasetime = toc(nmfbasebegin);

    icabasebegin = tic;
    sbase = fastica(nmfdata', 'numOfIC', k, 'verbose', 'off');  
    for ii = 1 : k
        reversev = sbase(ii, :);
        maxpick = max(reversev);
        minpick = min(reversev);
        avgpick = mean(reversev);

        if(abs(avgpick - maxpick) > abs(avgpick - minpick))
            sbase(ii, :) = -reversev;
        end
    end
    icabasetime = toc(icabasebegin);
    
    pca1 = [pca1, pcabasetime];
    nmf1 = [nmf1, nmfbasetime];
    ica1 = [ica1, icabasetime];
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
    
    pca2 = [pca2, pcarectime];
    nmf2 = [nmf2, nmfrectime];
    ica2 = [ica2, icarectime];
    disp(sprintf('Reconstruction of size %d, PCA: %f, NMF: %f, ICA: %f', k, pcarectime, nmfrectime, icarectime));

    % show images
    recs = [recs, pcareconstr, nmfreconstr, ica_reconstr'];
end

%% creating base time consumation
figure()
k = 1 : 10 : 100;

hold on
plot(k, pca1);
plot(k, nmf1);
plot(k, ica1);
plot(k, g3ica);
legend('pca', 'nmf', 'ica, g(u)=tanh(u)', 'ica, g(u) = u^3');
title('Base Construction Time');
xlabel('Base Dimensions');
ylabel('Time(s)');
sdf(1, 'tk');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pni_baseconstr','-pdf')

% set(gca,'yscale','log')

% projection time consumation
figure(2)
hold on
plot(k, pca2);
plot(k, nmf2);
plot(k, ica2);
legend('pca', 'nmf', 'ica');
title('Base Projection Time');
xlabel('Base Dimensions');
ylabel('Time(s)');
sdf(2, 'tk');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pni_baseproj','-pdf')


% reconstrution comparsion
% peekbase(recs, imgsize, 10, 3)
