clear
imgsize = [112,92]; 
data = imagedata();

avg = mean(data,2);
A = data - avg*ones(1, 400);
L = A'*A;
[V,D] = eig(L);

pvector = zeros(imgsize(1)*imgsize(2),30);
for i = 0:29
    ptemp = V(:,end-i);
    pvector(:,i+1) = A*ptemp;
end


