clear;  

imgsize = [112,92]; 

images  = imagedata(10, 10);
pick = imagedata(15,5);
pick = pick(:,5*10 + 1 : end); % pick person 11~ person 15, 5 images each

s =fastica(images', 'numOfIC', 80, 'displayMode', 'off', 'verbose', 'off');  
% x = A * s;
% peekbase(x', imgsize, 2, 1)

answer = pick' * pinv(s);
ant = answer * s;
peekbase(ant', imgsize, 1, 1);


