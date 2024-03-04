# Journal de bord
## 26 Janvier

bosse les cours de stat multi-variée de Timothée pour me faire une idée de ce que c'est

## 29 Janvier

continue à lire le livre numerical ecology

## Semaine du 5 au 9 février

J'ai fini de lire les parties de numerical ecology qui m'intéressaient, j'ai amélioré mon code en mettant sous forme de fonctions pour rendre plus lisible et facilement executable.
Je suis en train d'essayer de comprendre le code de Lisa afin de pouvoir simuler des réseaux d'interaction en faisant du trait matching afin de par la suite pouvoir peut-être appliquer des effets de rewiring en appliquant des shift de gradient.

## 9 février

Poursuite du déchiffrage du code de Lisa, je pense avoir compris la majorité de ce qui se passe et j'ai plusieurs idées de ce qui pourrais être fait pour l'utiliser dans la modélisation de rewiring. Je pose ici mon idée principale:

"Selon moi le rewiring correspond à la plasticité d'une espèce à s'adapter en modifiant ses interactions face à une contrainte.

Implémenter des graphes déjà connus et essayer de modifier le gradient afin de fitter les résultats en utilisant le modèle de Lisa, ainsi on n'aurait un graphe qui évoluerait comme si les modifications des interactions n'étaient dues que au hasard. Ce qui pourrait correspondre à un H0.

Ensuite, le H1 serait que la modification des interactions n'est pas expliquée que par le hasard mais aussi par une plasticité des espèce qui seraient capable de s'adapter et d'établir plus de relations que prévues avec une nouvelle niche."

## Jusqu'au 15 février:

J'ai résumé les points de vue sur le rewiring dans certains articles. En discutant avec Stéphane, il est plutôt d'avis que ce que l'on appelle le rewiring n'est en fait qu'une conséquence des abondances mais que vu que l'on n'observe pas les abondances lorsque l'on étudie les réseaux, on associerais ça à un phénomène autre que l'abondance, alors que l'apparition de ses nouveaux liens ne serait due qu'à un changement d'abondance et un biais d'échantillonnage.

Vincent n'est pas d'accord avec ça. Il est plutôt de l'avis que cette vision ne prends pas en compte les préférence, la notion d'habitude. Aussi, avec le trait matching, on ne prends en compte que les interactions par paires d'espèces et que on passe à côté de choses telles que le principe d'exclusion de compétition qui mène à des séparations spatiales non prises en compte. De même , on ne prend pas en compte que deux espèce qui sont sur la même niche écologique vont se gêner quand elles ont une abondance élevée.

Aussi, il a parlé du fait que la distribution des niches n'est probablement pas uniforme mais forme des régions plus denses que d'autre pour les traits.

Notion de saturation du nombre liens dues aux limitations de l'environment

prendre en compte pas que les traits mais aussi préférences par exemple niveau goûts, ou autre, qui pourrait par exemple être pensés comme étant le taux de sucre d'une plante et l'appétence pour le sucre de l'espèce interagissant.

Donc en fait on aurait: meta network filtré par saturation et interference = réseau observé
#### Objectif:

Lire l'article [[Tylianakis et Morris - 2017 - Ecological Networks Across Environmental Gradients.pdf|Tylianakis 2017]]et les articles qui y font référence afin de faire un meilleur état de l'art . Ce qui pourrait être cool, ce serait de trouver de la biblio sur la génération aléatoire de réseaux en écologie (ou de meta-web/ meta-network), trouver des revues sur le rewiring,

finir implémenter le gradient environnemental du package de Lisa pour avoir une base

## 16 février

j'ai refais en grande partie le code pour générer des réseaux suivant un gradient environmental.

## 20 février

J'ai pas mal fais de biblio jusque là sur le rewiring pour m'assurer que la théorie comme quoi le rewiring n'était due qu'à un effet de l'abondance (sa modification) ainsi qu'au trait matching. Ce qui semble être le cas. 
J'ai eu un appel avec Vincent pour en discuter. Il m'a dit que ce qui l’intéresse c'est bien sûr le rewiring mais aussi et surtout d'avoir un outils pour pouvoir faire de la comparaison de réseaux et pouvoir montrer à quel point deux réseaux avec des espèces différentes sont similaires.

Une des choses à côté de laquelle j'ai du passer à côté sans le comprendre est la notion de saturation, qui implique que une espèce n'interagit probablement pas avec toutes les espèce potentielles mais cela ne pourrait n'être due qu'à une histoire d'abondance.

Dans l'idée, ça pourrait être bien de developer quelque chose où on fait de la génération de graphes à partir de quelque chose d'aléatoire et que l'on puisse en suite retrouver "paramètres" de départ pour avoir quelque chose de contrôlé mais je ne suis pas sûr de savoir quoi mettre dan le terme paramètre.

## 23 février

Je voulais vérifier que je n'avais pas de problème de code lors de la generation de gradient, vu que j'ai certaines frames qui sont très différentes de certaines mais en augmentant la résolution du gradient, on se rend compte que ce ne sont que des changement très rapide, impliquant que la stabilité d’une interaction peut être très sensible au gradient environment.

Cependant il faudrait qu'on le voit tous ensemble pour voir si il y aurait vraiment une explication car la totalité du réseau subit une variation importante pour quelques frames.

## 26 février

Aujourd'hui j'ai pu discuter avec Stéphane, ce qui'il faudrait faire:
- [x] appliquer une AFC sur les réseaux générés
- [x] plotter la distance suivant le gradient en fonction de la distance calculée via la Beta diversité et peut aussi être fait suivant les métriques usuelles pour caractériser un réseau écologique
- [x] refaire la même chose en rajoutant une couche avec la loi polynomiale afin de simuler l’échantillonnage.
- [x] tirer des positions uniformément sur le gradient environmental vu que en théorie on ne sais jamais notre position sur le gradient
- Une théorie serait:
	- deux réseaux très différents: turnover entre espèces
	- deux réseaux quasi identiques: turnover-trait matching et biais échantillonnage.

J'ai passé une très bonne journée parce que Léa et Emma étaient là (hier c'était triste)

## 29 février
mise en fonction de l’échantillonnage pour avoir des réseaux observés et avec des vraies valeurs

## 1 mars

je lit le bouquin d'Hadley Wickham sur la création de packages R pour m'assurer que au moins j'ai les bonnes pratiques et que ce que je fais sera réutilisable.

## 4 mars

Fin de la doc sur le packet


# Todo list

- [ ] jouer avec les largeurs de gradients ainsi que avec les variances des niches
- [ ] faire en sorte que les abondance ne dépendent plus que de la variance de la niche mais aussi d'une autre variable puis rajouter de la variabilité avec un rpois de la valeur obtenue
- [ ] ajouter une légère correlation entre de certains traits avec le gradient environnemental.
- [ ] ne plus trier en fonction des optimums de niche théoriques mais en fonction de leurs ordre sur le premier axe de l'AFC. En théorie même résultat mais c'est ce que l'on ferait sur des données de terrain.
- [ ] données Miele et Vasquez
- [ ] métrique pour réseaux valués bipartis
- [ ] différentes approches comme AFC, métriques (nestedness, motifs, modularity, degree moyen), beta div
- [ ] lire bersier et al 2012 et abundances and generalisaztion in mutualistic networks solving the chicken and egg dilema

inférer le vrai réseau et comparer en se basant sur le vrai réseau obtenu avec l'AFC et monter que même si le réseau observé est différent, le trait matching est similaire

récupérer les trait matching théorique

obtenir les paramètres de largeur de niche et la meme chose pour les traits

données caradonna

correlation entre le co / le li et les traits

jouer avec le delta et peut être les faire varier (genre les fixer à 0 pour la moité) et regarder si il est toujours possible d'obtenir le trait matching à partir de ça.