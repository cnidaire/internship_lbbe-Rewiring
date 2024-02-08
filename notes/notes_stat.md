# 2 kinds of methods:

## 1) Descriptive

### Principal Component analysis (PCA/ACP)

transform the correlated variables into new variable uncorrelated one with another: principal components. It enable to reduce the number of variable and recap the information (underline the most important ones).

On continuous data

### Correspondence analysis (AFC: analyse factorielle des correspondences)

**Le truce sur lequel je vais bosser**

conceptually similar to ACP but rather applies on categorical data. If more than two categorical variable: multiple correspondence analysis.


### Factor analysis (Analyse factorielle)

a method used to describe an ensemble of variables thanks to latent variables (non-observed ones) In order to reduce the number of variables, the methods compute these variables as a linear combination of observed variables.

### Cluster analysis



### Multidimensional scaling

### Iconography of correlations

## 2) Explicative

### Linear regression

### ANOVA


# AFC / Correspondence analysis

## Structure data

on columns:environment
on rows: individuals

## Independence model

usually, it is assumed that the columns and the rows are independent, hence the joint probability of independent event is the product of the marginal probabilities: P(A & B) = P(A) x P(B)

## Test $\chi^2$

$$\chi^2_{obs} = \sum^I_{i=1}\sum^J_{j=1}\frac{(eff_{obs}-eff_{th})^2}{eff_{th}}$$

## Questions

so CA is based on $\chi^2$ distance unlike the PCA that is based on euclidean distance apparently

# General principle for ACP and others?

matrice de correlation
valeurs et vecteurs propres, puis classer les valeurs propres par ordre décroissant et ainsi on obtient les vacteurs propres correspondant qui sont les composantes principales.

mode of information in ecology (chap7):

![](mode_of_information.png)

# Ecological resemblance

Several reasons may preside to the absence of a species from a site, besides
unimodal distributions and niche optimality. Species are known to occur in suboptimal environments, especially when they are subjected to competition. So, the niche of a species may be present in one (or both) of two sites but be occupied by substitute species. Absence may also be the result of the dispersion pattern of a species, historical events, or, more simply, stochastic sampling variation.