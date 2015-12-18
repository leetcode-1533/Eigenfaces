clear
data = imagedata();

avg = mean(data,2);
A = data - avg*ones(1, 400);

L = A'*A;
[V,D] = eig(L);

principal = V(:,end);
principal = A*principal;


