# Code de Lisa

## 1 ) Plant and Bird traits

Tout d'abord générer des optima pour les plantes suivant une loi uniforme entre les bornes du gradient. Puis faire la même chose avec les oiseaux mais dans ce cas là on peut associer une lois Normale et donc une variance spécifique à chaque individu.

Il y a bien deux gradients

## 2 ) Plant and Bird abundance

génération d'abondance suivant une loi uniforme

## 3 ) Matching

Ensuite on peut faire du matching en calculant une matrice de distance entre les traits de chaque animaux et ceux des plantes. 

**Les questions sont sur la feuille de note**

## 4 ) Abundances

Ici ils calculent la probabilité qu'une plante et une espèce interagissent en ne prenant en compte que les abondances. Cela dépend de l'abondance de oiseaux (bird ou pollinator), multiplié par la part que prend la plante parmi la flore (du coup l'abondance de la plant sur la quantité totale de plantes).

**Cependant je ne comprend pas la forme des résultats obtenus et pourquoi on a besoin de faire une transposée.**

## 5 ) Mix

Correspond au produit terme à terme des deux matrices, sachant que la matrice matching a eu les termes de chaque colonne divisé par la somme des termes de la colonne.

Le terme delta sert à donner plus ou moins de poids au matching par rapport aux abondances. Si = 0 : toutes les valeurs sont égales à 1 donc tout va être lié à l'abondance. Mais si = 1 : même poids pour les deux.

## 6 ) Observed

En utilisant une loi multinomiale (polynomiale), ça permet de simuler l’échantillonnage et de "discrétiser" afin de mettre certaines interaction qui sont théoriquement possible mais peu favorable / rares à 0 sans appliquer un filtre et avoir des entiers.

## Variables

pourquoi est ce que il y a des . et des _ dans les variables?

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

- 

# Prévision Code

## Ce que j'obtiens avec le code de Lisa

J'obtiens un graphe aléatoire simulant des données observées ainsi que les abondances, une proba de matching seulement basée sur les traits ainsi que la distribution des traits des pantes ainsi que des pollinisateurs.

## Objectifs

Est ce que ce que l'on veut c'est de conserver les abondances des espèces et juste voir l'évolution des interactions entre espèces quand les traits de l'un (le plus logique serait de considérer que plant traits correspond à une agglomération de traits de la niche tels que la température) des traits se décalent.

Une autre option pourrait être d'assumer que l'évolution des traits de la niche entraîne une modification des abondances et du coup implique un feedback.

Le gros point noir de la seconde méthode est que bien que plus fun sur le plan personnel, il y a un risque de vouloir prendre trop de choses en comptes et de du coup faire quelque chose de moins solide scientifiquement

Quelque chose qui n'est pas pris en compte notament, c'est la fait que quand une source de nourriture / niche est modifiée/ disparait, alors l'espèce est impactée et va alors se rabattre sur une autre niche 

**Selon moi le rewiring correspond à la plasticité d'une espèce à s'adapter en modifiant ses interactions face à une contrainte.**

**Implémenter des graphes déjà connus et essayer de modifier le gradient afin de fitter les résultats en utilisant le modèle de Lisa, ainsi on n'aurait un graphe qui évoluerait comme si les modifications des interactions n'étaient dues que au hasard. Ce qui pourrait correspondre à un H0.**

**Ensuite, le H1 serait que la modification des interactions n'est pas expliquée que par le hasard mais aussi par une plasticité des espèce qui seraient capable de s'adapter et d'établir plus de relations que prévues avec une nouvelle niche.**


## Étapes