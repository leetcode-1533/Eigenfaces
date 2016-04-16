%% Sift_dim_test
k = 5;
imgsize = [112,92]; 

iter = 1:5:30;
figure(1);
for ii = 1:numel(iter)
    subplot(1,5,ii)
    
    c = sift_dim(iter(ii)); %detector location based on 100 people

    peo = imagedata2(1,1);
    peo = im2single(peo./255);
    peo = reshape(peo, imgsize);
    imshow(peo, []);

    vl_plotframe(c);
    title(['Number of Points',num2str(iter(ii))]);
end
title('Fixed Position SIFT');

% % re: optional: works on the samples
% for ii = 1:400 % first 100 samples
%     peo = imgs(:, ii);
%     
%     peo = im2single(peo./255);
%     peo = reshape(peo, imgsize);
%     
%     [~, d] =  vl_sift(peo,'frames', c) ;
%     dcontainer{ii} = d;    
% end

