clear;

imgsize = [112,92]; 
im1 = imread('im1.png');
im1 = imresize(im1, imgsize);
im2 = imread('im2.png');
im2 = imresize(im2, imgsize);
im3 = imread('im3.png');
im3 = imresize(im3, imgsize);
S = [double(im1(:)), double(im2(:)), double(im3(:))]';

% I1= im2double(imread ('input1.jpg'));          
% I2= im2double(imread ('input2.jpg')); 
% I3= im2double(imread ('input3.jpg')); 
% imgsize = size(I1); 
% S = [I1(:), I2(:), I3(:)]';
 
tm=rand(size(S,1));              
inp=tm*S;    

sbase = fastica(inp, 'g', 'tanh', 'verbose', 'off');  
% 
% peekbase(inp', imgsize, 1, 3)
% peekbase(sbase', imgsize, 1, 3)


for ii = 1:3
    test = S(ii, :);
    if(mean(test) < 0)
        test = -test;
    end

    tk = mapminmax(test);
    tk = reshape(tk, imgsize);
    subplot(3, 3, ii)
    imshow(tk, []);
end

for ii = 1:3
    test = inp(ii, :);
    if(mean(test) < 0)
        test = -test;
    end

    tk = mapminmax(test);
    tk = reshape(tk, imgsize);
    subplot(3, 3, ii + 3)
    imshow(tk, []);
end

for ii = 1:3
    test = sbase(ii, :);
    if(mean(test) < 0)
        test = -test;
    end

    tk = mapminmax(test);
    tk = reshape(tk, imgsize);
    subplot(3, 3, ii + 6)
    imshow(tk, []);
end