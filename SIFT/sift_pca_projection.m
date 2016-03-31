test = imgs(:, end);
test = calibrate_img(test, imgsize);
peo_patch = sift_patches(test);

for ii = 1 : size(peo_patch, 2)
    pcaweight(:, ii) = pvector'*(peo_patch(:, ii) - avg);
end