intern = 1:1:9;
basesize = 5:5:100;
% basesize = 10:5:15;

[xloc, yloc] = meshgrid(intern, basesize);
% PCA = [];
% NMF = [];
% ICA = [];
% DCTPCA = [];
% DCTICA = [];
% for iterbase = basesize
%     pni_od = svm_original_dct_scanner(intern, iterbase);
%     PCA = [PCA, pni_od(:, 1)];
%     NMF = [NMF, pni_od(:, 2)];
%     ICA = [ICA, pni_od(:, 3)];
%     DCTPCA = [DCTPCA, pni_od(:, 4)];
%     DCTICA = [DCTICA, pni_od(:, 5)];
% end

%%For Combination Plot
% hold on
% ob1 = mesh(xloc, yloc, PCA','faceColor','r');
% ob2 = mesh(xloc, yloc, NMF','faceColor','b'); 
% ob3 = mesh(xloc, yloc, ICA','faceColor','g');
% hlegend = legend([ob1, ob2, ob3], {'PCA','NMF','ICA'});
% set(hlegend,'FontSize',23);
% 
% title('SVM Recognition Test')
% xlabel('Learning Sample Rate')
% ylabel('Vector Length')
% zlabel('Recogniton Rate')


%% For seperate plot
% figure(1)
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
% sdf(1, 'tk');
% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/svm_pni','-pdf')

%% Filter
% figure(1)
%     subplot(1,3,1);
%     PCA70 = PCA;
%     PCA70(PCA70<70) = 0;
%      bar3plot(1:3:10, 5:30:100, PCA70)
%     title('PCA > 70');
%     view(230, 33)
%     
%     subplot(1,3,2);
%     PCA80 = PCA;
%     PCA80(PCA80<80) = 0;
%      bar3plot(1:3:10, 5:30:100, PCA80)
%     title('PCA > 80');
%     view(230, 33)
%     
%     subplot(1,3,3);
%     PCA85 = PCA;
%     PCA85(PCA85<85) = 0;
%      bar3plot(1:3:10, 5:30:100, PCA80)
%     title('PCA > 85');
%     view(230, 33)
%     
% sdf(1, 'tk');
% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/svm_pcafilter','-png', '-m2.5')

%% PCA, DCT-PCA
% figure(1)
% hold on
% ob1 = mesh(xloc, yloc, PCA','faceColor','r');
% ob2 = mesh(xloc, yloc, DCTPCA','faceColor','g');
% hlegend = legend([ob1, ob2], {'PCA','DCT-PCA'});
% set(hlegend,'FontSize',23);
% view(3)
% 
% 
% title('SVM Recognition Test')
% xlabel('Learning Sample Rate')
% ylabel('Vector Length')
% zlabel('Recogniton Rate')
% sdf(1, 'tk');
% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/svm_pca_dct','-pdf')

%% ICA, DCT-ICA
% figure(1)
% hold on
% ob1 = mesh(xloc, yloc, ICA','faceColor','r');
% ob2 = mesh(xloc, yloc, DCTICA','faceColor','g');
% % ob3 = mesh(xloc, yloc, NMF','faceColor','b');
% hlegend = legend([ob1, ob2], {'ICA','DCT-ICA'});
% set(hlegend,'FontSize',23);
% view(3)
% 
% 
% title('SVM Recognition Test')
% xlabel('Learning Sample Rate')
% ylabel('Vector Length')
% zlabel('Recogniton Rate')
% sdf(1, 'tk');
% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/svm_ica_dct','-pdf')