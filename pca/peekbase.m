% run ocpa.m first
imgsize = [112,92]; 
f = figure;
for i = 0:29
    figure(f);
    evalues = eig(L);
    test = pvector(:,end-i);
    test = reshape(test,imgsize);
    subplot(5,6,i+1);imshow((test),[])
    title(num2str(evalues(end-i)));
end
