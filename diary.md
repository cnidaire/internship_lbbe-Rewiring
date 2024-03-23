e./# Journal de bord
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

# 21-22

- fixer les gradients de traits et environmental entre 0 et 1
- remise au propre du packet
- filtrer la composante géante sur les données simulées

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
- [ ] filtrer les espèces qui n'interagissent qu'avec une seule personne pour ne garder que la composante géante
- [ ] regarder la corrélations des moyennes avec les axes avec des boxplots quand on fait plusieurs tirages
- [ ] faire une heatmap afin de comparer les 
- [ ] faire varier delta et évaluer l'impact sur la capacité à évaluer 
- [ ] corréler un/les traits au gradient environnemental: $t_2=a^2t_1+(1-a)^2*\epsilon$
- [ ] trouver des métriques telles que le nombre d'espèces aillant leur trait moyen à l’intérieur de deux écarts types ($\Leftrightarrow 95.45$), et regarder ensuite le lien avec le changement de role (position dans l'AFC) selon la largeur de la niche.


- [ ] regarder ma distribution des corrélation entre traits et les premiers axes de l'AFC selon la puissance d’échantillonnages
- [ ] **Ce qui nous intéresse, j'ai plus l'impression que c'est la matrice de trait matching plutôt que de retrouver les trait donc si on arrive à quasi la reconstruire, c'est gagné même si les traits sont répartis entre les 2-4 premiers axes tant que l'on arrive à reconstruire le trait matching th**
- [ ] faire des heatmap pour comparer le trait matching th avec celui reconstruit
- [ ] regarder le lien entre le changement de rôle et la largeur de la niche ou du nombre d'espèces aillant leurs otpimum dans les $2\sigma$ 
- [ ] faire varier $\delta$ pour voir si les traits sont aussi bien reconstruits (même graphes que pour la puissance d'échantillonage mais avec $\delta$)
- [ ] regarder le "volume" en n dimension occupé par l'espèce pour voir le changement de rôle dans les différentes frames
- [ ] 