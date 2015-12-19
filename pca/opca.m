clear
% Calculate the most important vectors accroding to PCA princial
imgsize = [112,92]; 
data = imagedata();

avg = mean(data,2);
A = data - avg*ones(1, 400); % Centered at zero
L = A'*A;
[V,D] = eig(L);


eigenvalues = eig(L);
sum(eigenvalues(end-99:end))/sum(eigenvalues)
vector = V(:,end-99:end);
pvector = A*vector;

for i = 1:100
    pvector(:,i) = pvector(:,i)./norm(pvector(:,i));
end
    