%% Load Performance
load /Users/y1275963/Dropbox/mat/resol/im_pca.mat;
im_pca = answer;

load /Users/y1275963/Dropbox/mat/resol/im_siftnknn.mat
im_siftnknn= answer;
im_siftnknn = im_siftnknn * 100;

load /Users/y1275963/Dropbox/mat/resol/im_siftsvm.mat
im_siftsvm= answer;

load /Users/y1275963/Dropbox/mat/resol/se_pca.mat
se_pca= answer;

load /Users/y1275963/Dropbox/mat/resol/se_siftnknn.mat
se_siftnknn= answer;
se_siftnknn = se_siftnknn * 100;

load /Users/y1275963/Dropbox/mat/resol/se_siftsvm.mat
se_siftsvm= answer;

%% Plot Imresize
xloc = 0.4:0.1:1;
yloc = 2:9;
figure(1)
hold on
ob1 = mesh(xloc, yloc, im_pca','faceColor','r');
ob2 = mesh(xloc, yloc, im_siftnknn','faceColor','g');
ob3 = mesh(xloc, yloc, im_siftsvm','faceColor','b');

hlegend = legend([ob1, ob2, ob3], {'Interpolation: PCA','Interpolation: SIFT NKNN', 'Interpolation: SIFT SVM'});
til = title('Imresize Part Comparsion');
xlabel('Image Scale')
ylabel('Fold')
zlabel('Recogniton Rate')
sdf(1, 'tk');
set(hlegend,'FontSize',23);
set(til,'FontSize',23);
view(3)
% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/glo_comp_imresize','-pdf')

%% Plot seam carving
xloc = 0.4:0.1:1;
yloc = 2:9;
figure(1)
hold on
ob4 = mesh(xloc, yloc, se_pca','faceColor','y');
ob5 = mesh(xloc, yloc, se_siftnknn','faceColor','c');
ob6 = mesh(xloc, yloc, se_siftsvm','faceColor','m');

hlegend = legend([ob4, ob5, ob6], {'Seam Carving: PCA',  'Seam Carving: SIFT NKNN',  'Seam Carving: SIFT SVM'});
til = title('Seam Carving Part Comparsion');
xlabel('Image Scale')
ylabel('Fold')
zlabel('Recogniton Rate')
sdf(1, 'tk');
set(hlegend,'FontSize',23);
set(til,'FontSize',23);
view(3)
% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/glo_comp_seamcar','-pdf')

%% Plot global
xloc = 0.4:0.1:1;
yloc = 2:9;
figure(1)
hold on
ob1 = mesh(xloc, yloc, im_pca','faceColor','r');
ob2 = mesh(xloc, yloc, im_siftnknn','faceColor','g');
ob3 = mesh(xloc, yloc, im_siftsvm','faceColor','b');
ob4 = mesh(xloc, yloc, se_pca','faceColor','y');
ob5 = mesh(xloc, yloc, se_siftnknn','faceColor','c');
ob6 = mesh(xloc, yloc, se_siftsvm','faceColor','m');

hlegend = legend([ob1, ob2, ob3, ob4, ob5, ob6], {'Interpolation: PCA','Interpolation: SIFT NKNN', 'Interpolation: SIFT SVM', 'Seam Carving: PCA',  'Seam Carving: SIFT NKNN',  'Seam Carving: SIFT SVM'});

til = title('Overall Comparsion');
xlabel('Image Scale')
ylabel('Fold')
zlabel('Recogniton Rate')
sdf(1, 'tk');
set(hlegend,'FontSize',23);
set(til,'FontSize',23);

% export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/glo_comp','-pdf')