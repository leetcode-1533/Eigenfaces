imgsize = [112,92]; 
f = figure;
for i = 1:30
    figure(f);
    test = pvector(:,i);
    test = reshape(test,imgsize);
    subplot(5,6,i);imshow((test),[])
    title(num2str(pvalue(i)))
end
