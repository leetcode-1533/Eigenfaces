reg = recs;
for ii = 1 : 30
    differ(:, ii) = reg(:, ii) - pick;
    squdiffer(:, ii) = differ(:, ii).^2;
    meansqudiffer(ii) = sum(squdiffer(:, ii)) / numel(pick);
end

    