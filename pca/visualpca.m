% figure()
% test = eig(L);
% plot(test);
clear
opca()
figure()

imgsize = [112,92]; 
pick = data(:,15);

subplot(1,2,1);
ori = reshape(pick,imgsize);
imshow(ori,[]);

subplot(1,2,2);
w = pvector'*(pick-avg);
w = w./norm(w);
reconstr = pvector*w + avg;
reconstr = reshape(reconstr,imgsize);
imshow(reconstr,[]);
