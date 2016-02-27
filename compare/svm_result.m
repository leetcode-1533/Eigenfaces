n = 8; % ratio adjustable
numofpeople = 40;
numofperspective = 10;
imgsize = [112,92];

% read in data

dct_train_people = zeros(imgsize(1) * imgsize(2), n * numofpeople);
dct_train_label = zeros(n * numofpeople , 1);
dct_test_people = [];
dct_test_label = [];

for i = 1 : numofpeople
    trs = randperm(numofperspective);
    dct_train_people(:, ((i - 1) * n + 1) : i * n)  = dct_imagedata(i, trs(1 : n));
    dct_train_label(((i - 1) * n + 1) : i * n,  1) =  repmat(i, n, 1);
    
    dct_test_people = [dct_test_people, dct_imagedata(i, trs(n+1 : numofperspective))];
    dct_test_label = [dct_test_label; repmat(i, numofperspective - n, 1)];
end

% shuffle
perm1 = randperm(size(dct_train_people,2));
dct_train_people = dct_train_people(:, perm1);
dct_train_label = dct_train_label(perm1);

perm2 = randperm(size(dct_test_people,2));
dct_test_people = dct_test_people(:, perm2);
dct_test_label = dct_test_label(perm2);
    
dct_svmcomp(dct_train_people, dct_train_label, dct_test_people, dct_test_label, 30)
