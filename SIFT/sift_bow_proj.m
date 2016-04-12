function H = sift_bow_proj(peo, centers)
% peo is a single image

numClusters = 30;
if(centers ==0)
    centers= sift_bow(numClusters);
end

peo = im2single(peo./255);
peo = reshape(peo, imgsize);
[~,D] = vl_sift(peo);
D = single(D);

H = zeros(1, numClusters);
for i = 1:size(D,2)
  [~, k] = min(vl_alldist(D(:,i), centers));
  H(k) = H(k) + 1;
end

 


