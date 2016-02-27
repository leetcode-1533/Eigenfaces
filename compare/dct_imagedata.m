function database = dct_imagedata(pep,epep)
% Generate Image database
% Imagedata2 support range selction, instead of starting from 1
dir = '~/Dropbox/att_faces';
people = pep;
subpeople = epep;
imgsize = [112,92];

database = zeros(imgsize(1)*imgsize(2),length(people)*length(subpeople));

% indexi = people - (people(1) - 1);
% indexj = subpeople - (subpeople(1) - 1);

for i = 1 : length(people)
    for j = 1 : length(subpeople)
       
        indi = people(i);
        indj = subpeople(j);
        
        people_dir = strcat('s',num2str(indi));
        image = strcat(num2str(indj),'.pgm');
        f = fullfile(dir,people_dir,image);

        img = double(imread(f));
        img = dct2(img);
        database(:,(i-1)*length(subpeople)+j) = img(:);
    end
end

% img = reshape(img,[112,92]);
% imshow(database,[])

% 
% for i = 1:8
%     fprintf('***Compression Rate 0.%d***\n',i);
%     [w,h] = boardnmf(database,ceil(0.1*i*imgsize(1)*imgsize(2)),1);
%     peekbase(w,imgsize,['compressionperc',num2str(i)]);
%     clearvars w h
% end