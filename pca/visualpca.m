figure()
test = eig(L);
plot(test);

figure()
imgsize = [112,92]; 
pick = data(:,1);

subplot(1,2,1);
ori = reshape(pick,imgsize);
imshow(ori,[]);

subplot(1,2,2);
w= pvector'*pick;
reconstr = pvector*w;
reconstr = reshape(reconstr,imgsize);
imshow(reconstr,[]);
