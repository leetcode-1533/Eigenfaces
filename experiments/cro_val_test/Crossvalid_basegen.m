%% Cross Valid base generator
clear

basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);

[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);
[pca_set, nmf_set, ica_set] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, testdata);

mapped_pca = mapminmax(pca_set);
mapped_pca = mapped_pca';

label = repmat(1:40,10,1);
label = label(:);

%% SVM Demo
acc_con = [];
for fold = 2:9
    acc = crossvalidation(mapped_pca, label, fold);
    acc = mean(acc');
    acc_con = [acc_con, acc];
end

%% Plot fold 
figure(1)
hold on;
plot(2:9, acc_con,'b-');
plot(2:9, acc_con,'rx');

title('Cross Validation Fold Size');
xlabel('Fold Size');
ylabel('Accurancy');
sdf(1, 'tk');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/svm_fold','-pdf')
