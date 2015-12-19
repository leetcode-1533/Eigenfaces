imgsize = [112,92]; 
f = figure;
for i = 0:29
    figure(f);
    test = pvector(:,end-i);
    test = reshape(test,imgsize);
    subplot(5,6,i+1);imshow((test),[])
end
