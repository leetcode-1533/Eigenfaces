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

%% DCT On Database
samples = imagedata2(1:20, 1:10);
imgsize = [112,92]; 

ori = [];
cont = [];
for ii = 1:size(samples, 2)
    temp = reshape(samples(:,ii),imgsize);
    Jtemp = dog(temp);
    
    ori(:,:,ii) = temp;
    cont(:,:,ii) = Jtemp;  
end

figure(1)
subplot(1,2,1);
vl_imarraysc(ori,'Layout',[20,10]);
colormap('gray');
axis off
title('Original ORL database','Interpreter','latex');
set(gca,'fontsize', 21);

subplot(1,2,2);
vl_imarraysc(cont,'Layout',[20,10]);
colormap('gray');
axis off
title('DoG for $\sigma1=1$,$\sigma 2=2$','Interpreter','latex');
set(gca,'fontsize', 21);
sdf(1, 'tk');

export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/dog_demo','-pdf')

