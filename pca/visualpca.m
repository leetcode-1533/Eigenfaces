%% Draw eigenvalues
% DESCRIPTIVE TEXT
function visualpca(xloc,L)
    figure();
    test = eig(L);
    plot(test);
    x = [xloc,xloc];
    y = [0,max(test)];
    hold on ;
    plot(x,y);
end
%% 

