data = imagedata2(1:40, 1:10);
imgsize = [112,92]; 
[perc, avg, pvector, eigenvalues] = opca(64, data);

pvector = fliplr(pvector);
patches = reshape(pvector, 112, 92,[]);
vl_imarraysc(patches);
colormap('gray');

pick = data(:,1);
w = pvector'*(pick-avg);
reconstr = pvector*w +avg;



