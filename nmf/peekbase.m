function peekbase(w,imgsize)
f = figure;
for i = 1:40
    figure(f);
    test = w(:,i);
    test = reshape(test,imgsize);
    subplot(5,8,i);imshow(imcomplement(test),[])
end
