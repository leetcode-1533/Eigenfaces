clear;  

imgsize = [112,92]; 

images  = imagedata2(1:40, 1:10);
s =fastica(images', 'numOfIC', 64, 'verbose', 'off');  

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


test = imagedata(15,5);
test = test(:,5*10 + 1 : end); % pick person 11~ person 15, 5 images each
answer = test' * pinv(s);
ant = answer * s;
peekbase(ant', imgsize, 5, 5);


