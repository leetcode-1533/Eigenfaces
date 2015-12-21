% figure()
% test = eig(L);
% plot(test);

for k = 1:40:400
    [perc, avg,pvector,data] = opca(k);
    f = figure();
    
    imgsize = [112,92]; 
    pick = data(:,2);

    subplot(1,3,1);
    ori = reshape(pick,imgsize);
    imshow(ori,[]);

    subplot(1,3,2);
    w = pvector'*(pick-avg);
    reconstr = pvector*w +avg;
    reconstr = reshape(reconstr,imgsize);
    imshow(reconstr,[]);
    title(perc)
    subplot(1,3,3)
    plot(w)
end