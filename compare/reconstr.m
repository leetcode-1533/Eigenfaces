% reconstruction compares

data = imagedata(40, 10);
%% PCA Usage
% [perc, avg, pvector, ~] = opca(5, data);
%  weight = pvector'*(testdata(:,i)-avg);
%  reconstr(:,i) = pvector*weight+avg;
%% NMF Usage
% [w,h] = boardnmf(data,80,0);
