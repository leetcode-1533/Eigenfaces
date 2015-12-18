stat = statset('UseParallel',true);
[w,h] = nnmf(database,40,'options',stat);
dir = 'att_faces';
pdir = 's1';
for i = 1:10
    imgname = [num2str(i),'.pgm'];
    imgpath = fullfile(dir,pdir,imgname);
    img = double(imread(imgpath));
    coe = img(:)\w;
    imshow(reshape(w*coe',imgsize),[]);
    pause
end
    
