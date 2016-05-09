%%
clear
pls = [];
for imgratio = 0.4:0.1:1 
    ori_imgsize = [112,92]; 
    sam_image = imagedata2(1,1);
    sam_image = reshape(sam_image, ori_imgsize);
    imgsize = size(imresize(sam_image,imgratio));


    basedata = imagedata2_resol(1:40, 1:3, imgsize);  

    pl = sift_dim_resol(20, basedata, imgsize);
    pls = [pls;pl];
end

%%

figure(1)
hold on
for ii = 1 : length(0.4:0.1:1) 
    plot(pls(ii,:))
end
legend('Scale = 0.4','Scale = 0.5','Scale = 0.6','Scale = 0.7','Scale = 0.8','Scale = 0.9','Scale = 1.0');

sdf(1,'tk')
title('Number of Feature Points under different Scale using Image Interpolation')
xlabel('Image ID')
ylabel('Number of Feature Points')
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/sift_pl','-pdf')