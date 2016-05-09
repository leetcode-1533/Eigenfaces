function d_all = sift_nknn_proj(train_people, imgsize) 

d_all = {};
for ii = 1:size(train_people, 2)
    peo = train_people(:, ii);
    peo = im2single(peo./255);
    peo = reshape(peo, imgsize);

    [~, d] =  vl_sift(peo) ;
    d_all{ii} = d;
end