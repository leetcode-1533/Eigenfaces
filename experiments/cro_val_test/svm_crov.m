function acc = svm_crov(xtrain, ytrain, xtest, ytest)

    % NMF, ICA, PCA Base
    % calculate svm prediction using NMF, ICA, PCA    
    
%     [mapped_xtrain, mapset] = mapminmax(xtrain');
%     mapped_xtest = mapminmax.apply(xtest',mapset);
%     
%     mapped_xtrain = mapped_xtrain';
%     mapped_xtest = mapped_xtest';
    
    model = svmtrain(ytrain, xtrain);
    
    [predicted_labelp, accurp, ~] = svmpredict(ytest, xtest, model);
    
    acc = accurp(1);

    
    
       

