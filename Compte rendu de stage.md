# Instructions

The report should not exceed 50 pages and should be submitted in pdf format. For Word use Times New Roman 12 pt, line spacing 1.5. For Latex 12pt
It may include the following sections: Abstract, Introduction, Methodology/Results, Discussion, References (classical biology format, not necessary for mathematicians)    
Figures / tables / graphs with titles and legends can be included in the text.  
References appear in the body of the text and are listed in the reference section. The format of the references you choose should be uniformly applied: for example (AUTHORS .  YEAR . TITLE ARTICLE . JOURNAL : ABBREVIATION of PUBMED - VOLUME : PAGES) for word or use of bibtex if latex.
 Think of making your manuscript understandable for a large audience.

# Structure

1. Abstract
2. Introduction
3. Methods
	1. Ecology
		1. trait matching
			what is trait matching
			how do we quantify it?
		1. rewiring
	2. SVD and Correspondance analysis
		1. What is an SV
		2. What is the point of using a SVD
		3. What is CA and the differences compared to SVD
			1. contribution $\chi^²$
			2. SVD
			3. eigen analysis
	3. Simulation
		1. Intro
			1. Simulate abundances across the env gradient
			2. Simulate two traits for each species
			3. Compute the resulting trait matching matrix 
			4. Compute the mean field (check the exact meaning, should be the exact concept of "neutral effect")
			5. multiply trait matching and mean field
			6. sample over the previous matrix
	4. Analysis?
		1. package used
			1. not sure if it is useful
		2. Trait matching reconstruction principle?
1. Results
	1. Reconstruction of the trait matching matrix
	2. Optimum parameters estimation
	3. Rewiring estimation
	4. **Real data?**
2. discussion
3. Appendices
4. bibliography

# Rapide résumé

En se basant sur une méthode développée par Lisa Nickvert et Stéphane dray, il est possible de déterminer les traits lattent des espèces à partir d'un réseau d'interactions grâce à une méthode statistique (AFC/ Correspondance Analysis) qui permet de faire fi des abondances (effet neutre/ champ moyen) et de décomposer le réseau en une série d'axes orthogonaux qui organisent l'information. C'est à dire les traits latents.
Cette méthode, basée sur la décomposition en valeur singulières (SVD) est pratique vu qu'elle permet d'obtenir des axes indépendants et de retirer l'effet des abondance grâce à une "normalisation avec $\chi^2$.

Cependant, bien que cela fonctionne sur des réseaux uniques, est-il possible de faire la même chose sur des séries de réseaux et est ce que la performance augmenterais vu que l'on a une description plus fine et globale du réseau ou est ce que elle diminue vu que l'on pourrait avoir une variabilité trop importante entre les sites et il ne serais plus possible de trouver les axes organisateur de l'ensemble des données mais de chaque sous jeu de données.
Et serait il possible de détecter un des termes récurent dans les analyse de réseaux écologique sur le quel il n'y a pas de consensus: le rewiring?

Rewiring: la modification des interactions entre espèces présentes dans plusieurs sites

En effet, nous appliquons l'AFC sur les tableaux agrégés afin d'obtenir les axes organisateurs du réseau puis après, nous nous attendons à ce ces modification d'interaction entraîne des changements de positons quand on projette un sous-réseau sur les axes obtenus et ainsi que les espèce qui ont une variation de position importante soient des espèce qui ont des "rôles" différents entre les différents sous réseaux et ainsi qu'elles aient des modification de leurs interactions entre plusieurs sites.

Afin de bien controller et de connaitre les paramètre sous jacent, les données sont simulée à partir d'abondances et de probabilité d'interaction entre espèce selon le  


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

### 1: Contribution to $\chi^2$
contingency table transformed into a contribution table by a poisson $\chi^2$ 
$\chi^2 = \frac{O_{ij} -  E_{ij}}{\sqrt{E_{ij}}} = \sqrt{f_{++}}[\frac{p_{ij} - p_{i+}p_{+j}}{\sqrt{p_{i+}p_{+j}}}]$

$\overline{Q} = [\overline{q}_{ij}] = [\frac{p_{ij} - p_{i+}p_{+j}}{\sqrt{p_{i+}p_{+j}}}] = \frac{\chi_{ij}}{\sqrt{f_{++}}}$

### 2: SVD
Singular value décomposition on the matrix $\overline{Q} = U_{(r\times c)} \Sigma_{(diagonal, c\times c)} V_{(c \times c)}^T$ 
$U$ and $V$ are both column orthogonal matrices and $\Sigma$ is a diagonal matrix $D_{\sigma_i}$ with $\sigma_i \in \mathbb{R}^+$ which are the singular values of $\overline{Q}$

### 3: eigen analysis

possible d'obtenir les 

### comment
Conceptually similar to Principal Component Analysis, but applies to categorical data rather than continuous data

CA has to ba applied to a contingency matrix whereas SVD can be applied to any matrix

# Modèle



# Écologie

