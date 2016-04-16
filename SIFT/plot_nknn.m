sift_perf = [    0.7944    0.8906    0.9750    0.9583    0.9900    0.9938    1.0000    1.0000    1.0000];
sift_pca_perf = [     0.5944    0.8063    0.8750    0.9167    0.9350    0.9750    1.0000    0.9875    1.0000];

figure(1)
hold on
sift_o = plot(10:10:90, sift_perf, '-*');
sift_p = plot(10:10:90, sift_pca_perf, '-x');

legend('SIFT', 'SIFT-PCA');
xlabel('Sample Rate(%)')
ylabel('Accurancy')

title('SIFT Related Classification Accurancies')
sdf(1,'tk');