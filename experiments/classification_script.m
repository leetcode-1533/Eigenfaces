%% Startup
basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);

[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);
[train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, testdata);

label = repmat(1:40,10,1);
label = label(:);

class_data = [train_i', label];

%% Results
pcare = [56.2, 34.2, 9.8, 92.8, 88, 89.5, 91.8,91.5, 12.5, 85.2, 51.7,91.8, 70.2, 32.2,81.2, 68.8, 86.2, 69.5, 86.5, 96.0, 94.5, 66.5];
nmfre = [52.5, 32, 9.2, 93.8, 88, 89.2, 91.8, 91.2,10,86.8,56,92.5, 78.5, 29.2,81.5, 79.2,89,64, 86.5,96.8,94.2,52.5];
icare = [52.2,28,9.5, 92.2,92,93.2,94.8,94.2,24.5,94.2,87,94.2,82.5,37.8,81.5,82,91.2,68.8,91.2,95.8,94.8,24.8];
res = [pcare;nmfre;icare];

figure(1)
hold on
grid on

pplot = stem(1:22, pcare, 'r', 'LineWidth', 5);
nplot = stem(1:22, nmfre, 'g', 'LineWidth', 3);
iplot = stem(1:22, icare, 'b');
 
title('Classifiers Performances');
xlabel('Classifiers ID');
ylabel('Accurancy');

ax = gca;
ax.XTick = 1:1:22;

legend([pplot, nplot, iplot], 'PCA', 'NMF', 'ICA');
sdf(1, 'tk');

export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pni_res','-pdf')

