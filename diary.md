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
et réunion avec Vincent et Stéphane

## 5 mars

recherche de base de donnée et de métriques dans des articles

## 11 Mars

Test AFC sur les données de Vincent et lecture partie correspondance analysis du bouquin de stats

## jusqu'au 14 mars

observation du jeu de données de Vincent

## 17 mars: optimisation linux et wifi avec Papa

- plugins firefox: tree tabs + group tabs
- Wifi:
	-  lspci  pour voir les périphériques (VGA, USB, SATA, réseau, wireless)
	-  tail -f /var/log/syslog | grep NetworkManager
	-  /etc/init.d/networking restart  (stop ou start ou ....)
	- termes qui reviennent souvent avec le wifi: supplicant
	-  Carte réseau RTL8188EE...
	- module du noyau:
		- lsmod
		- modprobe -r rtl8188ee rtl_wifi rtl_pci
		- modprobe rtl8188ee rtl_wifi rtl_pci
	-  /etc/init.d/networking stop ;  /etc/init.d/networking start
- Bluetooth: pas de bluetooth
	- https://h30434.www3.hp.com/t5/Notebook-Wireless-and-Networking/Bluetooth-Capability/td-p/5789312
	- https://support.hp.com/fr-fr/document/c04940877
	- https://doc.ubuntu-fr.org/bluetooth_materiel-soutenu pour le cas où tu voudrais acheter un dongle USB bluetooth
- Espace disque
	- df -h (pour voir ce qui est monté et combien il reste)
	- mount (pour voir ce qui est monté)
	- cfdisk (pour voir les partitions)


## Jusqu'au 20 mars

retour sur les données simulées:
- reconstitution du trait matching à partir de l'AFC sur les réseaux générés
- resoudre init splash qui mon bouffe tout mon CPU:
	- depends de snapd qui est une merde propriétaire qui rajoute une couche sur apt
		- snap remove 
		- snap remove gtk-common-themes
		- snap remove gnome-3-34-1804
		- snap remove core18
	- n'a pas marché, j'ai peur de tout casser mais ça reste pénible

On retrouve bien une surestimation des spécialistes quand la puissance d'échantillonnage est trop faible et de plus on à l'impression qu'il y a plein de petites composantes au lieu d'une géante.

Il semblerait aussi que bien que ce qui perturbe l'AFC, ce ne soit pas que les éléments ne faisant pas partie de la composante géante mais aussi ceux qui ont un degré de 1 et qui sont eux même liés à des points qui sont faiblement connectés. dans ce cas, cela ne correspondra peut-être pas à la composante principale mais peut-être la 2eme, 3eme, etc. Ce qui peut être gênant dans notre cas car on s'attendrait à ce que les premières composantes soient le traits organisant les interactions et seulement plus bas ce genre de bruit.

## 21-22

- fixer les gradients de traits et environmental entre 0 et 1
- remise au propre du packet
- filtrer la composante géante sur les données simulées

## 23 mars

Observation des comportement sur de multiples simulation
- effet de mean_tol_env, quand il augmente, le premier axe va expliquer de mieux en mieux les traits 1 et 2
- Je n'arrive pas à trouver que le trait 1 est corrélé au premier axe et que le trait 2 au 2ème
 en fait j'ai l'impression que le premier axe va être un mélange du premier et du deuxième et de même pour les suivants et que l"on n'obtient pas une séparation des traits suivant les axes: **à discuter avec Lisa**

## 26 mars

j'ai d'abord essayé de trouver une méthode pour repérer les outlier à partir des coordonnées des points sur les différents axes puis test pour regarder leurs centralité, leurs degrés puis visuellement quel étaient ceux qui sortaient et regarder leurs propriétés dans le réseau moyen.

certains axes lors de simulations sortent semblent très influencés par un sous ensemble d'espèces. J'ai d'abord pensé que cela pouvait correspondre à une histoire de centralité mais dans les fait, certains points encore moins centraux ne perturbent pas pour autant l'AFC. Du coup je me suis dit que cela pouvait être un impact des vertex (a) de degré 1 liés à un autre vertex (b) principalement relié à a et aillant des liens peu puissant avec les autres vertices. Cela fonctionnait mieux mais certain étaient détectés mais sont considérés comme centraux (pour b) et du coup ne perturbaient pas l'AFC. Et au contraire, certains n'aillant pas un degré de 1 le perturbaient.

Ma théorie et que l'AFC est perturbée car bien que l'on n'ai qu'une composante principale, on est dans un cas un peu hybride où un sous groupe d'espèces sont fortement reliées entre elles et peu avec le reste du réseau. Cela reviendrait à avoir un cas un peu plus complexe que celui où nous avons plusieurs composantes et dans ce cas, l'axe perturbé en question représenterais l'organisation de ce sous groupe d'espèces. Dans notre cas, le détecter est une première étape mais il faudrait aussi faire en sorte de ne pas regarder cet axe et peut-être regarder la structure de ce sous groupe après et dans tout les cas donner la composition des espèces formant un cluster séparé.

Si c'est le cas, il faudrait regarder le clustering pondéré du réseau afin d'essayer de découvrir des structure à l’intérieur du réseau. Du coup je lis l'article : "The architecture of complex weighted networks" de Barrat 2008 car il semble être à l'origine de la méthode de clustering barrat qui fonctionne sur les graphes pondérés

## 27 mars: biblio sur le clustering

It seems clear to me that the fact that there is some smaller scale structures is perturbing the CA and hence it is harder to find a common structure as there is some smaller scale ones. 
https://igraph.org/c/doc/igraph-Community.html
*"Clustering methods differ in their ability to detect patterns in ecological networks" from Leger 2015*
"This latter kind of subgroup is usually referred to as compartment (Krause et al. 2003) or module (Olesen et al. 2007)." So what I'm looking for is either compartments or modules. It has more nuance than the explanation of Vincent.

Selon cet article, le plus approprié pour des graphes bipartis pondérés, ce serait le stochastic block model qui vient de l'article "UNCOVERING LATENT STRUCTURE IN VALUED GRAPHS: A VARIATIONAL APPROACH" de Mariadassou, Robin & Vacher 2010

J'ai l'impression que ce qui m’intéresse, ce serait de faire du partitionnement spectral (spectral clustering)

le fait de se séparer de ces sous ensemble qui peut me sembler gênant. Dans ce cas, j'ai l'impression que ce qui ressort dans les valeurs propres, est cette structure qui n'est pas représentative de la structure globale. Mais en même temps s'en débarrasser est problématique car c'est une structure qui est bel et bien présente dans le metaweb mais qui est modulaire. Et dans ce cas,  elle est importante et in ne peut pas s'en débarrasser pour la même justification que quand elle est séparée clairement de la composante géante puisque une modification interne à cette composante impacteras aussi la composante géante bien que façon minime je pense. 

https://lrouviere.github.io/TUTO_GRAPHES/correction/clust-spec.html

peut peut-être fonctionner avec dendPlot(cluster_edge_betweenness(graph))

ceux qui foutent la merde sont quasi toujours dans le même cluster! 
Quand l'AFC fonctionne bien, on a de grands groupes et inversement. C'est aussi réciproque quand on regarde le dendro en premier
Ça fonctionne super bien!
quelques cas peu satisfaisants, surtout, cela peut permettre d'identifier la sous structure qui pose problème mais pas de la détecter pre-AFC


## 28 mars: same

apparently community detection and spectral clustering are two different things
En fait, je pense que le clustering c'est super important et je pense que ça apporte une information super intéressante sur les sous communautés et si possible sur les espèces qui ont  des rôles qui ont à l'interface des différentes communautés. Ce qui pourrait être intéressant, ce serait de voir le lien entre ça et les trait ou les niches environnementales.

"Community detection in networks: A user guide" from Fortunato 2016
"For networks characterized by NCPs (network community profile) like the one in Fig. 19 (left) the most pronounced communities are fairly small in size. Such small clusters are weakly connected to the rest of the network, often by a single edge (in this case they are called whiskers), and form the periphery of the graph. Large clusters have comparatively lower quality and melt into a big core. Large communities can often be split in parts with lower conductance, so they can be considered conglomerates of smaller communities."
It indeed seems like there is a core periphery structure and that the species perturbing the signal are whiskers
Au vu de l'article de Vincent "Core-periphery dynamics in plant-pollinators networks"

Je pense que la detection de communauté devrais fonctionner assez bien sur la matrice de trait matching je pense.

et discussion avec Stéphane:
- pas besoin de repérer les communautés normalement la matrice de trait matching devrait fonctionner correctement
- problème de modularité potentielle:
	- si plusieurs gros modules : les faire séparément
	- si un gros et plusieurs petits: virer les petits en applicant par example un filtre sur le degré
- vérifier que la matrice de trait matching est bien reconstruite en regardant une distance RV
- chercher un indice de modularité pour pouvoir comment la puissance d’échantillonnage et le nombre de frames l'influence


## 29 mars

- [ ] faire un RV sur les matrices de trait matching et comprendre ce à quoi ça correspond
- [ ] lier l’échantillonnage et l'indice de  modularité (on s'attend à ce que quand on augmente l'échantillonnage, l'indice de modularité diminue mais on n'a pas encore trop d'indice de modularité mais je pense que ça peut se faire avec du clustering top down)
- [ ] faire un test en virant les espèces degré inférieur à 5. afin de n'obtenir que ceux qui ne font parti de la communauté principale
- [ ] regarder la modularité pour voir si c'est impacté par le nombre de sites échantillonnés aussi

Il semblerais que le coef rv de correlation entre les traits théorique et reconstruits ne soit pas impacté par la puissance d’échantillonnage

## 30 mars

tirer abondances suivant loi logistique plutôt que normale
produit de deux logistiques dans les deux sens -> quatre param mais permet d'avoir des optimums longs
effet neutre = champ moyen (mean field

vérifier la reconstruction, je pense que dans le chi 2, il y a une racine et pas un carré sour la fraction)

## 2 avril

J'ai pris du temps pour comprendre la décomposition en valeurs singulières et pour commencer à poser les maths et comprendre ce que la simulation fait.

## 3 avril

continuer de lire les maths et essayer de comprendre ce que je dois faire pour écrire les maths proprement pour la partie simulation

**il faut peut-être retirer la couche d’échantillonnage.** Du point de vue biologique, lorsque l'on tire les abondances, ce que lo'n fait en fait est définir le nombre d'espèces qui vont passer par le transect d'étude et ensuite, ces espèces ont un probabilité d'interaction qui va dépendre du trait matching. Il n'y a donc aucun besoin de rajouter une couche d'échantillonnage artificiel dessus. Ça n'a aucun sens biologique.
Cependant je ne pense pas que ça change la distribution au final, on a juste plus moyen de donner un poids plus ou moins important au trait matching en comparaison à l'effet neutre

## 4 avril
regarder les Max Likelihood Estimators ( $\Leftrightarrow$ Max A posteriori Estimation) pour poisson et la loi binomiale pour s'assurer que l'on fait bien la bonne chose. (donc c'est un peu de stat bayésiennes et normalement vu que mes supposition ne me semblent pas aberrantes sur les distributions ça permet de s'assurer que c'est la meilleur estimateur et que ça converge).

Aussi, vérifier si il n'y a pas moyen d'obtenir une décomposition de la matrice obtenue par le produit de tenseurs en appliquant une SVD dessus. Du coup je me tourne vers les tenseurs et j'essaie de comprendre ce que ça représente.  

## 5 avril

raisons pour lesquelles on ne peut pas reconstruire la matrice de trait matching de façon unique à partir de celle observée si on n'a pas d'autre porpriétés que le produit terme à terme de matching et abondance:
1. **Non-unique solutions**: For any given C, there could be multiple pairs of matrices A and B that would multiply element-wise to give C. This means that without additional constraints or information, you cannot uniquely determine A and B.
    
2. **Loss of Information**: When you perform element-wise multiplication (also known as Hadamard product) of two matrices A and B to get C, you lose the information about the original matrices. Each element of C is obtained by multiplying the corresponding elements of A and B, so you cannot recover A and B from C alone.
    
3. **Zeroes Mask**: Even if you know some elements of A or B are zeros, you cannot infer the exact locations of these zeroes from C alone, because a product of non-zero elements can still result in zero.

Contraintes que l'on a: les abondances sont des entiers naturels et le trait matching est des valeurs entre 0 et 1.

La SVD et donc la CA va décomposer la matrice en des produits de vecteurs pondérés. cependant, je ne pense pas pour autant que l'on puisse dire que l'on retrouve les traits d'origine vu qu'il n'ont pas été obtenus par une somme de produits de vecteurs. En effet, je pense que l'on peut bien se débarrasser du champ moyen en calculant des distances de Chi 2. Vu que le produit de la somme sur le lignes et les colones est le meilleur estimateur des abondances que l'on ai sous la main (même si il n'est pas incroyable) vu qu'il est bien perturbé par le trait matching et ça va devenir encore pire si le trait matching et les abondances sont corrélées, vu que 


Réunion avec Stéphane:
- faire des tests en simulant des données avec des fortes variances pour qu'il y ait beaucoup de similarité entre les lieux
- comparer les rangs des trait reconstruits par colonne vu qu'il sont normalisés par colonne pour la matrice de trait matching théorique et faire une correlation ou trouver une corrélation sur les rangs
- tester la reconstruction des traits à partir de la matrice de trait matching théorique pour vérifier empiriquement que l'on est bien capable de reconstruire les trait bien que je ne trouve pas de façon de le faire de manière calculatoire au vu de comment on calcule les affinités.

## 8 avril
Journée de séminaires étudiants à Laennec

## 9 avril
- [x] simuler données avec beaucoup de variance et tester la reconstruction de traits
	- done it so it actually works super well on the first axes with the first trait. However, it is slightly worse foe the second one and we can assume that would also be decreasing for other traits if there appended to be some.
- [x] regarder les correlations par colones
- [x] tester la reconstruction des traits en partant directement de la matrice de trait matching pour vérifier que la méthode de reconstruction fonctionne bien.
	- bah c'est pas terrible

nettoyage de mes fichiers (retirer ceux qui ne sont plus utiles) mais pas du contenu

est ce que je passe tout en log pour que le produit du matching des deux traits individuellement se transforme en une somme?

## 10 avril

procust pour la correlation entre les axes avec une rotation pres
relier beta div
vérifier qu'il y a bien un eigengap quand la correlation entre les traits et les axes est bonne
poser au propre ce que j'ai compris jusque là, sur le modèle, l'encodage via l'AFC qui est une méthode basée sur la SVD, qu'il y a l’émergence de modules quand les environnement

lire Interaction network rewiring and species’ contributions to community-scale flexibility

## 11 avril

continuer le compte rendu et essayer de comprendre pourquoi la CA fonctionne alors que l'on n'a pas une somme mais un produite dans le construction de la matrice de trait matching. 

Paperasse pour le GDR ecostat

## 12 avril 
J'ai essayé de comprendre si ça fonctionne bien pour la reconstruction du gradient mais je ne comprend toujours pas si c'est le cas. En tout cas, si nous avons des traits qui se recouvrent bien, même de la cas du trait matching théorique (ce que je ne comprend pas parce que dans ce cas là nous n'avons pas de vrais 0 donc il ne devrait pas y avoir de problèmes normalement).
Si on a aussi un ratio entre les deux gradient suffisamment faible, on arrive bien à différencier et ordonner les gradients et dans ce cas là, on reconstruit aussi mieux les traits. mais c'est un paramètre qui a moins d'impact que mean_tol pour les traits 

avec mean_tol = 0.5

On peut imaginer que si nous sommes bien dans le cas d'un produit au lieu d'une somme pour le trait matching, dans ce cas là peut-être que l'on arrive quand même à reconstruire quelque chose qui ressemble de loin aux traits et que quand on fait une correlation, ce n'est pas trop mal. 
Sinon, ça fonctionne bien en le transformant le produit en somme mais je ne comprends pas pù ça se fait.

**Hypothèse :**
En même temps si on garde l'hypothèse de la somme, ça fait juste que tout se ressemble et dans ce cas là si il y a le même poids pour les deux, alors je pense que l'on a juste quelque chose qui reconstruit les optimums et que ce sont quasi touts les mêmes, donc que ce soit une somme ou un produit, j'ai l'intuition que la correlation ne sera pas trop impactée lors de la reconstruction.

## 13 avril

Je ne comprends pas pourquoi mes correlations sont aussi faibles et pourquoi ça fonctionne , du coup je fais une pause dans les stats et je vais regarder la taille de l'hypervolume. occupé par les espèces.

Même si c'est gênant car vu qu'il 'y a pas d'eigengap, les premier axes no sont peut être pas représentatifs de l'organisation générale.


Pour ce qui est de trouver la taille de l'hypervolume, il semblerait que je doive trouver l'enveloppe convexe (convex hull) afin d'en trouver le volume.

des position différentes dans les différentes frames impliquerais des niche réalisées qui changeraient je pense dans le cas où l'on reconstruirais parfaitement le trait matching dan,s les premiers axes.

compte rendu réunion: 
- [x] garder un nombre constant d'observations par simu quand on fait des varier le nombre de frames 
- [ ] essayer de reconstruire avec les paramètres de Lisa
- [ ] faire changer la hauteur des pics des abondances pour regarder si ça change le drop quand on augmente mean_tol_env
- [ ] regarder la connectance (nombre d'interactions observées / nombre interactions possibles pour le réseau binaire)
- [ ] représenter les réseaux avec le package bipartite pour faire le lien avec les études actuelles en écologie (avec visweb je crois)
- [ ] implémenter les mesures de beta div
- [ ] checker si le hull n'est pas trop sensible aux outliers et si c'est le cas, plutôt calculer les distances des espèces dans les frames par rapport à leurs barycentre (ou distance au carré) plutôt que le hull (ça reviendrait à calculer quelque chose d'analogue à une variance).

## 16 avril

résolution mauvaise implémentation de delta dans le package de génération de réseau

En profiter pour implémenter le cas où on n'a que un réseau

Aussi, on dirait qu'il n'y a pas de clusters biens démarqués non plus, alors que l'on s'attendait à quasi avoir un cluster par frame ou alors il faut vraiment beaucoup forcer le trait et avoir  peu de frames, une tolérance env très faible et un nombre d'observations élevé.

## 17 avril

les résultats sont vachement mieux la seule modif que j'ai faite est de mettre delta à 0.2 et on a des corrélations de l'espace

En refaisant les simulations avec les paramètres de Lisa, j'obtiens des résultats similaires! Il n'y a donc pas d'erreur de code obvious au moins!

| parameter   | mean_tol_env | ninter | ratio_grad           | nb_frame | mean_tol traits | delta         |
| ----------- | ------------ | ------ | -------------------- | -------- | --------------- | ------------- |
| correlation | +            | +      | tr1ax1:+<br>tr2ax2:- | -        | - étonnamment   | + 0.1 - 0.2 - |
Il faudrait voir le trade off entre nombre de frames et moyenne tolérance env avec genre une heatmap. On s'attends à ce que l'on ai une corrélation forte quand on a une frame ou quand on on a une moyenne de tolérance environnementale qui est assez élevée et que plus on a une une séparation en modules marquée, ce qui signifie que l'on a  des groupes d'espèce qui interagissent intra groupe mais pas inter groupe, alors on reconstruit pas bien les traits car on va avoir une axe par compartiment. C'est à dire quand on a peu de frames (mais pas seulement 1) et une variance faible.

![Mean correlation depending on the number of frames and the environmental niche tolerance for trait 1](corr_tol_env_frame_1.png)
![Mean correlation depending on the number of frames and the environmental niche tolerance for trait 2](corr_tol_env_frame_2.png)

On observe donc bien ce à quoi on s'attendais et encore mieux, la reconstruction du gradient est meilleure quand on a une variance importante pour les niches environnementales et que l'on a suffisamment de frames que quand on a une seule frame. Cependant, c'est probablement dû à une puissance d'échantillonnage plus importante. Mais même en gardantr la même puissance d'échantillonnage mais en la répartissant, on a une meilleure reconstruction sur le trait 1 et une moins bonne sur le trait 2.

Ma supposition pour expliquer la largeur de la niche environnementale impacte la reconstruction même quand on a une seule frame, est que les espèces peu présentes à l'endroit de l’échantillonnage et ainsi une largeur de niche plus importante permet peut-être d'avoir une meilleure représentativité dans la frame et diminue le biais d’échantillonnage.


## 18 avril

Je pense que les seuls paramètres qui n'ont pas une relation monotone avec la corrélation nb_frames. Il semblerait aussi que ratio-grad ait une relation monotone mais que ce soit décroissant pour le trait 1 mais décroissant pour le trait 2.

| param               | mean_tol_env | mean_tol trait | ratio_traits | $\delta$ | nb_frames | ninter tot                 |
| ------------------- | ------------ | -------------- | ------------ | -------- | --------- | -------------------------- |
| "opti" set of value | 0.7          | 0.1            | 0.5          | 0.1-0.2  | 5         | $n_c \times n_r \times 10$ |

maintenant je regarde pour les calculs de distances au iso barycentres (quand les points ont tous la même importance). Ce n'est en fait que la moyenne sur chacun des axes

Pour faire ça, je calcule la distance au barycentre en utilisant la distance euclidienne:
$$Euclidian\_dist = \sqrt{(x_i-x_G)^2 + (y_i-x_G)^2}$$
and Then we check the variance and the mean of these distances of these distances. The CV coefficient.

## 19 avril

réflexion sur la quantification du rewiring entre les frames.

ponderer le barycentre avec les valeurs propres des axes.
Quelle transformation pour donner un poids important aux valeurs qui 
Quelle est la meilleure métrique pour le rewiring: la variance de la distance, la distance moyenne, le coefficient de variation?
En même temps, ce que l'on veux, c'est quelque chose de sensible aux outliers vu que l'on veux obtenir le rewiring.
Au moins, quand l'un des axes est non informatif sur une espèce, ça fait juste que la distance sur cet axe là sera nul dans toutes les frames.
est ce que on pourra vraiment comparer les valeurs entre les différentes espèces?
test de normalité?

Mon problème majeur est que je ne connais pas la distribution initiale. Et en regardant axe par axe, on s'attend à avoir une distribution suivant $\lvert \mathcal{N} \rvert$  pour la distance au sein d'une même espèce.
On s'attend à trouver de plusieurs modes ou bien un unique mode qui n'est pas centré sur 0 dans le cas où il y a du rewiring. Cependant quand on fait la somme sur plusieurs axes, la distribution va tendre vers une loi normale à cause du **théorème central limite**. Du coup je ne sais pas comment le détecter vu que la distance c'est $\sqrt{\sum diff ^ 2}$ 

Du coup il faut probablement prendre les axes séparément.

## 22 avril

En posant les maths, La distance va bien tendre à suivre une lois normale à cause du théorème central limite quand on a de plus en plus de dimension prises en compte.  De plus, en supposant que l'on a suffisamment peu de dimensions pour assumer que la distribution ne suit pas une loi normale centrée en 0 (ce qui n'est déjà pas le cas quand on a deux dimensions)

## 23 avril

Je me suis replongé dans les stats pour essayer de trouver comment traiter les coordonnées obtenues pour chaque espèces.

plutôt que d'essayer de la trouver  partir de la distribution des distance, il est peut-être plus facile de faire un test de "multi-normalité" qu'il faudrait trouver et qui permettrais pour chaque axes de vérifier la normalité des données ou plutôt la $|\mathcal{N}|$.

ou alors abandonner et se dire que le fait que l’hyper-volume soit sensible aux outlier est une bonne chose est que cela peut permettre de faire une présélection d'espèces suspectées de rewiring que l'on pourra vérifier manuellement mais ce n'est pas terrible sur le point de vue reproductibilité.

Je regarde du côté de l'ANOVA, ce serait pas mal mais cela suppose la normalité de nos échantillons, hors ce n'est justement pas le cas en cas de rewiring.

Il faut donc bien un test de normalité: l'approche  fréquentiste me semble plus simple que la bayésienne, je vais donc commencer par creuser dans cette direction.

Kolmogorov-Smirnov n'est pas mal mais il ne fonctionne que pour comparer deux distributions entre elles , e, soit ce qui pourrait être fait, ce serait de comparer à la loi normale multidimensionnelle.

## 24 avril

Le problème de Kolmogorov, c'est que le nombre d'échantillons auquel on a accès est trop petit, et que plus on va avoir de dimension, plus il va être dur de détecter la non normalité des échantillons mais cela n'empêchera pas d'obtenir des résultats cool si on a des données simulées qui avec beaucoup de frames. 
Le fait que nous n'aillons pas les paramètres est un peu gênant et du coup on peut peut-être les estimer en se basant dur la moyenne et l'écart type de des niches que l'on obtiens.

It is based on the distance of the Cumulative Density Functions


## 25 avril

découverte de small margin layout du package memoiR qui pourrait permettre de rédiger mon mémoire de master si je ne le fais pas sur latex ou bien même mes slides pour ma présentation.

## 26 avril

Pour tester la multinormalité des échantillons, il y a des packages dédiés tels que MVN qui a trois méthodes:
- Mardia: qui cible skewness et kurtosis
- Henze-Zickler qui calcule la distance entre les deux fonctions de distribution
- Royston qui est basé sur le test de Shapiro

Il y a aussi MVN Bayesian à regarder

Une somme de k lois normales indépendantes au carré correspond à une loi du $\chi^2$ 

Réunion avec Stéphane:
- **regarder la multinormalité c'est pas giga utile**, juste la variance/moyenne des distance ça suffit et du coup il faudrait le faire sur le li qui n'a pas les variances normalisées.
- Il faut que je regarde la beta-div avec le papier de fründ et la contribution par espèce avec l'article de Toju et al
- ensuite on pourrait controller les espèces faisant du rewiring en leurs attribuant une variance de niche environnemental large


## 6 mai

Dans l'AFC, $li / $co ont une variance de $\lambda$ et $l1 / $c1 ont une variance de 1
j'ai donc regardé la distribution des variance et je veux essayer de détecter les outliers. Cependant, la distribution des variances n'est pas normale mais "fat-tailed", du coup je me renseigne sur comment avoir une méthode systématique qui puisse me permettre de pouvoir les détecter.


## 7 mai

ne pas oublier que quand largeur de niche augmente, la performance diminue car les abondances des espèces diminuent.

regarder la distance de jaccard sur le turn over des espèces pour un même conso sur les différentes années et avec les différentes espèces puis faire la somme des distances
ploter la variance selon la distance et on peut faire varier la taille des pts selon la taille de l'échantillonnage


Hum, je ne m'attendais pas à ça, il semblerais que peu d'observations mènent à un indice de dissimilarité fort et à une variance des positions sur l'AFC plus importante

## 10 mai

- [ ] look at the variance of the position depending on the Jaccard dissimilarity of diversity of the species it is interacting with
	- The thing that bothers me is that we are checking the Jaccard dissimilarity and then comparing it to the variance in one axis at the time whereas it should be done on both axis at the time. Some can have a big variance in one axis and stay still in the second one
- [ ] look at the $\beta$ diversity/contribution of the species (look at the Japanese article) and the link with the 

# Todo list

- [ ] ajouter une légère correlation entre de certains traits avec le gradient environnemental.  **Il y a un lieu entre largeur de niche et le degré de spécialisation, plus un individu à des traits "tolerant" plus il pourra s'adapter à des environnements différents et aura une niche large** Pour répondre à ça: "*Abundance and generalisation in mutualistic networks: solving the chicken-and-egg dilemma*" et faire en sorte que les généralistes soient plus abondants ou que il y ait au moins un lien entre les deux
- [x] ne plus trier en fonction des optimums de niche théoriques mais en fonction de leurs ordre sur le premier axe de l'AFC. En théorie même résultat mais c'est ce que l'on ferait sur des données de terrain.
- [ ] différentes approches comme AFC, métriques (nestedness, motifs, modularity, degree moyen), beta div afin de comparer des réseaux
- [ ] lire bersier et al 2012 et abundances and generalization in mutualistic networks solving the chicken and egg dilemma
- [x] Il y a encore une correlation entre généraliste et en moyenne une plus faible abondance vu que j'utilise dnrm. Il faudrait donc fixer le max et ensuite multiplier par le dnorm selon la variance. Ainsi pour fixer le pique, ce serait peut-être bien de  faire dnorm/dnorm_max
- [x] regarder les connected components et travailler seulement sur la composante géante
	- [x] pour ça regarder is.connected et components (pour obtenir les connected components) dans le package bipartite.
- [ ] teste et regarder les papiers notamment en physique sur l’émergence de la composante géante (aussi appelée percolation)
- [ ] tester d'aller au delà de la limite de percolation dans les simulations


inférer le vrai réseau et comparer en se basant sur le vrai réseau obtenu avec l'AFC et monter que même si le réseau observé est différent, le trait matching est similaire

données caradonna

correlation entre le co / le li et les traits

jouer avec le delta et peut être les faire varier (genre les fixer à 0 pour la moité) et regarder si il est toujours possible d'obtenir le trait matching à partir de ça.





- [ ] reprendre simu et garder giant connected

- [ ] est ce que les espèces interagissent de manière random ou non et pouvoir quantifier le changement de role des espèces entre les réseaux

- [ ] regarder la variance des interactions entre espèces en regardant le nombre d'interaction selon les abondances des deux espèce (le proxy, ce serait le nombre d'interactions observées pour chacune des espèces) regarder si juste effet ligne + effet colonne ou si autre effet

- [x] attention, haute moyenne = plus haute variance

- [ ] puis regarder si le rôle change

- [ ] regarder si les abondances des autres personnes avec lequel il interagit varie: regarder le turnover des abondances

- [ ] regarder ce qui change 

- [ ] regarder quel est les points qui sortent toujours de l'AFC 

- [ ] regarder si les proportion entre les espèces restent constante 

frund distance beta st distance sur le gradient environmental, regarder sensibilité au delta
beta os correspondrait au rewiring et serait donc attendu proche de 0, si on peut montrer qu'il est observé dans des réseaux générés dans lesquels il n'y a pas de rewiring: bingo!
regarder méthodes etude rewiring

quest que le rewiring 
méthodes usuelles analyse rewiring (mesure de beta)




- [x] regarder la correlation entre les traits plantes avec les lignes obtenues
- [x] même chose pour le colonnes et les traits des pollinisateurs
- [ ] regarder la corrélations des moyennes avec les axes avec des boxplots quand on fait plusieurs tirages
	- [ ] **étudier la dépendance de ces correlations avec les paramètres d'entrée**
- [ ] faire une heatmap afin de comparer le trait matching th avec celui reconstruit
- [ ] faire varier delta et évaluer l'impact sur la capacité à évaluer les traits
- [x] corréler un/les traits au gradient environnemental: $t_2=a^2t_1+(1-a)^2*\epsilon$
- [ ] trouver des métriques telles que le nombre d'espèces aillant leur trait moyen à l’intérieur de deux écarts types ($\Leftrightarrow 95.45$), et regarder ensuite le lien avec le changement de role (position dans l'AFC) selon la largeur de la niche.
- [ ] **Ce qui nous intéresse, j'ai plus l'impression que c'est la matrice de trait matching plutôt que de retrouver les trait donc si on arrive à quasi la reconstruire, c'est gagné même si les traits sont répartis entre les 2-4 premiers axes tant que l'on arrive à reconstruire le trait matching th**
- [ ] regarder le "volume" en n dimension occupé par l'espèce pour voir le changement de rôle dans les différentes frames
- [ ] Essayer de trouver un moyen de connaitre % d'explication des axes pour l'AFC
