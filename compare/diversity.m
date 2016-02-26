clear
imgsize = [112,92]; 

nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable

k = 10; % Dimension: adjustable
num = 8; % output number: adjustable

[perc, avg, pvector, ~] = opca(k, nmfdata);
[w, ~] = boardnmf(nmfdata, k, 0);
for i = 1 : k
    w(:,i) = w(:,i)./norm(w(:,i));
end

sbase = fastica(nmfdata', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off');

% starting projection
pick1 = imagedata2(1:num, 1:1); % different people
pick2 = imagedata2(1:1, 1:num); % different perspective
pick3 = imagedata2(21:28, 1:1); % different new people
pick4 = imagedata2(21:21, 1:8); % different new perspective
pick = pick4; % input samples, selected from pick1 ~ pick4: adjustible
% PCA:
for i = 1 : num
    pcaweight(:, i) = pvector'*(pick(:, i)-avg);
    pcareconstr(:, i) = pvector*pcaweight(:, i)+avg;
end
% NMF:
wpinv = pinv(w); % nmf craeted weight
nmfweight = wpinv*pick; % related individual image weight
nmfreconstr = w*nmfweight; 
%ICA 
inv_sbase = pinv(sbase); % ica careted weight
w_ica = pick' * inv_sbase; % related individual image weight
ica_reconstr = w_ica * sbase;

% creating color map
% PCA:
repcaweight = pcaweight'; % row orientation
pcamean = mean(repcaweight, 1);
for i = 1 : num
    repcaweight(i, :) = repcaweight(i, :) - pcamean;
    pcatable(i) = sumsqr(repcaweight(i, :));
end
repcatable = mapminmax(pcatable, -1, 1);
% NMF:
renmfweight = nmfweight'; % row orientation
nmfmean = mean(renmfweight, 1);
for i = 1 : num
    renmfweight(i, :) = renmfweight(i, :) - nmfmean;
    nmftable(i) = sumsqr(renmfweight(i, :));
end
renmftable = mapminmax(nmftable, -1, 1);
% ICA:
mapicaweight = w_ica;
icamean = mean(mapicaweight, 1);
for i = 1 : num
    mapicaweight(i, :) = mapicaweight(i, :) - icamean;
    icatable(i) = sumsqr(mapicaweight(i, :));
end
reicatable = mapminmax(icatable, -1, 1);

table = [repcatable', renmftable', reicatable'];
updowntable = flipud(table);
tabc = [[updowntable zeros(size(updowntable,1),1)]; zeros(1, size(updowntable, 2) + 1)];
pcolor(tabc)
colorbar


