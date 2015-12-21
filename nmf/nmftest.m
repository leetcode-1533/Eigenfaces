clear;
imgsize = [112,92];

data = imagedata(40,3);
[w,h] = boardnmf(data,80,1);

for i = 1:80
    w(:,i) = w(:,i)./norm(w(:,i));
end
% show top 40 featured faces
peekbase(w,imgsize,10,8);

person_pick = 5;
figure();
subplot(1,2,1);
ori_p = h(:,person_pick)./norm(h(:,person_pick));
sapimg = w*ori_p;
sapimg = reshape(sapimg,imgsize);
imshow(sapimg,[]);

subplot(1,2,2);
pick = data(:,person_pick);
newh = pinv(w)*pick;
newh = newh./norm(newh);
reconstr = w*newh;
reconstr = reshape(reconstr,imgsize);
imshow(reconstr,[]);

figure()
hold on
plot(ori_p,'r');
plot(newh,'b');
legend('original','projection');
