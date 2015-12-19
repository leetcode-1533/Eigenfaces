function [avg,pvector,data] = opca(k)
% Calculate the most important vectors accroding to PCA princial
imgsize = [112,92]; 
data = imagedata();

avg = mean(data,2);
A = data - avg*ones(1, 400); % Centered at zero
L = A'*A;
[V,D] = eig(L);


eigenvalues = eig(L);
sum(eigenvalues(end-k+1:end))/sum(eigenvalues)
vector = V(:,end-k+1:end);
pvector = A*vector;

for i = 1:k
    pvector(:,i) = pvector(:,i)./norm(pvector(:,i));
end
return 