Based on [[Lau et al. - 2017 - Ecological network metrics opportunities for synt.pdf|Lau 2017]] but there is actually way more, I just picked the one that seemed the most relevant.

**Whole network:**
- density
- centrality distribution
- centralization
- graph diameter
- modularity
- link density
- co-occurrence
- nestedness
- evenness
- diversity
- richness
- stability

**Groups/ sub-network:**
- motif
- food-chain length
- chain length
- average length path

**Node:**
- centrality
- degree
- eigenvalue centrality
- temperature (apparently measures the nestedness of  bipartite network)
- indicator species
- removal importance
- connectance
- trophic level

based on the [[doc_bipartite.pdf|bipartite r package]]:

**network level:**
- connectance
- web assymetry
- link per species
- number of compartiments
- compartiment diversity
- cluster coefficient
- nestedness
- weighted nestedness
- weighted NODF
- interaction strength asymmetry
- specialization asymmetry
- linkage density
- fisher alpha diversity
- interaction evenness
- shannon diversity
- H2, network wide specialization index

**group level:**
- number of species in respective trophic level
- mean number of links
- mean number of shared partners
- cluster coefficient
- checkerboardness
- v ratio
- discrepency: the number of links one would have to move to achieve perfect nestedness
- degree distribution
- extinction slope
- robustness
- niche overlap
- generality
- partner diversity
- effective partners
- functional diversity

**species level:**
- degree
- normalized degree
- species strength
- nested rank
- interaction for interaction push/pull
- Paired Difference Index
- resource
- species specificity
- Pollination Service Index
- Node Speciallisation index
- betweenness
- closeness
- Fisher's alpha diversity
- effective number of partners
- proportional generality
- proportional generality
- Bluthgen's discrimination/selectivity index

![[network_indices.png]]

based on [[Bersier et al. - 2002 - Quantitative Descriptors of Food-Web Matrices.pdf| Bersier 2012]]:

Basically the same as previously but with fewer that a better explained

# Métriques relevantes

| Metric                                | Explanation                                                                                                                                                                       | Origin    | related?                 |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | ------------------------ |
| web assymetry                         | the balance of the number of species in the two levels (Blüthgen et al., 2007)                                                                                                    | bipartite | yes                      |
| link per species                      |                                                                                                                                                                                   | bipartite | yes                      |
| number of compartiments               |                                                                                                                                                                                   | bipartite | yes                      |
| compartiment diversity                | (Tylianakis et al., 2007)                                                                                                                                                         | bipartite | bof                      |
| connectance                           | standardised number of species combinations’ in biogeographic analyses (Gotelli & Graves, 1996; Dunne et al., 2002)                                                               | bipartite | yes                      |
| cluster coefficient                   | which will compute both the network-wide binary, one-mode-based cluster coefficient as well as those for each level                                                               | bipartite | ?                        |
| nestedness                            | with the returned value indicating the ‘temperature’ of the matrix, which is low (0) for a perfectly nested matrix (Rodríguez-Gironés & Santamaría, 2006);                        | bipartite | != de nb compartiments ? |
| weighted nestedness                   | weighted interaction nestedness estimator’<br>(WINE), with 1 indicating perfected nestedness (thus exactly opposite to the previous<br>index) (Galeano et al., 2009)              | bipartite | bof utile je pense       |
| weighted NODF                         | as an alternative measure of quantitative nestedness, automatically correcting for matrix filling and also indicating nestedness by values towards 1 (AlmeidaNeto & Ulrich, 2011) | bipartite | ?                        |
| interaction strength asymetry         | quantify whether specialised species interact<br>with generalised ones in the other level                                                                                         | bipartite | yes                      |
| specialization asymetry               | following the same idea as the previous, but this being based on species specialisation in d′                                                                                     | bipartite | yes but ?                |
| linkage density                       | marginal totals-weighted diversity of interactions per species (Bersier<br>et al., 2002)                                                                                          | bipartite | ?                        |
| fisher alpha diversity                | diversity index based on fitting a Fisher-series                                                                                                                                  | bipartite | ?                        |
| interaction eveness                   | quantifies how balanced the distribution of interactions is across species, based on Shannon’s diversity                                                                          | bipartite | yes                      |
| alatalo diversity                     | as an alternative measure of interaction evenness, attempting to overcome some of the shortcomings of the previous, Shannon’s, version                                            |           | yes?                     |
| shannon diversity                     |                                                                                                                                                                                   | bipartite | yes                      |
| H2, network wide specialization index |                                                                                                                                                                                   | bipartite | ?                        |
| density                               | The proportion of possible edges that are actually associated with nodes; called Connectance in Food-web ecology                                                                  | Lau 2017  | linkage diversity        |
| centrality distribution               | Shape of the frequency distribution of edges among nodes                                                                                                                          | Lau 2017  | ?                        |
| centralization                        | The concentration (vs. evenness) of centrality among the nodes                                                                                                                    | Lau 2017  |                          |
| graph diameter                        | The longest path between any two nodes in a graph                                                                                                                                 | Lau 2017  | pas trophique            |
| modularity                            | Degree to which edges are distributed within rather than between distinct sets of nodes                                                                                           | Lau 2017  | yes but ?                |
| link density                          | Average number of edges per node                                                                                                                                                  | Lau 2017  | ?                        |
| co-occurence                          | Degree of overlapping spatial or temporal distributions of species relative to a null model                                                                                       | Lau 2017  | ?                        |
| nestedness                            | The degree to which interactions can be arranged into subsets of the larger community                                                                                             | Lau 2017  | yes                      |
| evenness                              | Deviation of the distribution of observed abundances relative to an even distribution among taxonomic groups in a community                                                       | Lau 2017  | nope                     |
| diversity                             | Distribution of abundances among taxonomic groups in an observed community                                                                                                        | Lau 2017  | nope                     |
| richness                              | The number of taxonomic groups in a community                                                                                                                                     | Lau 2017  | nope                     |
| stability                             | The change in the abundances of taxonomic groups across a set of observations                                                                                                     | Lau 2017  |                          |
