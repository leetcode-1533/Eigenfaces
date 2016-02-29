function bar3plot(vari)
    bar3(vari);

    tick = get(gca,{'XTick','YTick'});
    x = linspace(5, 100,length(tick{1}));
    y = linspace(1, 9,length(tick{2}));
    set(gca,'XTickLabel',x)
    set(gca,'YTickLabel',y)
    view(230, 33)
