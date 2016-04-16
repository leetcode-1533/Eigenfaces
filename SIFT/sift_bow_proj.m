function H = sift_bow_proj(peo, centers)
% peo is a single image

if(centers ==0)
    numClusters = 30;
    centers= sift_bow(numClusters);
else
    numClusters = size(centers,2);
end

[~,D] = vl_sift(peo);
D = single(D);

H = zeros(1, numClusters);
for i = 1:size(D,2)
  [~, k] = min(vl_alldist(D(:,i), centers));
  H(k) = H(k) + 1;
end

 


