[t1,t2,t3,t4,t5] = textread('iris.data','%f%f%f%f%s','delimiter',',');
data = [t1,t2,t3,t4];
group = zeros(150,1);
for i = 1 : length(group)
    if strcmp(t5{i,1},'Iris-setosa')
        group(i,:) = [1];
    end
    if strcmp(t5{i,1},'Iris-versicolor')
        group(i,:) = [ 2 ];
    end
    if strcmp(t5{i,1},'Iris-virginica')
        group(i,:) = [ 3];
    end
end

array = randperm(150);
traindata = data(array(1:120),:);
trainlabel = group(array(1:120),:);

testdata = data(array(121:150),:);
testlabel = group(array(121:150),:);

model = svmtrain(trainlabel,traindata);
% testlabel = ones(30,1);
[ptrain,acu,tk] = svmpredict(testlabel,testdata,model);

% [m,n] = size(data);
% for j =1 :n
%     amin = min(data(:,j));
%     amax = max(data(:,j));
%     for i =1 : m 
%         perdata(i,j) = (data(i,j) - amin)./(amax-amin);
%     end
% end







    

