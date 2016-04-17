sift_perf = [    0.7944    0.8906    0.9750    0.9583    0.9900    0.9938    1.0000    1.0000    1.0000];
sift_pca_perf = [     0.5944    0.8063    0.8750    0.9167    0.9350    0.9750    1.0000    0.9875    1.0000];
sift_svm_perf = [    59.4444   77.8125   85.0000   87.5000   88.0000   93.1250   93.3333   92.5000   97.5000]/100;
sift_pca_svm_perf = [   51.6667   67.8125   75.0000   76.2500   78.5000   82.5000   82.5000   87.5000   85.0000]/100;

figure(1)
hold on
sift_o = plot(10:10:90, sift_perf, '-*');
sift_p = plot(10:10:90, sift_pca_perf, '-x');
svm_o = plot(10:10:90, sift_svm_perf, '-o');
svm_p = plot(10:10:90, sift_pca_svm_perf, '-d');



legend('SIFT NKNN', 'SIFT-PCA NKNN', 'SIFT SVM', 'SIFT-PCA SVM');
xlabel('Sample Rate(%)')
ylabel('Accurancy')

title('SIFT Related Classification Accurancies')
sdf(1,'tk');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/sift_classification','-pdf')
