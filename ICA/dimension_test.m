% Draw faces, recovered face, and their weight plot
images = imagedata(10, 10);
pick = images(:, 1);
imgsize = [112,92]; 

for k = 1:40:400

    sbase = fastica(images', 'numOfIC', k, 'displayMode', 'off', 'verbose', 'off');  
    
    for ii = 1 : k
        reversev = sbase(:, ii);
        maxpick = max(reversev);
        minpick = min(reversev);
        avgpick = mean(reversev);

        if(abs(avgpick - maxpick) > abs(avgpick - minpick))
            sbase(:, ii) = -reversev;
        end
    end
    
    f = figure();
    
    subplot(1,3,1);
    ori = reshape(pick,imgsize);
    imshow(ori,[]);

    subplot(1,3,2);
    w = pick' * pinv(sbase);
    reconstr = w * sbase;
    reconstr = reshape(reconstr,imgsize);
    
    imshow(reconstr,[]);
%     title(perc)
    subplot(1,3,3)
    plot(w)
    saveas(f,[num2str(k),'.png']);
    
    
end