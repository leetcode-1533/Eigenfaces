intern = 1:9;
basesize = 5:5:100;
% basesize = 10:5:15;

[xloc, yloc] = meshgrid(intern, basesize);
PCA = [];
NMF = [];
ICA = [];
DCTPCA = [];
DCTICA = [];
for iterbase = basesize
    pni_od = svm_original_dct_scanner(intern, iterbase);
    PCA = [PCA, pni_od(:, 1)];
    NMF = [NMF, pni_od(:, 2)];
    ICA = [ICA, pni_od(:, 3)];
    DCTPCA = [DCTPCA, pni_od(:, 4)];
    DCTICA = [DCTICA, pni_od(:, 5)];
end
% mesh(xloc, yloc, PCA);
    
    