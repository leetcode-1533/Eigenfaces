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

[sbase, A, W] = fastica(inp, 'g', 'tanh', 'verbose', 'off');  
sbase = fastica(inp, 'g', 'tanh', 'initGuess', A, 'verbose', 'off');

% peekbase(inp', imgsize, 1, 3)
% peekbase(sbase', imgsize, 1, 3)

figure
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

figure;
subplot(3,3,1)
plot(S(1,1:1000));

subplot(3,3,2)
plot(S(2,1:1000));

subplot(3,3,3)
plot(S(3,1:1000));

subplot(3,3,4)
plot(inp(1,1:1000));

subplot(3,3,5)
plot(inp(2,1:1000));

subplot(3,3,6)
plot(inp(3,1:1000));

subplot(3,3,7)
plot(sbase(1,1:1000));

subplot(3,3,8)
plot(sbase(2,1:1000));

subplot(3,3,9)
plot(sbase(3,1:1000));

figure();
test1 = reshape(S', 112,92,[]);
test2 = reshape(sbase',112,92,[]);
test3 = reshape(inp', 112,92,[]);
ims = cat(3, test1, test3, test2);
colormap('gray')
vl_imarraysc(ims)