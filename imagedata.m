clear;
dir = 'att_faces';
people = 1:40;
splitsize = 20;
image = '1.pgm';
imgsize = [112,92];
database = zeros(112*92,length(people));

for i = people
    people_dir = strcat('s',num2str(i));
    f = fullfile(dir,people_dir,image);
    img = double(imread(f));
    database(:,i) = img(:);
end

% img = reshape(img,[112,92]);
% imshow(database,[])

%%% apply NMF
% [w,h] = seung(database,20);
% 
% test_img = reshape(w(:,1),size);
% imshow(test_img,[]);
for i = 1:8
    fprintf('***Compression Rate 0.%d***\n',i);
    [w,h] = boardnmf(database,ceil(0.1*i*imgsize(1)*imgsize(2)),1);
    peekbase(w,imgsize,['compressionperc',num2str(i)]);
    clearvars w h
end