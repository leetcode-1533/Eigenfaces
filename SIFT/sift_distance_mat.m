clear

%% Sift-pca Distance matrix
pcarange = 3:18:80;

all_pca_range = {};
for i = 1:numel(pcarange)
    cloc = sift_dim(20);
    [~, sift_pca_avg, sift_pca_vector, ~] = sift_pca_base(pcarange(i)); %itself used 20 as well
    imgsize = [112,92]; 

    train_people = imagedata2(1:40, 1:10);
    svm_sift_train = [];
    for ii = 1:size(train_people, 2)
        peo = train_people(:, ii);
        peo = calibrate_img(peo, imgsize);
        raw_patch = sift_patches(peo, cloc);
        sift_pca_weight = sift_pca_projection(raw_patch, sift_pca_vector, sift_pca_avg);

        svm_sift_train = [svm_sift_train, sift_pca_weight(:)];  % observation per column
    end
    all_pca_range = {all_pca_range{:}, svm_sift_train};

end

%% Sift Distance matrix

    cloc = sift_dim(20);
    imgsize = [112,92]; 

    train_people = imagedata2(1:40, 1:10);
    svm_sift_train = [];
    for ii = 1:size(train_people, 2)
        peo = train_people(:, ii);
        peo = calibrate_img(peo, imgsize);
        [~, d] =  vl_sift(peo,'frames', cloc) ;

        svm_sift_train = [svm_sift_train, d(:)];  % observation per column
    end

%% plot
hold on 
i = 0;
for item = all_pca_range
    i = i + 1;
    subplot(3,2, i);
    
    test = cell2mat(item)';
    dis_matrix = pdist2(test, test);
    imagesc(dis_matrix);
    title(['SIFT-PCA Vector Length ', num2str(pcarange(i))]);
    
    colormap('hot');   % set colormap
    colorbar; 
    grid on
end
%% PLOT SIFT
    subplot(3,2, 6);

test = svm_sift_train';
dis_matrix = pdist2(test, test);
 colormap('hot');   % set colormap
 imagesc(dis_matrix);        % draw image and scale colormap to values range
 colorbar;          % show color scale
 grid on
    title('SIFT')