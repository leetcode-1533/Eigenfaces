function peekbase(w,imgsize,x,y)
% Show base image
% imgsize = [112,92]; 
f = figure;
for i = 1:x*y
    figure(f);
    test = w(:,i);
    test = reshape(test,imgsize);
    subplot(x,y,i);imshow(test,[])
end
