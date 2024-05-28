# Instructions

The report should not exceed 50 pages and should be submitted in pdf format. For Word use Times New Roman 12 pt, line spacing 1.5. For Latex 12pt
It may include the following sections: Abstract, Introduction, Methodology/Results, Discussion, References (classical biology format, not necessary for mathematicians)    
Figures / tables / graphs with titles and legends can be included in the text.  
References appear in the body of the text and are listed in the reference section. The format of the references you choose should be uniformly applied: for example (AUTHORS .  YEAR . TITLE ARTICLE . JOURNAL : ABBREVIATION of PUBMED - VOLUME : PAGES) for word or use of bibtex if latex.
 Think of making your manuscript understandable for a large audience.

\textrm{} pour retirer l'italique
**matrices vecteur en gras droit majuscule
vecteur vecteur en gras droit minuscule**

# Structure

1. Abstract
2. Introduction
		relier au climate change, shift des niches
		define niche grinnel et elton, realized and fundamental
		réseau structurés et qui varient dans le temps
		1. rewiring
		2. trait matching
			what is trait matching
			how do we quantify it?
		3. Introduire ce que l'on va faire

		 
1. Methods
	1. Notation réseau
	2. Simulation
		1. Intro
			1. Simulate abundances across the env gradient
			2. Simulate two traits for each species
			3. Compute the resulting trait matching matrix 
			4. Compute the mean field (check the exact meaning, should be the exact concept of "neutral effect")
			5. multiply trait matching and mean field
			6. sample over the previous matrix
	3. SVD and Correspondance analysis
		1. What is an SVD
		2. What is the point of using a SVD
		3. What is CA and the differences compared to SVD
			1. contribution $\chi^²$
			2. SVD
			3. eigen analysis
	4. Analysis?
		1. package used
		2. Trait matching reconstruction principle?
		3. evaluer la reconstruction
		4. mes question et comment y répondre
2. Results
	1. Reconstruction of the trait matching matrix
	2. Optimum parameters estimation
	3. Rewiring estimation
	4. **Real data?**
3. discussion
4. Appendices
5. bibliography

Introduire la finalité du paragraphe 

# Methods
## Networks notations

Let's consider a location and the resulting interactions of this sampling. We consider a bipartite network with r resources species and c consumer species. In this case, the resources and consumer doesn't imply a prédation. It can either be plant/pollinators, host/parasitism, or else as long as the network is bipartite. 

Let $Y$ be the $r\times c$ matrix of interactions such that $\textrm{Y} = [y_{ij}]$. With $y_{ij}$ the number interactions between i and j observed.
Let $\textrm{P}=[\frac{y_{ij}}{y_{++}}]$
$r=\textrm{P1}_r =[p_{1+}, ..., p_{r+}]^\intercal$
$c=\textrm{P1}_c=[p_{+1}, ..., p_{+c}]^\intercal$
$y_{++}=\sum_{i=1}^{r}\sum_{j=1}^{c}y_{ij}$
$p_{i+}=\sum_{j=1}^{c}$ and $p_{+j}=\sum_{i=1}^{r}$ are the marginal sums for rows and columns.

## Simulation
based on Fründ et al 2016, Benadi et al 2022, Dray and Legrendre 2008 as well as the thesis of Lisa Nickvert
### Assumptions
Here, we assume that the proxi of the relative abundances is is the frequency of the observed interaction for a given specie. We as well assume that the interactions are solely based on a mixed effect of the trait matching and of the abundance. We can be understood as the probability of two species encountering, which is the product of the abundances, time the probability of these two species interaction together based on their trait matching.

Also, using a bipartite network assume that there is no interaction intra-group but only inter-groups. It implies that the competition, facilitation, spatial exclusion.

### Trait matching
The trait matching doesn't have to be something well defined like the length of the beak on the size of the fruit. First of all, it is most likely that the traits found are a combinaison of multiples pondered traits that can include more subjectives thing as the taste for example that can be though of as a gradient of sour/sweetness of the fruit or plant.
The variability/ tolerance is encoded as the variance and the optimum is the mean of the distribution.

### Abundances and environmental distribution

**notion of niche grinel/elton**
_Grinellian niche:_ the niche of the species is determined by the habitat in which it lives and its accompanying behavioral modification. It can be defined by abiotic variables and environmental conditions on broad scale.

_Eltonian niche:_ "The niche of an animal means its place in the biotic environment, its relations to food and enemies"
classified niches according to foraging activities.
response to and effect on the environment

_Hutchinsonian niche:_ is a n-dimensional hypervolume

Here we use the Hutchinsonian definition of the niche as a position of the species in a 1 dimensional gradient.

Here, we assume that the species are normally distributed across an environmental gradient. This gradient can either represent the distribution over time or the distribution across space, for example in the case of a mountain. As for the traits, this gradients may takes in account different factors such as the humidity, sun exposure, temperature, altitude, soil, etc in the case of the space gradient.
Here we assume normality distribution, which imply a unique associated optimum as well as a tolerance expressed as a variance.


# Notes
## Rapide résumé

En se basant sur une méthode développée par Lisa Nickvert et Stéphane dray, il est possible de déterminer les traits lattent des espèces à partir d'un réseau d'interactions grâce à une méthode statistique (AFC/ Correspondance Analysis) qui permet de faire fi des abondances (effet neutre/ champ moyen) et de décomposer le réseau en une série d'axes orthogonaux qui organisent l'information. C'est à dire les traits latents.
Cette méthode, basée sur la décomposition en valeur singulières (SVD) est pratique vu qu'elle permet d'obtenir des axes indépendants et de retirer l'effet des abondance grâce à une "normalisation avec $\chi^2$.

Cependant, bien que cela fonctionne sur des réseaux uniques, est-il possible de faire la même chose sur des séries de réseaux et est ce que la performance augmenterais vu que l'on a une description plus fine et globale du réseau ou est ce que elle diminue vu que l'on pourrait avoir une variabilité trop importante entre les sites et il ne serais plus possible de trouver les axes organisateur de l'ensemble des données mais de chaque sous jeu de données.
Et serait il possible de détecter un des termes récurent dans les analyse de réseaux écologique sur le quel il n'y a pas de consensus: le rewiring?

Rewiring: la modification des interactions entre espèces présentes dans plusieurs sites

En effet, nous appliquons l'AFC sur les tableaux agrégés afin d'obtenir les axes organisateurs du réseau puis après, nous nous attendons à ce ces modification d'interaction entraîne des changements de positons quand on projette un sous-réseau sur les axes obtenus et ainsi que les espèce qui ont une variation de position importante soient des espèce qui ont des "rôles" différents entre les différents sous réseaux et ainsi qu'elles aient des modification de leurs interactions entre plusieurs sites.

Afin de bien controller et de connaitre les paramètre sous jacent, les données sont simulée à partir d'abondances et de probabilité d'interaction entre espèce selon le  


## Maths

### SVD

[MIT class notes on SVD](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://math.mit.edu/classes/18.095/2016IAP/lec2/SVD_Notes.pdf&ved=2ahUKEwi-wKjS7beFAxWCT6QEHZAbAWwQFnoECDsQAQ&usg=AOvVaw0X6GdgXWT--aZvuvcmo3ZM)

The regular denationalization of a rectangular matrix $A$ of size $n \times m$ by $X^{-1} AX$ the resulting eigenvectors in X will not always be orthogonal, it requires to have a matrix $A$ a square matrix to have $Ax = \lambda x$. Also we have not always enough eigenvalues (apparently, but I don't really get what this means and why).

The singular value décomposition methods enable to diagonalise a rectangular matrix $A$ of size $n \times m$ in two sets of singular vectors, u's and v's. 
$u's \in \mathbb{R}^m$ and $u's \in \mathbb{R}^n$ will be in a $m \times m$ U matrix and a $n \times n$ V matrix

$A = U \Sigma V^\intercal$
$\Leftrightarrow A = \sum_i \sigma_i U_i \otimes V_i^\intercal$
the  $\Sigma$ matrix contains only values on the diagonal and contains the $\sigma$ values that are analogous to the eigenvalues 
We call U the left singular vector and V the right singular vector of $\sigma$
the diagonal entries $\sigma_i = \Sigma_{ii}$ of $\Sigma$ are uniquely determined by $M$ and known as singular values of $M$. The number non 0 singular values is equal to the rank of the matrix $M$.

#### Interpretation of the meaning of each matrices of the SVD

$V^\intercal$ corresponds to a rotation on the unit disc, $\Sigma$ corresponds to a  scaling on the different dimensions, and $U$ to an other rotation 


#### Why we are interested in SVD

SVD enables to obtain a sum of the vector product of rank one matrices, enabling to approximate more and more accurately the origin matrix. Therefore, when we have a matrix made of a Sum of clear signal and noise, we can filter out the noise by selecting the biggest $\sigma$ values as it will constitue the ordered information of the matrix and then there should be something something analog to an eigengap and the rest of the small $\sigma$ are noise.

In the case where the organized information is a sum of products of vectors, it would even be possible to retrieve theses vectors up to a rotation, as long as these are orthogonal.

Also, the regular SVD considers 0 as information whereas in our case, it is rather an absence of information, and that's one of the main reasons for using CA

### Correspondance analysis (AFC)
[course on Correspondance Analysis](https://statmath.wu.ac.at/courses/CAandRelMeth/caipA.pdf)

#### 1: Contribution to $\chi^2$
contingency table transformed into a contribution table by a poisson $\chi^2$ 
$\chi^2 = \frac{O_{ij} -  E_{ij}}{\sqrt{E_{ij}}} = \sqrt{f_{++}}[\frac{p_{ij} - p_{i+}p_{+j}}{\sqrt{p_{i+}p_{+j}}}]$

$\overline{Q} = [\overline{q}_{ij}] = [\frac{p_{ij} - p_{i+}p_{+j}}{\sqrt{p_{i+}p_{+j}}}] = \frac{\chi_{ij}}{\sqrt{f_{++}}}$

#### 2: SVD
Singular value décomposition on the matrix $\overline{Q} = U_{(r\times c)} \Sigma_{(diagonal, c\times c)} V_{(c \times c)}^T$ 
$U$ and $V$ are both column orthogonal matrices and $\Sigma$ is a diagonal matrix $D_{\sigma_i}$ with $\sigma_i \in \mathbb{R}^+$ which are the singular values of $\overline{Q}$

#### 3: eigen analysis

possible d'obtenir les 

#### comment
Conceptually similar to Principal Component Analysis, but applies to categorical data rather than continuous data

CA has to ba applied to a contingency matrix whereas SVD can be applied to any matrix

## Modèle



## Écologie

## Beta diversité

Il est important de noter que selon la definition de Poisot, la beta diversité rewiring est estimée par la beta diversité totale moins les effet dû aux abondances. Ces effets des abondances (turnover des espèces) sont estimés par des la beta diversité sur les espèces qui sont présentes dans l'un des deux réseaux comparés mais pas l'autre. Ainsi, cela revient à "binariser" le réseau. Cela s'explique assez facilement par le fait que l'on n'a généralement pas accès aux abondances et que c'est la façon la plus simple de les approximer.

Avec l'AFC on suppose que plus on observe d'interactions, plus on l'abondance de l'espèce est élevée. Ainsi on peut se débarrasser des effets des abondances et ne prendre en compte que le rewiring.