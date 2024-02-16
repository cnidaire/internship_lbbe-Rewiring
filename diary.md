# 26 Janvier

bosse les cours de stat multi-variée de Timothée pour me faire une idée de ce que c'est

# 29 Janvier

continue à lire le livre numerical ecology

# Semaine du 5 au 9 février

J'ai fini de lire les parties de numerical ecology qui m'intéressaient, j'ai amélioré mon code en mettant sous forme de fonctions pour rendre plus lisible et facilement executable.
Je suis en train d'essayer de comprendre le code de Lisa afin de pouvoir simuler des réseaux d'interaction en faisant du trait matching afin de par la suite pouvoir peut-être appliquer des effets de rewiring en appliquant des shift de gradient.

# 9 février

Poursuite du déchiffrage du code de Lisa, je pense avoir compris la majorité de ce qui se passe et j'ai plusieurs idées de ce qui pourrais être fait pour l'utiliser dans la modélisation de rewiring. Je pose ici mon idée principale:

"Selon moi le rewiring correspond à la plasticité d'une espèce à s'adapter en modifiant ses interactions face à une contrainte.

Implémenter des graphes déjà connus et essayer de modifier le gradient afin de fitter les résultats en utilisant le modèle de Lisa, ainsi on n'aurait un graphe qui évoluerait comme si les modifications des interactions n'étaient dues que au hasard. Ce qui pourrait correspondre à un H0.

Ensuite, le H1 serait que la modification des interactions n'est pas expliquée que par le hasard mais aussi par une plasticité des espèce qui seraient capable de s'adapter et d'établir plus de relations que prévues avec une nouvelle niche."

# Jusqu'au 15 février:

J'ai résumé les points de vue sur le rewiring dans certains articles. En discutant avec Stéphane, il est plutôt d'avis que ce que l'on appelle le rewiring n'est en fait qu'une conséquence des abondances mais que vu que l'on n'observe pas les abondances lorsque l'on étudie les réseaux, on associerais ça à un phénomène autre que l'abondance, alors que l'apparition de ses nouveaux liens ne serait due qu'à un changement d'abondance et un biais d'échantillonnage.

Vincent n'est pas d'accord avec ça. Il est plutôt de l'avis que cette vision ne prends pas en compte les préférence, la notion d'habitude. Aussi, avec le trait matching, on ne prends en compte que les interactions par paires d'espèces et que on passe à côté de choses telles que le principe d'exclusion de compétition qui mène à des séparations spatiales non prises en compte. De même , on ne prend pas en compte que deux espèce qui sont sur la même niche écologique vont se gêner quand elles ont une abondance élevée.

Aussi, il a parlé du fait que la distribution des niches n'est probablement pas uniforme mais forme des régions plus denses que d'autre pour les traits.

Notion de saturation du nombre liens dues aux limitations de l'environment

prendre en compte pas que les traits mais aussi préférences par exemple niveau goûts, ou autre, qui pourrait par exemple être pensés comme étant le taux de sucre d'une plante et l'appétence pour le sucre de l'espèce interagissant.

Donc en fait on aurait: meta network filtré par saturation et interference = réseau observé
## Objectif:

Lire l'article [[Tylianakis et Morris - 2017 - Ecological Networks Across Environmental Gradients.pdf|Tylianakis 2017]]et les articles qui y font référence afin de faire un meilleur état de l'art . Ce qui pourrait être cool, ce serait de trouver de la biblio sur la génération aléatoire de réseaux en écologie (ou de meta-web/ meta-network), trouver des revues sur le rewiring,

finir implémenter le gradient environnemental du package de Lisa pour avoir une base