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