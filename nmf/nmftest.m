clear;
imgsize = [112,92];

data = imagedata(40,3);
[w,h] = boardnmf(data,80,1);

for i = 1:80
    w(:,i) = w(:,i)./norm(w(:,i));
end

peekbase(w,imgsize);

person_pick = 5;
figure();
subplot(1,2,1);
sapimg = w*h(:,person_pick);
sapimg = reshape(sapimg,imgsize);
imshow(sapimg,[]);

subplot(1,2,2);
pick = data(:,person_pick);
newh = pinv(w)*pick;
reconstr = w*newh;
reconstr = reshape(reconstr,imgsize);
imshow(reconstr,[]);

