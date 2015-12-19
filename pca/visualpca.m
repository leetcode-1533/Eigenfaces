% figure()
% test = eig(L);
% plot(test);

for k = 1:40:400
    pause
    [perc, avg,pvector,data] = opca(k);
    figure()
    
    imgsize = [112,92]; 
    pick = data(:,2);

    subplot(1,2,1);
    ori = reshape(pick,imgsize);
    imshow(ori,[]);

    subplot(1,2,2);
    w = pvector'*(pick-avg);
    reconstr = pvector*w +avg;
    reconstr = reshape(reconstr,imgsize);
    imshow(reconstr,[]);
    title(perc)
end