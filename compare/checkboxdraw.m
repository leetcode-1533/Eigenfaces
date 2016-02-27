function f = checkboxdraw(table)
f = figure();
updowntable = flipud(table);
tabc = [[updowntable zeros(size(updowntable,1),1)]; zeros(1, size(updowntable, 2) + 1)];
pcolor(tabc)
colorbar