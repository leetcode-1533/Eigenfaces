function acc = svm_crov(xtrain, ytrain, xtest, ytest)

    model = svmtrain(ytrain, xtrain);    
    [predicted_labelp, accurp, ~] = svmpredict(ytest, xtest, model);
    
    acc = accurp(1);

    
    
       

