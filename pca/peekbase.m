% draw last 30 faces

imgsize = [112,92]; 
[perc,avg,pvector,data,D] = opca(30);
for i = 0:29
    evalues = D(end-i,end-i);

    test = pvector(:,end-i);
    test = reshape(test,imgsize);
    
    subplot(5,6,i+1);imshow((test),[])
    title(num2str(evalues));
end
