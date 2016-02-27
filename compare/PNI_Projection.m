function [pcaweight, nmfweight, icaweight] = PNI_Projection(pvector, pcaavg, nmfbase, icabase, pick)
for i = 1 : size(pick,2)
    pcaweight(:, i) = pvector'*(pick(:, i)-pcaavg);
end

nmfweight = nmfbase*pick; % related individual image weight

icaweight = pick' * icabase; % related individual image weight
icaweight = icaweight';