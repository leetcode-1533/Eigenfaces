%% Dataset
clear

basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);

[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);
[train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, testdata);

label = repmat(1:40,10,1);
label = label(:);


%% Original 
basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);
[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);

% Original data generator
numofpeople = 40;
numofperspective = 10;
n = 9; % ratio adjustable
imgsize = [112,92];

train_people = zeros(imgsize(1) * imgsize(2), n * numofpeople);
train_label = zeros(n * numofpeople , 1);
test_people = [];
test_label = [];

for i = 1 : numofpeople
    trs = randperm(numofperspective);
 
    train_people(:, ((i - 1) * n + 1) : i * n)  = imagedata2(i, trs(1 : n));
    train_label(((i - 1) * n + 1) : i * n,  1) =  repmat(i, n, 1);
    test_people = [test_people, imagedata2(i, trs(n+1 : numofperspective))];
    test_label = [test_label; repmat(i, numofperspective - n, 1)];
    
end
%
[train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, train_people);
[test_p, test_n, test_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, test_people);

train = train_p;
test = test_p;
[re_train_p, ps] = mapminmax(train); 
re_test_p = mapminmax.apply(test,ps);
model = svmtrain(train_label, re_train_p');
[predicted_labelp, accurp, ~] = svmpredict(test_label, re_test_p', model);