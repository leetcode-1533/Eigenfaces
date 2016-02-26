clear;  

imgsize = [112,92]; 

images  = imagedata(10,10);

[A, W]=fastica(images', 'numOfIC', 9, 'displayMode', 'off', 'verbose', 'off');  
s = W * images';
 x = A * s;
 peekbase(x', imgsize, 3, 3)