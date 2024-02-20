# Adaptive rewiring aggravates the effects of species loss in ecosystems

ability of consumers to rewire to novel prey should mitigate the consequences of species loss by reducing the risk of cascading extinction

Here, rewiring due to the initial failure of one node

hence either change of the strength of relation with other species or formation of new links



# Questions:

How can we be sure when we are looking for a way to characterize rewiring from the data that the thing we are observing are indeed some rewiring?

# Rewiring biological explanation:

Many examples in Beyond species, in section "The basic processes"

- one interaction can allow new interactions to happen, for example, the case opportunistic pathogens that have a greater success of infection in host that are already immunocompromised by other infections. (from beyond species: Poisot et al, originally from Olivier 2012).
- The turnover of some species can lead to rewiring and it seems like it is the most commonly considered case. The disappearance of a species can lead the species that where interacting with it to create new connections with other already existing species of the network.
- The opposite is also true, the apparition of a new specie will most likely lead to new connection with the other species of the network and possibly make some other disappear. The most common example is the one of invasive species.

It can be due not to the disappearance a species but just different phenology or a shifted one, due to the modification of the environment for example.

I am not sure of when is the limit to stop talking about rewiring, because some mechanisms can have an impact on the strength of an interaction without leading to a complete disappearance.

In *"Food web rewiring in a changing world"*, discuss about two kind of rewiring:
- **topological rewiring**: mobile generalist species will redistribute in systems where they were previously absent and foraging on new preys. One of the potential effects can be increasing the connectance and decreasing the modularity (Kortsh et al 2015).
- **interaction strength rewiring**: mobile generalist species that navigate between habitats and ecosystems to forage will shift their relative use of differentially altered habitats and ecosystems.


They are al
# Dataset

Apparently, there is the dataset from Shleuning et al, 2011,2012 for spatially-replicated dataset.
And Menke et al 2012 for the temporally-replicated dataset.

Guzzo et al, 2017: data of foraging and lake temperature over 11 years

# Application

Can enable to indicate imminent collapse of one or more species.

Predict impact of climate change on the world's ecosystems.

# Main point of interest when studying interactions:

- diet of the species
- their ability to move

# Important points

- be careful, the rewiring isn't only about who is eating who, there is complex interactions with the soils, plants, microorganisms, parasites, etc. And the nature of these interactions is not restricted to prédation, it can be different like competition (or just bothering one another, or maybe even mutual aid (facilitation) however it is not so hard to represent in a topological network, but in a weighted one, it can be harder, because we can not talk in frequencies.

Hence it can be hard to quantify all the relations as the nature can be really different, even inside of the same kind, two animals will not eat as much. So it is getting really complex

- never forget that even plants are able of migration and are able of adaptation
- rewiring are mainly initiated by two causes (a bit entangled/linked):
	+ modification of the environment:
		* warming
		* pollution
		* others
	+ anthropologic causes:
		* they talked about an Indian city that is growing and nature has to adapt. An other example I thought about is about COVID, where a virus from pangolin was brought in contact with humans and created and new interaction.
		* hunting (personal guess)
		* deforestation like in Brasil (personal guess)
- The responses modification of the environment (the most treated subject) are:
	+ migration, either to find new food in other locations or to escape harsh conditions (such as heat, this works for terrestrial and marine environments).
		* it can then lead to rewiring
	+ rewiring:
		* topological
		* interaction strength
		
# Définitions

## Analyse spectrale de graphe

## Niche écologique

Grinnell :
- tout ce qui conditionne l’existence d'une espèce à un endroit donné, ce qui inclut les facteur abiotiques (T, humidité, précipitations),  comme des facteurs biotiques (nourriture, compétiteurs , prédateurs, abris, etc)

Elton:
- la place qu'occupe une espèce dans les chaines trophiques, bien que d'autres facteurs tels quel le micro-habitat puissent être inclus.

# État de l'art sur le rewiring

Ce dont Vincent a peur c'est que en disant que l'on ne prend en compte que les traits et l'abondance en compte, ce serait ignorer le facteur préférence et habitude. C'est possible aussi mais j'ai eu l'impression que Stéphane regroupait le facteur préférence sous  le trait matching aussi. Et vu qu'il est possible de faire du trait matching en compte, il serait possible que le facteur goût soit pris en compte mais qu'en est il de la notion d'habitude? De plus on ne prend pas en compte la notion de competition et ce serait bien de la quantifier avant de l'écarter.

**Une façon de le tester serait d'essayer de trouver un cas où on observe une pollinisateur dont les interactions sont modifiées bien que les abondances restent inchangées (dans le cas de pollinisation, il faut prendre en compte la phénologie car les abondances des plantes peut rester identique mais ne pas rester en activité).**

[[ecolett-caradonna2017_interaction_rewiring.pdf| CaraDonna 2017]] :
Species interaction networks are constructed from temporally aggregated interaction data -> assume interaction are fixed -> obscurs timescale at which interactions form or dissolves

_rewiring:_ the reassembly of interactions among species
"interaction rewiring: interactions are reassembled over time because of changes in who is interacting with whom among the same pool of co-occurring species"
and here, they make a distinction with turnover which would correspond to the variation in abundance we were talking about.

[[Ecosphere - 2021 - Fründ - Dissimilarity of species interaction networks  how to partition rewiring and species turnover.pdf|Fründ 2021]] :
"[...]it has been suggested to partition network dissimilarity into one component driven by species turnover, that is, changes in community composition, and another component reflecting rewiring, that is, flexibility of interactions among shared species."

"Furthermore, I argue that the term rewiring is not well defined in network ecology and that there are reasons why both methods overestimate the importance of rewiring, in particular with quantitative networks."

[[jae-vizentin2023_rewiring_extinction.pdf|Vizentin-Bugoni 2023]] :
"Their main hypothesis postulated that the loss of a highly connected species would lead to interaction rewiring and niche expansions by hummingbirds, decreasing individual, species and network specialization. However, they found that the overall structure of the plant-hummingbird networks remains mostly unaltered, with limited rewiring and minimal changes in specialization. "

"The limited change in species interactions highlights that network stability through interaction rewiring may have been overestimated in previous studies, calling for further manipulative studies in the field. At the same time, it also indicated that even the loss of a highly abundant plant species has an overall small effect on network structure."

**À RELIRE, JE 'AI PAS TROP COMPRIS**

[[naturecom-gilljam2015_simulation_rewiring_overexploitation.pdf|Gilljam 2015]] :
rewiring: "an ability of consumers to rewire to novel prey should mitigate the consequences of species loss by reducing the risk of cascading extinction"

"Two possible mechanisms that may buffer against bottom-up driven secondary extinctions in ecological networks are the forming of new feeding links (rewiring) and compensatory readjustment of flows through remaining links"

"Earlier studies on rewiring in ecological networks are mainly based on a static (topological) approach that do not consider population dynamics "

[[natureecoevo-bartley2019_rewiring_generalist_climatechange.pdf|Bartley 2019]] :
"topological rewiring — a change in the patterning of food webs due to the addition or loss of connections."

"strength rewiring — changes that reroute energy and carbon flows through existing food web connections and alter the food web’s interaction strengths."

[[Poisot, Stouffer, Gravel - 2015 - Beyond species why ecological interactions vary through space and time.pdf| Poisot 2015]] :
Ne contient pas le terme rewiring

[[schleuning2020_trait_based_assessementof_climate_change.pdf|Schleuning 2020]] :
"Interaction rewiring: the formation of novel interactions between species that previously did not interact, usually because these species did not overlap in their spatial or temporal occurrence. Special cases of rewiring are ecological or evolutionary changes in matching traits, which result in novel interactions between species that currently co-occur, but cannot interact"

"Climate change can trigger the formation of novel interactions, a process referred to as interaction rewiring, and secondary extinctions following the loss of irreplaceable interaction partners. Both processes are shaped by matching traits that determine the compatibility between co-occurring species in ecological networks. **These can be morphological, physiological, and chemical properties of species. For instance, the size of fruits and the gape width of frugivores, or the depth of flowers and the tongue length of pollinators, determine the occurrence and effectiveness of interactions**, as well as the specificity of the interacting species. **Important physiological matching traits between species are visual and olfactory signals. Prominent chemical matching traits of plants are secondary metabolites that play an important role in plant defense against specialized and generalized insect herbivores.** Generally, specialized species are more prone to secondary extinction than generalists because they depend on specific interaction partners and are more strongly affected by interaction loss than generalists. However, interaction rewiring with other species (e.g., with those immigrating into a community) could mitigate the risk of secondary extinction. Examples from species invasions actually show a great potential of many plants and animals to form novel interactions. A reorganization of interactions in ecological networks can also result from direct effects of climate change on animal behavior, such as changes in feeding rates in response to warming and elevated atmospheric CO2, or from direct effects on plant traits, such as changes in the phytochemicals contained in nectar, pollen, and plant tissue. Such changes of phytochemistry have been shown to modify the interaction outcome from beneficial to detrimental in plant–herbivore interactions and could have cascading effects on higher trophic levels. Increasing temperatures can also trigger evolutionary changes in matching traits, such as in the tongue length of bumblebees in response to changes in resource availability."

## Trouvailles perso

[[D'Alelio et al. - 2019 - Rewiring and indirect effects underpin modularity .pdf|D'Alelio 2019]] :
"Food web re‐adjustments are both direct, through the rewiring of trophic‐interaction networks, and indirect, with the recon‐ figuration of trophic cascades."

[[Leimberger et al. - 2023 - Plant–hummingbird pollination networks exhibit lim.pdf|Leimberg 2023]] :
"When resources become scarce and intraspecific competition increases, optimal foraging theory predicts that individual animals become less choosy about the resources they consume (Emlen, 1966; Fontaine et al., 2008)."

"On average, camera networks reflected 3.05 times more network- level specialization than pollen networks"

Specialization: **J'ai un gros doute, il font 14 de tests et il trouvent que il y en a deux où c'est significatif mais franchement pas de beaucoup vu la barre d'erreur. Or quand on fait un test, on fixe un seuil, ici 95%, donc en fait on s'attend que sur 20 test, il y en ai un qui soit significatif par erreur. Donc j'ai un peu un doute sur la méthodologie**

"we found only modest evidence that hummingbirds altered their foraging behaviour, suggesting that pollinator for - aging flexibility (rewiring) might not be the only mechanism enabling robustness in real- world mutualistic networks. If rewiring is constrained, perhaps other mechanisms (e.g. high pollinator mobility or energy- saving adaptations) facilitate short- term species persistence and prevent co extinction cascades after species loss. If rewiring remains limited over extended time scales, however, local extinctions could still potentially trigger network collapse."

[[MacLeod et al. - 2016 - Measuring partner choice in plant—pollinator netwo.pdf|MacLeod 2016]] :
"Observed variation in partner choice over time could be caused by either deterministic factors such as species interactions, or stochastic factors related to the relative abundances of plant and pollinator species. An inexact analogy can be drawn with the "niche vs. neutral" debate in ecology; very briefly, niche (deterministic) and neutral (stochastic) effects are contrasting, but not mutually exclusive, explanations for patterns found in ecological communities (Hubbell 2001, Chase and Leibold 2003). In studies of plant-pollinator networks, niche effects include species traits of both plants and pollinators as well as pollinator behaviors such as foraging plasticity that respond to changing resources (Vázquez et al. 2009a, Beckerman et al. 2010, Brosi and Briggs 2013). Neutral effects, in contrast, result from demographic and sampling pro- cesses that are not dependent on species identities, such as the richness and abundance of plants and pollinators"

"However, a similarly rigorous analysis of variation in partner choice over time is lacking, and existing terminology does not properly differentiate niche and neutral effects. The term "rewiring" is used to mean the ability of pollinator species to change its foraging preferences over time, presumably in an adaptive way, i.e., as a niche effect (Kaiser-Bunbury et al. 2010). However, rewiring has been previously defined to occur when both members of a plant-pollinator species pair are present from year to year, but do not interact every year (Alarcón et al. 2008, Petanidou et al. 2008, Dupont et al. 2009, Kaiser-Bunbury et al. 2010, Olesen et al. 201 1, Carstensen et al. 2014), an outcome that includes both niche and neutral effects. In particular, previous definitions of rewiring do not account for how yearly shifts in the abundance of plants and pollinators affect the probability of detecting an interaction in each year"

**"we define rewiring as changes in pollinator species' partner choice over time that are greater than those predicted by a null model that assumes random interactions between plant and pollinator species within each year, conditioned on the relative abundance of each plant and pollinator species in each y"**


[[Tylianakis et Morris - 2017 - Ecological Networks Across Environmental Gradients.pdf|Tylianakis 2017]] :

"These gradients include natural gradients such as successional, climatic, habitat, elevational, patch size, and latitudinal gradients, and all types of human-induced changes in the environment, from climate change to species extinctions and invasion"

"For example, changes to species composition can affect the probability of interactions being realized."

"Three general mechanisms through which environmental changes influence networks, (a) **Changes to species composition**. Extinction and invasion of species and their interactions can alter network architecture. Specialists are more likely to go extinct, and invaders are often highly generalist, such that these processes increase the average number of links per species. Increases in abundance of some species increase their attractiveness and interaction frequencies, (b) **Changes that alter the probability or frequency of interactions** being realized. Some potential interactions are not realized because habitat structure inhibits location of some partners or because species do not overlap in space or time. Abundant species have higher encounter probability, (c) **Changes to co-evolutionary processes underpinning interactions**. The environment can alter the prevalence of interactions that contribute more or less to patterns of phylogenetic congruence and the co-evolutionary processes that can generate these patterns."

"Local habitat types (or other environmental gradients) will select certain species from the metanetwork on the basis of their traits (in this example, the agricultural field selects against large-bodied animals). Species traits can in turn determine their potential interactions  and the habitat's physical structure can limit the realization of potential interactions and can alter the influence of traits on interactions."

**J'ai l'impression que dans a partie rewiring, elle parle du rewiring comme quelque chose qui a été implémenté dans des modèles et qui donne des résultats inintéressants mais pas comme quelque chose qui a pu être modélisé et calqué sur la réalité**

"The trend to collect replicated networks means that those networks are often small, it is difficult to achieve sufficient sample sizes to characterize all the interactions present."

**"In fact, an important implication of frequent interaction rewiring is the possible overestimation of empirical network specialization measures and predicted vulnerability to extinction (based on simulated  extinction scenarios that do not include rewiring), as species may appear specialized at a particular point in time but in fact accumulate many interaction partners over longer timescales"**

**De ce qu'ils disent, j'ai l'impression que ce serait plutôt un biais d'échantillonnage et que les réseaux observés ne sont pas représentatif du réseau sous-jacent et que ainsi ce que l'on observe selon moi pourrait n'être dû que aux abondances plutôt qu'à un phénomène tel que le rewiring tel que les trois mécanismes cité plus tôt"

## Points importants

Dans l'article [[Petanidou et al. - 2008 - Long-term observation of a pollination network fl.pdf|Petanidou 2008]], L'un dé résultats est "many plant and pollinator appear as specialists in 1 year, but tend to be generalists or to interact with different partner species when observed in other years."
Donc ça me semble déjà dur de parler de rewiring du coup sur des séries de plantes pollinisateurs sachant que la "perte" et la "création" de nouvelles interactions n'est probablement due qu'au biais échantillonnage et ce qui fait qu'il serait dur de faire un lien de cause à effet.

Ce qui est redis dans cet article [[Benadi et al. - 2014 - Specialization and phenological synchrony of plant.pdf|Benadi 2014]]
"Our results show that even relatively specialized pollinators were much more flexible in their use of plant species as floral resources than their local flower visitation suggested."
"our results suggest that specialized **flower visitors select plant species based on certain floral traits such as the length of the nectar holder tube.** If that is the case, the observed flexibility of plant–pollinator interactions likely depends on a high degree of functional redundancy in the plant community, **which may not exist in less diverse systems.**"

**Bref, mauvaise idée d'utiliser les interactions plantes pollinisateurs**

## Articles citant Tylianakis

*Ecological networks are more sensitive to plant than to animal extinction under climate change*
"In the simulation, we further accounted for the potential flexibility of species in the choice of their interaction partners by reallocating a varying proportion of lost interaction events to persisting species."
**Si ce n'est que ça, alors c'est juste une histoire de changement de force d'interaction quand un lien fort disparaît, alors changement de proportions de cible potentielles et favorables, alors ce serait quelque chose comme un produit entre les abondances et à quel point les espèces sont favorable (représenté par le trait matching qui est la façon la plus facile de le représenter)**

*Adaptive Networks for Restoration Ecology*
Notion de "forbidden links" qui est intéressante mais incluse dans la vision que l'on a du trait matching pour la partie morphologie mais pas mismatch phénologie
"interaction rewiring: the reconfiguration of an ecological network arising from the establishment or cessation of pairwise interactions as a consequence of adaptive or stochastic processes."
En gros ils font la même chose avec des trait mais sans vraiment faire de trait matching et pour moi ça me semble moins bien que ce qui est fait avec des gaussiennes (encore faut-il pouvoir les obtenir, ce qui implique dans la réalité beaucoup de données).

*Dissimilarity of species interaction networks: quantifying the effect of turnover and rewiring*
pour eux, le rewiring est le fait que dans deux graphes contenante un sous ensemble d'espèce commune qui ont des interactions qui diffèrent dans les deux milieu. Ce serait cool car ce n'est pas incompatible avec la théorie que c'est juste des différences d'abondance.

*Rewilding ecological communities and rewiring ecological networks*
I refer to network rewiring as the establishment of novel ecological interactions, which will generally involve the introduced species, but also reconfigurations of the interaction network that occur as an indirect effect of a species introduction.



# Interrogation

Par contre je ne sais pas si plutôt que les abondances, ce serait les abondances relatives des espèces avec lesquelles elle peut potentiellement interagir, ce qui impliquerait la notion de devoir rechercher une nouvelle espèce mais ça il faudrait l'appuyer avec des articles et je n'en suis pas sûr.