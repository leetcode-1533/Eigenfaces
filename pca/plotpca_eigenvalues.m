%% Plot pca

data = imagedata2(1:40, 1:10);
imgsize = [112,92]; 
[perc, avg, pvector, eigenvalues] = opca(6, data);

figure(1)
%     subplot(1,3,1);
%      bar3plot(1:3:10,5:30:100, PCA)
%     title('PCA');
%     view(230, 33)
%     
%     subplot(1,3,2);
%      bar3plot(1:3:10, 5:30:100, NMF)
%     title('NMF');
%     view(230, 33)
%     
%     subplot(1,3,3);
%      bar3plot(1:3:10, 5:30:100, ICA)
%     title('ICA');
%     view(230, 33)
%     
stem(1:400-6, eigenvalues(1:end-6), 'b');
stem(400 -5:400, eigenvalues(end-5:end), 'r');
title('PCA Eigenvalues Distrubtion');
xlabel('Eigenvalue ID');
ylabel('Eigenvalue');
sdf(1, 'tk');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pca_eivalue','-pdf')
