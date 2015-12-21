% Plot different people's face
clear;
imgsize = [112,92];

[perc,avg,pvector,data,~] = opca(80);

wpinv = pvector';

% Selete new test data 
% different people
testdata = data(:,5:10:end);
peekbase(testdata,imgsize,3,2);

figure()
hold on
legend()
for i = 1: 6
    weight = pvector'*(testdata(:,i)-avg);
    reconstr(:,i) = pvector*weight+avg;
    plot(weight);
end

peekbase(reconstr,imgsize,3,2);

% Same people, different perspective
testdata = data(:,1:1:10);
peekbase(testdata,imgsize,3,2);

figure()
hold on
legend()
for i = 1: 6
    weight = pvector'*(testdata(:,i)-avg);
    reconstr(:,i) = pvector*weight+avg;
    plot(weight);
end

peekbase(reconstr,imgsize,3,2);
