%% Compress image
clear
nimgsize = [4, 5];
imgsize = [112,92];

testdata = imagedata2(1:40, 1:10);

for ii = 1:size(testdata,2)
    peo = testdata(:, ii);
    peo = reshape(peo, imgsize);
    peo = imresize(peo, nimgsize);
    ntestdata(:,ii) = peo(:);
end
    

label = repmat(1:40,10,1);
label = label(:);

class_data = [ntestdata', label];

%% RCA
testdata = imagedata2(1:40, 1:10);
rcabase = rand(64,10304);
rcaproj = rcabase * testdata;

label = repmat(1:40,10,1);
label = label(:);

class_data = [rcaproj', label];

%% Pure Random
label = repmat(1:40,10,1);
label = label(:);
class_data = [rand(400,64), label];

%% Results
rca = [17.2, 17, 8.8, 9.5, 16.8, 20.8, 23.5, 31.5, 16.5, 17.5, 14.2, 24, 14.8, 7.5, 42, 15.5, 23.8, 18.5, 20.2, 91.2, 24, 18.2];
res_img = [63.2, 37.2, 9.5, 84, 89.5, 89.8, 93, 93, 44.2, 95.2, 51, 96.5, 66.8, 9.8, 66, 66.2, 94, 71.5, 90, 95, 97.5, 58.2];
ran_feat = [2.5, 3.5, 2, 7.8, 3.8, 3.5, 4.2, 3.8, 1.8, 3.2, 3.5, 1.8, 2, 2.8, 2, 2, 2.2, 2, 3, 2.5, 2.2, 2.2];
res = [ran_feat;rca;res_img];

figure(1)
hold on
grid on

% pplot = stem(1:22, pcare, 'r', 'LineWidth', 5);
% nplot = stem(1:22, nmfre, 'g', 'LineWidth', 3);
% iplot = stem(1:22, icare, 'b');

bar(res');

title('Classifiers Performances(For Reference)');
xlabel('Classifiers ID');
ylabel('Accurancy');

ax = gca;
ax.XTick = 1:1:22;

legend('Random Features', 'RCA', 'Resized Image');
sdf(1, 'tk');

export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/pni_res_ref','-pdf')