%% Test

function sift_bow_tests()
    index = 0;
    for ii = [40,100,300,1500,3000]
        dis_matrix = cal_mat(ii);
        
        index = index + 1;
        subplot(1,5,index);
        
        colormap('hot');   % set colormap
        imagesc(dis_matrix);        % draw image and scale colormap to values range
        colorbar;          % show color scale
        grid on
        title(['bag size:', num2str(ii)])

    end
end


%% Sift Distance matrix using BoW

function dis_matrix = cal_mat(numClusters)
imgsize = [112,92]; 
centers = sift_bow(numClusters);


train_people = imagedata2(1:40, 1:10);
svm_sift_train = [];
for ii = 1:size(train_people, 2)
    peo = train_people(:, ii);
    peo = calibrate_img(peo, imgsize);
    h = sift_bow_proj(peo, centers);

    svm_sift_train = [svm_sift_train,  h'];  % observation per column
end
test = svm_sift_train';
dis_matrix = pdist2(test, test);
end