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

"Furthermore, I argue that the term rewiring is not well defined in network ecology and that there are reasons why both methods overestimate the importance of rewiring, in particu- lar with quantitative networks."

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

"Climate change can trigger the formation of novel interactions, a process referred to as interaction rewiring, and secondary extinctions following the loss of irreplaceable interaction partners. Both processes are shaped by matching traits that determine the compatibility between co-occurring species in ecological networks. **These can be morphological, physiological, and chemical properties of species. For instance, the size of fruits and the gape width of frugivores, or the depth of flowers and the tongue length of pollinators, determine the occurrence and effectiveness of interactions**, as well as the specificity of the interacting species. **Important physiological matching traits between species are visual and olfactory signals. Prominent chemical matching traits of plants are secondary metabolites that play an important role in plant defense against specialized and generalized insect herbivores.** Generally, specialized species are 
more prone to secondary extinction than generalists because they depend on specific interaction partners and are more strongly affected by interaction loss than generalists. However, interaction rewiring with other species (e.g., with those immigrating into a community) could mitigate the risk of secondary extinction. Examples from species invasions actually show a great potential of many plants and animals to form novel interactions. A reorganization of interactions in ecological networks can also result from direct effects of climate change on animal behavior, such as changes in feeding rates in response to warming and elevated atmospheric CO2, or from direct effects on plant traits, such as changes in the phytochemicals contained in nectar, pollen, and plant tissue. Such changes of phytochemistry have been shown to modify the interaction outcome from beneficial to detrimental in plant–herbivore interactions and could have cascading effects on higher trophic levels. Increasing temperatures can also trigger evolutionary changes in matching traits, such as in the tongue length of bumblebees in response to changes in resource availability."

## Résumé:

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
