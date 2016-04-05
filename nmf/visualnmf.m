% Draw faces, recovered face, and their weight plot
data = imagedata2(1:40,1:3);
pick = data(:,2);
imgsize = [112,92]; 

for k = 101:10:120
    [w,h] = boardnmf(data,k,0);
    for i = 1:k
        w(:,i) = w(:,i)./norm(w(:,i));
    end
    f = figure();
    
    subplot(1,3,1);
    ori = reshape(pick,imgsize);
    imshow(ori,[]);

    subplot(1,3,2);
    wpinv = pinv(w);
    weight = wpinv*pick;
    reconstr = w*weight; 
    reconstr = reshape(reconstr,imgsize);
    imshow(reconstr,[]);
    title(['Dimension',num2str(k)])
    
    subplot(1,3,3)
    plot(weight)
    pause()
%     saveas(f,[num2str(k),'.png']);
end