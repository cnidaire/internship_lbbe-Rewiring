# 1 ) Plant and Bird traits

Tout d'abord générer des optima pour les plantes suivant une loi uniforme entre les bornes du gradient. Puis faire la même chose avec les oiseaux mais dans ce cas là on peut associer une lois Normale et donc une variance spécifique à chaque individu.

Je crois que on pet le faire avec avec deux traits.

# 2 ) Plant and Bird abundance

**reste un mystère**

# 3 ) Matching

Ensuite on peut faire du matching en calculant une matrice de distance entre les traits de chaque animaux et ceux des plantes. **Mais je ne comprend pas les calculs.**

# 4 ) Abundances

Tableau croisé des abondances

# 5 ) Mix

Correspond au produit terme à terme des deux matrices, sachant que la matrice matching a eu les termes de chaque colone divisé par la somme des termes de la colonne.

Le terme delta sert à donner plus ou moins de poid au matching par rapport aux abondances. Si = 0 : toutes les valeurs sont égales à 1 donc tout va être lié à l'abondance. Mais si = 1 : même poids pour les deux.

# 6 ) Observed

Permet de ne pas obtenir un graphe complet et d'avoir des valeurs qui sont égales à 0. Il y a une histoire de lois multi normale et de nombre d'interaction observées qui permet de donner de l'importance au fait que on n'observera pas toutes les interactions qui se passent lors des relevés.