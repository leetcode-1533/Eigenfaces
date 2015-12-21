% Plot different people's face
clear;
imgsize = [112,92];

data = imagedata(40,3);
[w,h] = boardnmf(data,80,0);

for i = 1:80
    w(:,i) = w(:,i)./norm(w(:,i));
end

wpinv = pinv(w);

% Selete new test data 
% different people
testdata = imagedata(6,4);
testdata = testdata(:,1:4:end);
peekbase(testdata,imgsize,3,2);

figure()
hold on
legend()
for i = 1: 6
    weight = wpinv*testdata(:,i);
    reconstr(:,i) = w*weight; 
    plot(weight);
end

peekbase(reconstr,imgsize,3,2);

% Same people, different perspective

testdata = imagedata(1,6);
peekbase(testdata,imgsize,3,2);

figure()
hold on
legend()
for i = 1: 6
    weight = wpinv*testdata(:,i);
    reconstr(:,i) = w*weight; 
    plot(weight);
end

peekbase(reconstr,imgsize,3,2);
