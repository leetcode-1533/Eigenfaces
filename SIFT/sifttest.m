clear
imgsize = [112,92]; 

test = imagedata2(3:3, 1:1);
test = test./255;
test = im2single(test);
test = reshape(test, imgsize);

[f, d] = vl_sift(test);
imshow(test, []);
% h1 = vl_plotframe(f) ;
% h2 = vl_plotframe(f) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;
perm = randperm(size(f,2));
sel = perm(1:10);

h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel));
set(h3,'color','g');


test2 = imagedata2(1:1, 1:1);
test2 = test2./255;
test2 = im2single(test2);
test2 = reshape(test2, imgsize);
[newf, newd] = vl_sift(test2, 'frames', f,'orientations');
% 
figure();
imshow(test2, []);
h2 = vl_plotframe(newf);
h3 = vl_plotsiftdescriptor(newd(:,sel),newf(:,sel));
set(h3,'color','g');
