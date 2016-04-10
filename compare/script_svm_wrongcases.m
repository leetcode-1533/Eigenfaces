%% Choose between Original and DCT
% original
inputcase = predicted_labeln;
windex = find( inputcase - test_label ~= 0 );
test_label(windex);
svmoutput  = inputcase(windex);
wronginput = test_people(:, windex);
svmwrongout = imagedata2(svmoutput,1); 
comp = [];

display('original, supposed');
compare_array = [test_label(windex),svmoutput]'

for i = 1:length(windex)
    comp = [comp,wronginput(:, i )];  
end


for i = 1:length(windex)
    comp = [comp,svmwrongout(:,i)];  
end


compict = reshape(comp, 112, 92, []);
colormap('gray');
vl_imarraysc(compict, 'Layout', [2, size(compict,3)/2])
axis off
title('NMF-SVM Wrong Case, Learning samples 90%, Basesize 40');
export_fig('/Users/y1275963/Dropbox/thesis/Img/fig/svm_wrong','-pdf')


% % dct
% inputcase = dctpredicted_labelp;
% windex = find( inputcase - test_label ~= 0 );
% 
% dct_test_people(windex)
% svmoutput  = inputcase(windex)
% 
% wronginput = dct_test_people(:, windex);
% svmwrongout = dct_imagedata(svmoutput,1); 
% 
% comp = [];
% for i = 1:length(windex)
%     comp = [comp,wronginput(:, i ), svmwrongout(:,i)];  
% end
% dct_peekbase(comp, imgsize, length(windex), 2)