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
% peekbase(wronginput, imgsize, 9, 1)
dct_peekbase(comp, imgsize, length(windex), 2)