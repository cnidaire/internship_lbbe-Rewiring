# 26 Janvier

bosse les cours de stat multi-variée de Timothé pour me faire une idée de ce que c'est

# 29 Janvier

continue à lire le livre numerical ecology

# Semaine du 5 au 9 fevrier

J'ai fini de lire les parties de numerical ecology qui m'interressaient, j'ai amélioré mon code en mettant sous forme de fonctions pour rendre plus lisible et faciolement executable.
Je sui en train d'essayer de comprendre le code de Lisa afin de pouvoir simluler des réseaux d'interaction en faisant du trait matching afin de par la suite pouvoir peut-être appliquer des effets de rewiring en appliquant des shift de gradient.

9 fervrier

Poursuite du déchiffrage du code de lisa, je pense avoir compris la majoritée de ce qui se passe et j'ai plusieurs idées de ce qui piurrais être fait pour l'utiliser dans la modéllisation de rewiring. Je pose ici mon idée principale:

"Selon moi le rewiring correspond à la plasticité d'une espèce à s'adapter en modifiant ses interactions face à une contrainte.

Implémenter des graphes déjà connus et essayer de modifier le gradient afin de fitter les résultats en utilisant le modèle de Lisa, ainsi on n'aurait un graphe qui évoluerait comme si les modifications des interactions n'étaient dues que au hasard. Ce qui pourrait correspondre à un H0.

Ensuite, le H1 serait que la modification des interactions n'est pas expliquée que par le hasard mais aussi par une plasticité des espèce qui seraient capable de s'adapter et d'établir plus de relations que prévues avec une nouvelle niche."