imgsize = [112,92];

basedata = imagedata2(1:40, 1:3);
test1 = imagedata2(1, 1);
test2 = imagedata2(1, 10);

i2 = imread('/Users/y1275963/Pictures/images-1.jpg');
i2 = rgb2gray(i2);
i2 = imresize(i2,imgsize);
test3 = double(i2);

im1 = imread('im1.png');
im1 = imresize(im1, imgsize);
test4 = double(i2);
test = [test1, test2, test3(:), test4(:)];

container = [];

dims = 1:10:100;
for k = dims
    [pvector, pavg, w, sbase] = PNI_Base_uninv(basedata, k);
    wpinv = pinv(w); % nmf craeted weight
    inv_sbase = pinv(sbase); % ica created weight

    [pcaweight, nmfweight, icaweight] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, test);
    
    pcatemp = pvector*pcaweight;
    for ii = 1:size(test,2)
        pcatemp(:,ii) = pcatemp(:,ii) + pavg;
    end
    
    nmftemp = w*nmfweight;
    
    icatemp = sbase * icaweight;
    
    container = [container,pcatemp, nmftemp, icatemp];  
end

colormap('gray');
imgs = reshape(pvector, 112, 92,[]);
vl_imarraysc(imgs, 'Layout', [length(dims), 4]);