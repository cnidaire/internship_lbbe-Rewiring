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
