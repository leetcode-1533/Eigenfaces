clear
imgsize = [112,92];

basedata = imagedata2(1:40, 1:3);
test1 = imagedata2(1, 1);
test2 = imagedata2(1, 10);

i2 = imread('/Users/y1275963/Pictures/images-1.jpg');
i2 = rgb2gray(i2);
i2 = imresize(i2,imgsize);
test3 = double(i2);

FDetect = vision.CascadeObjectDetector;
BB = step(FDetect, i2);
i5 = imcrop(i2, BB);
i5 = imresize(i5, imgsize);
test4 = double(i5);

im1 = imread('im1.png');
im1 = imresize(im1, imgsize);
test5 = double(im1);

test = [test1, test2, test3(:), test4(:), test5(:)];

testpatch = reshape(test, 112, 92, []);
colormap('gray');
vl_imarraysc(testpatch, 'Layout', [1,5]);
axis off

container = [];
pcaws = {};
pca_avg = {};
nmfws = {};
icaws = {};

pcacont = [];
nmfcont = [];
icacont = [];

dims = 1:10:100;
% for k = dims    
%     [pvector, pavg, w, sbase] = PNI_Base_uninv(basedata, k);
%     wpinv = pinv(w); % nmf craeted weight
%     inv_sbase = pinv(sbase); % ica created weight
% end
load ~/Dropbox/mat/pni_base.mat 
for k = 1: numel(dims)    
%     pcaws = {pcaws{:}, pvector};
%     pca_avg = {pca_avg{:}, pavg};
%     nmfws = {nmfws{:}, w};
%     icaws = {icaws{:}, sbase};
    pvector = pcaws{k};
    pavg = pca_avg{k};
    w = nmfws{k};
    sbase = icaws{k};
    
    wpinv = pinv(w); % nmf craeted weight
    inv_sbase = pinv(sbase); % ica created weight

    [pcaweight, nmfweight, icaweight] = rank_PNI_Projection(pvector, pavg, wpinv, inv_sbase, test);
    
    
    pcatemp = pvector*pcaweight;
    for ii = 1:size(test,2)
        pcatemp(:,ii) = pcatemp(:,ii) + pavg;
    end
    
    nmftemp = w*nmfweight;
    
    icatemp = icaweight * sbase;
        
    container = [container,pcatemp, nmftemp, icatemp'];  
end

colormap('gray');
imgs = reshape(container, 112, 92,[]);
vl_imarraysc(imgs, 'Layout', [length(dims),15]);
axis off;
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pni_recon_re','-pdf')

err = [];
for ii = 1:15:150
    temp = [];
    %pca
    for ipca= ii:1:ii+4
        cal = rem(ipca,5);
        if cal == 0
            cal = 5;
        end
        
        tar = test(:, cal);
        tar = reshape(tar, imgsize);
        temp = [temp, immse(imgs(:,:,ipca), tar)];    
    end
    
    for inmf = ii+5:1:ii+9
        cal = rem(inmf,5);
        if cal == 0
            cal = 5;
        end
        
        tar = test(:, cal);
        tar = reshape(tar, imgsize);
        temp = [temp, immse(imgs(:,:,inmf), tar)];   
    end
    
    for iica = ii+10:1:ii+14
        cal = rem(iica,5);
        if cal == 0
            cal = 5;
        end
        
        tar = test(:, cal);
        tar = reshape(tar, imgsize);
        temp = [temp, immse(imgs(:,:,iica), tar)];   
    end
    err = [err;temp];
end

figure(2)
colormap('hot');   % set colormap
imagesc(err);        % draw image and scale colormap to values range
col = colorbar;          % show color scale
grid on
axis off
title('MSE','FontSize', 20)
sdf(1, 'tk');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pni_rec_mse','-pdf')
