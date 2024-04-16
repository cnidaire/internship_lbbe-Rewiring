# Maths

## SVD

[MIT class notes on SVD](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://math.mit.edu/classes/18.095/2016IAP/lec2/SVD_Notes.pdf&ved=2ahUKEwi-wKjS7beFAxWCT6QEHZAbAWwQFnoECDsQAQ&usg=AOvVaw0X6GdgXWT--aZvuvcmo3ZM)

The regular denationalization of a rectangular matrix $A$ of size $n \times m$ by $X^{-1} AX$ the resulting eigenvectors in X will not always be orthogonal, it requires to have a matrix $A$ a square matrix to have $Ax = \lambda x$. Also we have not always enough eigenvalues (apparently, but I don't really get what this means and why).

The singular value décomposition methods enable to diagonalise a rectangular matrix $A$ of size $n \times m$ in two sets of singular vectors, u's and v's. 
$u's \in \mathbb{R}^m$ and $u's \in \mathbb{R}^n$ will be in a $m \times m$ U matrix and a $n \times n$ V matrix

$A = U \Sigma V^\intercal$
$\Leftrightarrow A = \sum_i \sigma_i U_i \otimes V_i^\intercal$
the  $\Sigma$ matrix contains only values on the diagonal and contains the $\sigma$ values that are analogous to the eigenvalues 
We call U the left singular vector and V the right singular vector of $\sigma$
the diagonal entries $\sigma_i = \Sigma_{ii}$ of $\Sigma$ are uniquely determined by $M$ and known as singular values of $M$. The number non 0 singular values is equal to the rank of the matrix $M$.

### Interpretation of the meaning of each matrices of the SVD

$V^\intercal$ corresponds to a rotation on the unit disc, $\Sigma$ corresponds to a  scaling on the different dimensions, and $U$ to an other rotation 


### Why we are interested in SVD

SVD enables to obtain a sum of the vector product of rank one matrices, enabling to approximate more and more accurately the origin matrix. Therefore, when we have a matrix made of a Sum of clear signal and noise, we can filter out the noise by selecting the biggest $\sigma$ values as it will constitue the ordered information of the matrix and then there should be something something analog to an eigengap and the rest of the small $\sigma$ are noise.

In the case where the organized information is a sum of products of vectors, it would even be possible to retrieve theses vectors up to a rotation, as long as these are orthogonal.

Also, the regular SVD considers 0 as information whereas in our case, it is rather an absence of information, and that's one of the main reasons for using CA

## Correspondance analysis (AFC)
[course on Correspondance Analysis](https://statmath.wu.ac.at/courses/CAandRelMeth/caipA.pdf)

### 1:
contingency table transformed into a contribution table by a poisson $\chi^2$ 
$\chi^2 = \frac{O_{ij} -  E_{ij}}{\sqrt{E_{ij}}} = \sqrt{f_{++}}[\frac{p_{ij} - p_{i+}p_{+j}}{\sqrt{p_{i+}p_{+j}}}]$

$\overline{Q} = [\overline{q}_{ij}] = [\frac{p_{ij} - p_{i+}p_{+j}}{\sqrt{p_{i+}p_{+j}}}] = \frac{\chi_{ij}}{\sqrt{f_{++}}}$


### 2:


Conceptually similar to Principal Component Analysis, but applies to categorical data rather than continuous data

CA has to ba applied to a contingency matrix whereas SVD can be applied to any matrix

# Modèle



# Écologie

