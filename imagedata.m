clear;
dir = 'att_faces';
people = 1:40;
image = '1.pgm';
database = zeros(112*92,length(people));

for i = people
    people_dir = strcat('s',num2str(i));
    f = fullfile(dir,people_dir,image);
    img = double(imread(f));
    database(:,i) = img(:);
end

img = reshape(img,[112,92]);
imshow(database,[])

