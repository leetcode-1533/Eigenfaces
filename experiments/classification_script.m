basedata = imagedata2(1:40,1:3);  
testdata = imagedata2(1:40, 1:10);

[pvector, pavg, wpinv, inv_sbase] = PNI_Base(basedata, 64);
[train_p, train_n, train_i] = PNI_Projection(pvector, pavg, wpinv, inv_sbase, testdata);

label = repmat(1:40,10,1);
label = label(:);

class_data = [train_p', label];