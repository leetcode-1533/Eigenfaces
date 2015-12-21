imgsize = [112,92];
data = imagedata();
[w,h] = boardnmf(data  ,300,1);
peekbase(w,imgsize);