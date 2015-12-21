function database = imagedata()
% Generate Image database
dir = '~/Dropbox/att_faces';
people = 1:40;
subpeople = 1:10;
imgsize = [112,92];

database = zeros(imgsize(1)*imgsize(2),length(people)*length(subpeople));

for i = people
    for j = subpeople
        people_dir = strcat('s',num2str(i));
        image = strcat(num2str(j),'.pgm');
        f = fullfile(dir,people_dir,image);

        img = double(imread(f));
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