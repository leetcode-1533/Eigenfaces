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