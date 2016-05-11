answer = [];
for resol = 0.4:0.1:1
    resol
    test = Crossvalid_basegen(resol);
    answer = [answer;test];
end