

clear all;

x = (1 : 0.6 : 4)';
    y =x.^2;
    
  
    model = svmtrain(y,x);
    
    pre = svmpredict((1:length(x))',x,model);
   
    hold on
    
    plot(x,pre,'og');
    plot(x,y,'*');