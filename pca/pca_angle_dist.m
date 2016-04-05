dis_mat = pdist2(pvector', pvector','correlation');
dis_mat = 1-dis_mat;
 colormap('hot');   % set colormap
 imagesc(dis_mat);        % draw image and scale colormap to values range
 colorbar;          % show color scale
 grid on
 set(gca,'Xcolor',[0.5 0.5 0.5]);
set(gca,'Ycolor',[0.5 0.5 0.5]);