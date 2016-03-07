function peekbase(w,imgsize,x,y)
% Show base image
f = figure;
for i = 1:x*y
    figure(f);
    
    test = w(:, i);
    if(mean(test) < 0)
        test = -test;
    end
    
    tk = mapminmax(test);
    tk = reshape(tk,imgsize);
    subplot(x,y,i);
    imshow(tk, [])
end
