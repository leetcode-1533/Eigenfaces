% Decomposion using NMF
% Show base image
% Project new faces

clear;
imgsize = [112,92];

data = imagedata2(1:40,1:3);

[w,h,temp] = boardnmf(data,64,1);

% Normalization
for i = 1:64
    w(:,i) = w(:,i)./norm(w(:,i));
end

% Show base image
% show top 40 featured faces
% peekbase(w,imgsize,10,8);

% Project new faces
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
