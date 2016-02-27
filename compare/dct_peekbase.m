function peekbase(w,imgsize,x,y)
% Show base image
f = figure;
for i = 1:x*y
    figure(f);
    test = w(:,i);
    test = reshape(test,imgsize);
    test = idct2(test);
    subplot(x,y,i);imshow(test,[])
end
