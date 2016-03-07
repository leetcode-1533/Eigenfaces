% Deprecated
%% Choose between Original and DCT
% original
inputcase = predicted_labeln;
windex = find( inputcase - test_label ~= 0 );
test_label(windex)
svmoutput  = inputcase(windex)
wronginput = test_people(:, windex);
svmwrongout = imagedata2(svmoutput,1); 
comp = [];
for i = 1:length(windex)
    comp = [comp,wronginput(:, i ), svmwrongout(:,i)];  
end
% peekbase(wronginput, imgsize, 9, 1)
peekbase(comp, imgsize, length(windex), 2)

% dct
inputcase = dctpredicted_labelp;
windex = find( inputcase - test_label ~= 0 );

dct_test_people(windex)
svmoutput  = inputcase(windex)

wronginput = dct_test_people(:, windex);
svmwrongout = dct_imagedata(svmoutput,1); 

comp = [];
for i = 1:length(windex)
    comp = [comp,wronginput(:, i ), svmwrongout(:,i)];  
end
dct_peekbase(comp, imgsize, length(windex), 2)