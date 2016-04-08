basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);

[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);
[train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, testdata);

pca_matrix = pdist2(train_p', train_p', 'euclidean');
nmf_matrix = pdist2(train_n', train_n', 'euclidean');
ica_matrix = pdist2(train_i', train_i', 'euclidean');

figure()
colormap('hot');   % set colormap
imagesc(pca_matrix);        % draw image and scale colormap to values range
col = colorbar;          % show color scale
col.Ticks = [];
grid on
axis off
title('PCA Eulidean Distance')

figure()
colormap('hot');   % set colormap
imagesc(nmf_matrix);        % draw image and scale colormap to values range
col = colorbar;          % show color scale
col.Ticks = [];
grid on
axis off
title('NMF Eulidean Distance')

figure()
colormap('hot');   % set colormap
imagesc(ica_matrix);        % draw image and scale colormap to values range
col = colorbar;          % show color scale
col.Ticks = [];
grid on
axis off
title('ICA Eulidean Distance')

pca_matrix = pdist2(train_p', train_p', 'cosine');
nmf_matrix = pdist2(train_n', train_n', 'cosine');
ica_matrix = pdist2(train_i', train_i', 'cosine');

figure()
colormap('hot');   % set colormap
imagesc(pca_matrix);        % draw image and scale colormap to values range
col = colorbar;          % show color scale
grid on
axis off
title('PCA Cosine Distance')

figure()
colormap('hot');   % set colormap
imagesc(nmf_matrix);        % draw image and scale colormap to values range
col = colorbar;          % show color scale
grid on
axis off
title('NMF Cosine Distance')

figure()
colormap('hot');   % set colormap
imagesc(ica_matrix);        % draw image and scale colormap to values range
col = colorbar;          % show color scale
grid on
axis off
title('ICA Cosine Distance')


