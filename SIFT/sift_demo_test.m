clear
imgsize = [112,92]; 

test = imagedata2(3:3, 1:1);
test = test./255;
test = im2single(test);
test = reshape(test, imgsize);

[f, d] = vl_sift(test);
imshow(test, []);
h1 = vl_plotframe(f) ;

%% show Feature points

clear
imgsize = [112,92]; 

pic = [];

imgs = imagedata2(1:3, 1:3);
for ii = 1:size(imgs,2)
    test = imgs(:,ii);
    test = test./255;
    test = im2single(test);
    test = reshape(test, imgsize);
    [f, d] = vl_sift(test);
    imshow(test, []);
    h1 = vl_plotframe(f);
    
    pic_temp = getframe(gcf);
    
    pic = [pic,pic_temp.cdata(:)];
end

ori = [];
for ii = 1:size(imgs, 2)
    temp = reshape(imgs(:,ii),imgsize);
    ori(:,:,ii) = temp;
end

title('SIFT Detectors')
subplot(1,2,1);
title('Input Samples');
vl_imarraysc(ori);
grid off;
colormap('gray');

subplot(1,2,2);
title('SIFT Detectors')
pic_imgs = reshape(pic, 170,218,3,[]);
grid off;
vl_imarraysc(pic_imgs,'Layout',[3,3],'Spacing',0);


export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/sift_detectors','-pdf')



%% Dog On Database
samples = imagedata2(1:20, 1:10);
imgsize = [112,92]; 

ori = [];
cont = [];
for ii = 1:size(samples, 2)
    temp = reshape(samples(:,ii),imgsize);
    Jtemp = dog(temp);
    
    ori(:,:,ii) = temp;
    cont(:,:,ii) = Jtemp;  
end

figure(1)
subplot(1,2,1);
vl_imarraysc(ori,'Layout',[20,10]);
colormap('gray');
axis off
title('Original ORL database','Interpreter','latex');
set(gca,'fontsize', 21);

subplot(1,2,2);
vl_imarraysc(cont,'Layout',[20,10]);
colormap('gray');
axis off
title('DoG for $\sigma1=1$,$\sigma 2=2$','Interpreter','latex');
set(gca,'fontsize', 21);
sdf(1, 'tk');

export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/dog_demo','-pdf')

