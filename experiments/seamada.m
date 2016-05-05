function img = seamada(image, img_size)

% size_img = imresize(image, scale,'nearest');
% img_size = size(size_img);

img_size_origial = size(image);
img_size_diff = img_size_origial - img_size;

h_img = seamcarving(image, img_size_diff(2));
img = seamcarving(h_img', img_size_diff(1));

img = img';

