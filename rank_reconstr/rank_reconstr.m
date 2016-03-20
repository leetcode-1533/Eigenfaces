clear
% Base Creation : Most Time consuming
nmfdata = imagedata2(1:20,1:6); % triaing sets: adjustable
[pvector, pavg, wpinv, inv_sbase] = PNI_Base(nmfdata, 30); % Original