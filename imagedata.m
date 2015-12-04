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
clear;
img = double(imread('cameraman.tif'));
imgsize = size(img);
splitsize = imgsize(2)/2;
people = imgsize(2);

winit = zeros(imgsize(1),splitsize);
% hinit = zeros(splitsize,length(people));
hinit = zeros(splitsize,(people));
tol = 0.1;
timelimit = 20;
maxiter = 100000;

% [w,h] = nmf(database,winit,hinit,tol,timelimit,maxiter);
[w,h] = nmf(img,winit,hinit,tol,timelimit,maxiter);