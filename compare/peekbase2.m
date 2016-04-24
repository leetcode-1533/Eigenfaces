function peekbase2(base)

figure()
base = reshape(base, 112, 92, []);
vl_imarraysc(base)
colormap('gray');
grid on
axis off
title('RCA Base')
sdf(1, 'tk');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/rca_base','-pdf')
