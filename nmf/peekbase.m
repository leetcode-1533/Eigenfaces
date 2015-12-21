function peekbase(w,imgsize,x,y)
f = figure;
for i = 1:x*y
    figure(f);
    test = w(:,i);
    test = reshape(test,imgsize);
    subplot(x,y,i);imshow(imcomplement(test),[])
end
