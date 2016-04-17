sift_svm = [ 
   35.2778   45.0000   46.4286   46.2500   49.5000   56.2500   48.3333   50.0000   70.0000
   60.2778   74.0625   79.2857   82.0833   85.0000   86.8750   90.8333   87.5000   92.5000
   60.2778   71.2500   82.5000   86.6667   83.0000   84.3750   89.1667   90.0000   97.5000
   67.5000   76.2500   79.6429   85.0000   86.5000   85.6250   90.8333   91.2500   95.0000
   60.5556   79.3750   87.1429   89.1667   84.5000   91.2500   86.6667   93.7500   95.0000
   61.6667   80.3125   80.0000   87.0833   89.0000   90.6250   93.3333   93.7500   90.0000
   60.8333   77.1875   78.2143   83.7500   85.0000   88.7500   92.5000   96.2500   92.5000];

sift_pca_svm = [
     24.7222   26.2500   29.6429   27.5000   31.0000   32.5000   35.0000   31.2500   37.5000
   42.5000   60.6250   62.1429   63.7500   64.5000   67.5000   65.0000   70.0000   70.0000
   50.8333   60.3125   67.8571   72.0833   77.5000   73.7500   80.0000   80.0000   85.0000
   51.1111   66.5625   73.9286   75.4167   80.5000   82.5000   80.8333   87.5000   80.0000
   46.1111   66.8750   69.2857   77.5000   81.0000   83.1250   80.8333   90.0000   90.0000
   52.7778   70.0000   76.7857   78.7500   81.5000   81.8750   82.5000   95.0000   90.0000
   50.0000   70.3125   73.5714   82.9167   81.0000   86.8750   83.3333   91.2500   85.0000];


figure(1)
ratiorange = 10:10:90;
locrange = 1:3:20;
[xloc, yloc] = meshgrid(ratiorange, locrange);


hold on
ob1 = mesh(xloc, yloc, sift_svm,'faceColor','r');
ob2 = mesh(xloc, yloc, sift_pca_svm,'faceColor','b'); 
% ob3 = mesh(xloc, yloc, ICA','faceColor','g');
hlegend = legend([ob1, ob2], {'SIFT','SIFT-PCA'});

set(hlegend,'FontSize',23);
% 
title('SVM Recognition Test')
xlabel('Learning Sample Rate(%)')
ylabel('Feature Points')
zlabel('Recogniton Rate')

sdf(1, 'tk')

%% SIFT-PCA Accurancy

locrange = 1:4:30;
pcasizerange = 3:5:80;

[xloc, yloc] = meshgrid(pcasizerange, locrange);
ob1 = mesh(xloc, yloc, re,'faceColor','r');


% hlegend = legend([ob1], {'SIFT','SIFT-PCA'});

% set(hlegend,'FontSize',23);
% 
title('SVM Recognition Test')
xlabel('PCA Vector Length')
ylabel('Feature Points')
zlabel('Recogniton Rate')
sdf(1, 'tk')



