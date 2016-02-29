function f = checkboxdraw(table)

f = figure();
hold on
updowntable = flipud(table);
tabc = [[updowntable zeros(size(updowntable,1),1)]; zeros(1, size(updowntable, 2) + 1)];
pcolor(tabc)
colorbar
colormap(gray);
view(280, 33)
% caxis([0.7, 1]);