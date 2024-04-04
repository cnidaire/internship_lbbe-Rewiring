# Code de Lisa

## 1 ) Plant and Bird traits

Tout d'abord générer des optima pour les plantes suivant une loi uniforme entre les bornes du gradient. Puis faire la même chose avec les oiseaux mais dans ce cas là on peut associer une lois Normale et donc une variance spécifique à chaque individu.

Il y a bien deux gradients mais dans les fait il pourrait y en avoir n vu que avec l'utilisation de la loi multinormale (normale multidimensionnelle) permet d'obtenir une valeur unique qui va ensuite dans la matrice Matching

## 2 ) Plant and Bird abundance

génération d'abondance suivant une loi uniforme

## 3 ) Matching

Ensuite on peut faire du matching en calculant une matrice de distance entre les traits de chaque animaux et ceux des plantes. 


## 4 ) Abundances

Ici ils calculent la probabilité qu'une plante et une espèce interagissent en ne prenant en compte que les abondances. Cela dépend de l'abondance de oiseaux (bird ou pollinator), multiplié par la part que prend la plante parmi la flore (du coup l'abondance de la plant sur la quantité totale de plantes).

## 5 ) Mix

Correspond au produit terme à terme des deux matrices, sachant que la matrice matching a eu les termes de chaque colonne divisé par la somme des termes de la colonne.

Le terme delta sert à donner plus ou moins de poids au matching par rapport aux abondances. Si = 0 : toutes les valeurs sont égales à 1 donc tout va être lié à l'abondance. Mais si = 1 : même poids pour les deux.

## 6 ) Observed

En utilisant une loi multinomiale (polynomiale), ça permet de simuler l’échantillonnage et de "discrétiser" afin de mettre certaines interaction qui sont théoriquement possible mais peu favorable / rares à 0 sans appliquer un filtre et avoir des entiers.

## Variables

- nsp = nombre espèces
- nsite = nombre de sites
- le.grad
- col_abund
- row_abund
- min.ab
- max.ab
- mean.tol
- sd.tol
- ninter

## Objets

- p_matching
- A_abund 
- M_mix : ab_mix
- M_observed : ab_obs

# Prévision Code

## Ce que j'obtiens avec le code de Lisa

J'obtiens un graphe aléatoire simulant des données observées ainsi que les abondances, une proba de matching seulement basée sur les traits ainsi que la distribution des traits des pantes ainsi que des pollinisateurs.

## Objectifs

Est ce que ce que l'on veut c'est de conserver les abondances des espèces et juste voir l'évolution des interactions entre espèces quand les traits de l'un (le plus logique serait de considérer que plant traits correspond à une agglomération de traits de la niche tels que la température) des traits se décalent.

Une autre option pourrait être d'assumer que l'évolution des traits de la niche entraîne une modification des abondances et du coup implique un feedback.

Le gros point noir de la seconde méthode est que bien que plus fun sur le plan personnel, il y a un risque de vouloir prendre trop de choses en comptes et de du coup faire quelque chose de moins solide scientifiquement

Quelque chose qui n'est pas pris en compte notamment, c'est la fait que quand une source de nourriture / niche est modifiée/ disparaît, alors l'espèce est impactée et va alors se rabattre sur une autre niche 

**Selon moi le rewiring correspond à la plasticité d'une espèce à s'adapter en modifiant ses interactions face à une contrainte. À l'équilibre, on devrait observer des interactions selon le model de Lisa vu que les espèces sont à l'"équilibre" du point de vu trait matching. Hors une évolution rapide implique une adaptation qui n'est ni expliquée par le trait matching ni par les abondances seules mais par des valeurs d'interactions supérieures (ou inférieures mais je ne saurais pas comment l’interpréter) dues à une modification rapide du réseau et à une perte des individus avec lequel il interagissait. Cependant je ne sais pas comment l’interpréter si on ne parle plus de temps mais d'évolution dans l'espace.**

**Implémenter des graphes déjà connus et essayer de modifier le gradient afin de fitter les résultats en utilisant le modèle de Lisa, ainsi on n'aurait un graphe qui évoluerait comme si les modifications des interactions n'étaient dues que au hasard. Ce qui pourrait correspondre à un H0.**

**Ensuite, le H1 serait que la modification des interactions n'est pas expliquée que par le hasard mais aussi par une plasticité des espèce qui seraient capable de s'adapter et d'établir plus de relations que prévues avec une nouvelle niche.**

## Étapes

# Interrogations

Ici, je crois que l'on néglige les interactions à l’intérieur d'un même groupe en ne prenant pas en compte les effets de compétitions et facilitation. Ce qui pourrait modifier le poids des interactions.



# Nouveau point de vue sur le rewiring

Il se pourrait que le terme rewiring ne soit en fait que un effet de l'abondance. C'est à dire que en fait on observerais de nouvelle interaction mais que ça ne serait du qu'a l’échantillonnage. C'est à dire que disons que dans un milieu a il y a une plante très favorable (95% des interactions) à un oiseau et une autre avec laquelle il peut potentiellement interagir mais qui n'est pas observée (5%) car avec le biais d’échantillonnage, la proba d'interaction est beaucoup plus faible et donc non observée.

Cependant si maintenant on observe un milieu b où il n'y a que la plante non favorite. Alors on n'observera que cette observation car c'est la seule viable. Mais peut on parler de rewiring. Il n'y a pas eu création de nouvelles interactions, et la proportion attribuée à chaque espèce reste la même (95% et 5%), il y a juste qu'on n'observe maintenant que les 5% mais les proportions n'ont pas changées. C'est pourquoi je ne suis même pas sûr que l'on puisse parler de changement du poids des interaction, je dirais juste un changement des abondances.

Ainsi, si il y a une nouvelle espèce qui est plus favorable que celles présentes jusqu'alors, alors on aura  l'impression que sa présence a fait disparaître d'autres interactions alors que si on regarde ça du point de vue des abondances et du trait-matching, alors il est normal de ne plus observer certaines des interactions moins favorables car elle se font plus rares en comparaison au nombre d'interactions. Elles n'ont cependant pas disparues pour autant.

## autres commentaires: 

l'AFC permet de discriminer entre le trait matching et les abondances vu qu'en faisant un $\chi^2$ on obtient: $\frac{P_{ij}- P_{i.}P{.j} }{P{i.}P{.j}}$


optimum environemental = 0.1
cercle de correlation

valeur absolue correlation faire attention aux inversions d'axes sur le cercle des correlations
projetter les espèces sur le réseau moyen et regarder la variation (taille de l’enveloppe convexe) et comparer à la beta-diversité

hypervolume package R

# Pose du problème et conceptualisation de la simulation

## Pose du problème:
Nous voulons simuler des données réalistes qui suivent ce que l'on suppose principes régissant les interactions entre les espèces. Qui sont:
- *L'effet neutre*: correspond à la chance que deux espèces se rencontrent de manière aléatoire, ce qui revient à la théorie du champ moyen qui est utilisée en physique et en théorie des probability (mean field theory)
- *trait matching*: ce dernier correspond à probabilité d'interaction entre deux espèces, elle est donc liée au trait que l'on considère comme physique tels ceux mesurables et usuellement considérés en écologie (longueur et largeur de bec et diamètre du fruit par exemple). Il est aussi impacté par d'autres facteurs que l'on peut plus difficilement nommer "trait matching" au sens commun du terme comme l’appétence d'une espèce pour une autre ou le goût qui impactent aussi la probabilité d'une espèce à interagir avec une autre mais qui est plus difficilement mesurable.

## Hypothèses
Nous considérons ici que les espèces sont uniformément réparties dans le milieu et que le transect d'observation est représentatif de la zone d'étude (ainsi que les espèces sont uniformément distribuées dans l'espace).

Nous considérons aussi que les niches fondamentales et réalisées sont les mêmes lors de la génération des données.

On suppose que les espèce la distribution de la niche des espèces suit une lois normale et que la taille de la population n'est impactée que par la position de l'espèce sur le gradient environnemental et n'est pas impactée par d'autre facteurs tels que la limitation dé ressource, la prédation, le parasitisme et autres.

Aussi, on suppose que la quantité d'interactions observées ne dépend que de l'affinité d'une espèce pour l'autre ainsi que des abondance. Par exemple, on ne prend pas en compte les phénomènes d'exclusion spatiale lié à la compétition.
## Simulation

### Abondances

On tire d'abord la distribution de chaque espèce dans sur le gradient environnemental