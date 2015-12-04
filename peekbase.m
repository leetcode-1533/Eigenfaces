for i = 1:40
    test = w(:,i);
    test = reshape(test,imgsize);
    subplot(5,8,i);imshow(imcomplement(test),[])
end