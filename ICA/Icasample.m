clear;  

imgsize = [112,92]; 

images  = imagedata(10, 10);
test = imagedata(15,5);
test = test(:,5*10 + 1 : end); % pick person 11~ person 15, 5 images each

s =fastica(images', 'numOfIC', 80, 'displayMode', 'off', 'verbose', 'off');  

% x = A * s;
% peekbase(x', imgsize, 2, 1)
for ii = 1 : 80
    pick = s(ii, :);
    maxpick = max(pick);
    minpick = min(pick);
    avgpick = mean(pick);
    
    if(abs(avgpick - maxpick) > abs(avgpick - minpick))
        s(ii, :) = -pick;
    end

end

answer = test' * pinv(s);
ant = answer * s;
peekbase(ant', imgsize, 5, 5);


