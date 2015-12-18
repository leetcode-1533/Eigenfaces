function peekbase(w,filename)
imgsize = [112,92]; 
f = figure;
for i = 1:30
    figure(f);
    test = w(:,i);
    test = reshape(test,imgsize);
    subplot(5,6,i);imshow((test),[])
end

% saveas(gcf, filename, 'bmp')