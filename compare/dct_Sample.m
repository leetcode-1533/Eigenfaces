% How DCT is used?
% Dct Without Compression
clear;
RGB = imread('autumn.tif');
I = rgb2gray(RGB);
J = dct2(I);

K = idct2(J);
figure, imshow(I)
figure, imshow(K,[])

%% DCT On Database
samples = imagedata2(1:20, 1:10);
imgsize = [112,92]; 

ori = [];
cont = [];
for ii = 1:size(samples, 2)
    temp = reshape(samples(:,ii),imgsize);
    Jtemp = dct2(temp);
    
    ori(:,:,ii) = temp;
    cont(:,:,ii) = log(abs(Jtemp));  
end

%% Plot 
figure(1)
subplot(1,2,1);
vl_imarraysc(ori,'Layout',[20,10]);
colormap('gray');
axis off
title('Original ORL database');
set(gca,'fontsize', 21);

subplot(1,2,2);
vl_imarraysc(cont,'Layout',[20,10]);
colormap('gray');
axis off
title('log(abs(2D DCT)) For ORL database');
set(gca,'fontsize', 21);
sdf(1, 'tk');

export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/dct_demo','-pdf')

