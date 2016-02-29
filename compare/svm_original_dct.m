function answer = svm_original_dct(n, basesize)
% do a comparsion in between dct and original

% n = 8; % ratio adjustable
% basesize: project size per method, less than 120 
numofpeople = 40;
numofperspective = 10;
imgsize = [112,92];

% read in data
train_people = zeros(imgsize(1) * imgsize(2), n * numofpeople);
train_label = zeros(n * numofpeople , 1);
test_people = [];
test_label = [];

dct_train_people = zeros(imgsize(1) * imgsize(2), n * numofpeople);
dct_train_label = zeros(n * numofpeople , 1);
dct_test_people = [];
dct_test_label = [];

for i = 1 : numofpeople
    trs = randperm(numofperspective);
 
    train_people(:, ((i - 1) * n + 1) : i * n)  = imagedata2(i, trs(1 : n));
    train_label(((i - 1) * n + 1) : i * n,  1) =  repmat(i, n, 1);
    test_people = [test_people, imagedata2(i, trs(n+1 : numofperspective))];
    test_label = [test_label; repmat(i, numofperspective - n, 1)];
    
    dct_train_people(:, ((i - 1) * n + 1) : i * n)  = dct_imagedata(i, trs(1 : n));
    dct_train_label(((i - 1) * n + 1) : i * n,  1) =  repmat(i, n, 1);   
    dct_test_people = [dct_test_people, dct_imagedata(i, trs(n+1 : numofperspective))];
    dct_test_label = [dct_test_label; repmat(i, numofperspective - n, 1)];

end

% shuffle
perm1 = randperm(size(dct_train_people,2));
train_people = train_people(:, perm1);
train_label = train_label(perm1);
dct_train_people = dct_train_people(:, perm1);
dct_train_label = dct_train_label(perm1);

perm2 = randperm(size(dct_test_people,2));
test_people = test_people(:, perm2);
test_label = test_label(perm2);
dct_test_people = dct_test_people(:, perm2);
dct_test_label = dct_test_label(perm2);

nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
[pvector, pavg, wpinv, inv_sbase] = PNI_Base(nmfdata, basesize); % Original
argcell = {pvector, pavg, wpinv, inv_sbase};

dct_nmfdata = dct_imagedata(1:20,1:6); % triaing sets: adjustable
[pvector, pavg, inv_sbase] = PI_Base(dct_nmfdata, basesize); % SVM
svm_argcell = {pvector, pavg, inv_sbase};


[ori, ~, ~, ~] = svmcomp(train_people, train_label, test_people, test_label, argcell);
[dct, ~, ~] = dct_svmcomp(dct_train_people, dct_train_label, dct_test_people, dct_test_label, svm_argcell);

answer = [ori, dct];

