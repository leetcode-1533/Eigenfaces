# Eigenface research repo

My research repository. It is about decomposing face images into lower space.

#### Things to do:
* Wrote NMF algorithm myself
* Wrote algorithm to get a general inverse matrix
* wrote eigen decomposition algorithm
* Better algorithms for determing K values
* Reading on: motion detection


#### Yingjie.log
Dec 19: PCA Prototype.
* I wrote my own version PCA. 
* Uploaded related results

Dec 21: Prototype of NMF, PCA
* Picked up NMF
* Using 'Moore-Penrose pseudoinverse of matrix' Algorithm for projecting results into NMF subspace, got great results.
* I found NMF doesn't explicitly restrict the dimensions of the subspace. I.e. For PCA, the matrix L is 400x400 thus at the maximum I can only get 400 eigenvectors. For NMF, due to its iterative, I felt I can go beyond that limit, it is not suggested. The matlab version limited this.
    


#### Algorithms implemented:
- NMF
- PCA

#### Links:
- [Result images](https://www.dropbox.com/sh/nbpppr8vuie3leu/AAD2ZEvnn0UaLGEkPlBC5geza?dl=0): I results I got so far.
- [Research notes](https://www.evernote.com/pub/y1275963/res): I kept all important notes in here

