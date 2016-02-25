clear;  

imgsize = [112,92]; 

images = imagedata(5,5);

Z=fastica(images', 'numOfIC', 30, 'displayMode', 'off', 'verbose', 'off');  
peekbase(Z', imgsize, 10,3);


