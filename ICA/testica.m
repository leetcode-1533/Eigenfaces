clear;  

imgsize = [112,92]; 

images = imagedata(5,5);

Z=fastica(images', 'numOfIC', 30);  
peekbase(Z', imgsize, 10,3);


