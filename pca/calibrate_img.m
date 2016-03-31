function im = calibrate_img(im, imgsize)

    im = im2single(im./255);
    im = reshape(im, imgsize);
   