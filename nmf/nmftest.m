clear;
imgsize = [112,92];

data = imagedata();
[w,h] = boardnmf(data,50,1);

for i = 1:50
    w(:,i) = w(:,i)./norm(w(:,i));
end

peekbase(w,imgsize);

figure();
sapimg = w*h(:,1);
sapimg = reshape(sapimg,imgsize);
imshow(sapimg,[]);

