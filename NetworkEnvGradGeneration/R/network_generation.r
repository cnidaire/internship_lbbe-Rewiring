# Network generation from an environmental gradient
#
# The main goal is to first generate random niches for each species along the environmental gradient
# and then to generate a network using trait matching and the obtained abundances.
#
# This code is based on one developed by Lisa Nicvert (that you can find on her github:
# https://github.com/LisaNicvert/CA-network)  my only contribution is adding the environmental
# gradient part.
#
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


##################### Environmental Gradient and abundances along this gradient #####################

#' Environmental gradient and Species abundances
#'
#' @description
#' Generate the environmental gradient and abundances for the species along this gradient,
#' separately for the consumer and the resources.
#'
#' @importFrom stats runif rnorm dnorm rpois
#'
#' @param nb_resource Numeric, Number of resources in the bipartite network
#' @param nb_consumer Numeric, Number of consumer in the bipartite network
#' @param nb_location Numeric, Number of location along the gradient (i.e. number of networks)
#' @param know_env_grad_pos Boolean, If True: then evenly spaced sampling along the environmental
#' gradient, otherwise, uniformly drawn position along the gradient
#' @param mean_tol_env Numeric, Mean of the standard deviation of the niche tolerance for an environmental gradient between 0 and 1
#' @param sd_tol_env Numeric, Standard deviation of the standard deviation of the niche tolerance for an environmental gradient between 0 and 1
#' @param magn_res_min Numeric, Lower bound of the order of magnitude of size of a resource population
#' @param magn_res_max Numeric, Higher bound of the order of magnitude of size of a resource population
#' @param magn_con_min Numeric, Lower bound of the order of magnitude of size of a consumer population
#' @param magn_con_max Numeric, Higher bound of the order of magnitude of size of a consumer population
#'
#' @return List, Four arrays in a list containing respectively the resource and consumer abundance along the gradient,
#' and the theoretical distribution of the niches for the resource and consumer.
#'
#' @export
#'
#' @examples
#' abund_env_grad(nb_resource = 40, nb_consumer = 100, nb_location = 3,
#'                mean_tol_env = 1, sd_tol_env = 1)

abund_env_grad <- function(know_env_grad_pos = TRUE,
                           nb_resource = 40, nb_consumer = 100, nb_location = 3,
                           mean_tol_env = 0.1, sd_tol_env = 0.1,
                           magn_res_min = 20, magn_res_max = 200,
                           magn_con_min = 100, magn_con_max = 10000) {
  ### resource gradient ###
  env_grad_resource <- array(0, dim = c(nb_resource, 2)) # two col, 1st: mean, 2nd: sd
  # Generate environmental optima for each species
  env_grad_resource[, 1] <- runif(nb_resource, min = 0, max = 1)
  # Generate random niche widths for each species
  env_grad_resource[, 2] <- abs(rnorm(nb_resource, mean = mean_tol_env, sd = sd_tol_env))
  # Assign names
  dimnames(env_grad_resource)[[1]] <- paste0("res", 1:nb_resource)
  dimnames(env_grad_resource)[[2]] <- c("mean", "sd")

  ### Consumer gradient ###
  env_grad_consumer <- array(0, dim = c(nb_consumer, 2)) # two col, 1st: mean, 2nd: sd
  # Generate environmental optima for each species
  env_grad_consumer[, 1] <- runif(nb_consumer, min = 0, max = 1)
  # Generate random niche widths for each species
  env_grad_consumer[, 2] <- abs(rnorm(nb_consumer, mean = mean_tol_env, sd = sd_tol_env))
  # Assign names
  dimnames(env_grad_consumer)[[1]] <- paste0("con", 1:nb_consumer)
  dimnames(env_grad_consumer)[[2]] <- c("mean", "sd")

  ### Obtain abundances from a given position along the gradient ###
  if (know_env_grad_pos) {
    if (nb_location != 1){
      site_coordinates <- seq(from = 0, to = 1, by = 1 / (nb_location - 1))
    } else {
      site_coordinates <- 0.5
    }
  } else {
    site_coordinates <- sort(runif(n = nb_location, min = 0, max = 1))
  }

  ### Abundance Resource ###
  # Generate the magnitude of the abundance of resource species
  magn_res <- runif(nb_resource, magn_res_min, magn_res_max)
  # Generate abundances for each location
  abund_resource <- array(0, c(nb_location, nb_resource))
  for (site in 1:nb_location) {
    for (resource in 1:nb_resource) {
      abund_resource[site, resource] <- rpois(1, dnorm(site_coordinates[site],
                                                       mean = env_grad_resource[resource, 1],
                                                       sd = env_grad_resource[resource, 2]) * magn_res[resource])
    }
  }

  # Assign names
  dimnames(abund_resource)[[1]] <- paste0("loc", 1:nb_location)
  dimnames(abund_resource)[[2]] <- paste0("res", 1:nb_resource)

  ### Abundance Consumer ###
  # Generate the magnitude of the abundance of consumer species
  magn_con <- runif(nb_consumer, magn_con_min, magn_con_max)
  # Generate abundances for each location
  abund_consumer <- array(0, c(nb_location, nb_consumer))
  for (site in 1:nb_location) {
    for (consumer in 1:nb_consumer) {
      abund_consumer[site, consumer] <- rpois(1, dnorm(site_coordinates[site],
                                                       mean = env_grad_consumer[consumer, 1],
                                                       sd = env_grad_consumer[consumer, 2]) * magn_con[consumer])
    }
  }

  # Assign names
  dimnames(abund_consumer)[[1]] <- paste0("loc", 1:nb_location)
  dimnames(abund_consumer)[[2]] <- paste0("con", 1:nb_consumer)

  ### Results ###
  abundance <- list(
    abundance_resource = abund_resource,
    abundance_consumer = abund_consumer,
    th_distrib_resource = env_grad_resource,
    th_distrib_consumer = env_grad_consumer,
    magnitude_resource = magn_res,
    magnitude_consumer = magn_con
  )
  return(abundance)
}

##################### Trait matching matrix #####################

#' Trait matching matrix
#'
#' @description
#' Draw 2 random traits with different optimums and variance for each species and then induce a trait
#' matching probability for each couple of species in a Matrix.
#'
#' @importFrom stats runif rnorm
#' @importFrom mvtnorm dmvnorm
#'
#' @param ratio_grad Numeric between 0 and 1, Ratio between the first and second gradient
#' @param mean_tol Numeric, Mean of the standard deviation of the trait tolerance
#' @param sd_tol  Numeric, Standard deviation of the standard deviation of the trait tolerance
#' @param nb_resource Numeric, Number of resource in the bipartite network
#' @param nb_consumer Numeric, Number of consumer in the bipartite network
#' @param corr_env_trait Numeric, weight given on the correlation between the environment gradient and the trait one
#' @param trait_env_res Matrix, obtained from abund_env_grad containing the th traits of the resource
#' @param trait_env_con Matrix, obtained from abund_env_grad containing the th traits of the consumer
#'
#' @return List, Array containing the probabilities of species interactions only based on trait matching
#' and then 2 Arrays containing the trait distribution of both traits respectively
#'
#' @export
trait_match_mat <- function(ratio_grad = 0.8,
                            mean_tol = 0.1, sd_tol = 1,
                            nb_resource = 40, nb_consumer = 100,
                            corr_env_trait= 0,
                            trait_env_res, trait_env_con) {
  ### Initialize the gradient for axis 2 ###
  # The length of the second gradient is a fraction of the length of the first gradient
  gradmin2 <- 0
  gradmax2 <- ratio_grad

  ### Resource species trait gradient ###
  # Initialize empty trait values matrix
  trait_resource <- matrix(0, nrow = nb_resource, ncol = 2)
  # For each resource, generate a trait gradient value at random (uniform), correlated for the first one and non correlated for the second one
  trait_resource[, 1] <- corr_env_trait * trait_env_res[,1] + (1 - corr_env_trait) * runif(nb_resource, 0, 1)
  trait_resource[, 2] <- runif(nb_resource, min = gradmin2, max = gradmax2)
  # Assign names
  dimnames(trait_resource)[[1]] <- paste0("res", 1:nb_resource)
  dimnames(trait_resource)[[2]] <- c("trait_1", "trait_2")

  ### Consumer species trait gradient ###
  # Initialize an array for the optima and tolerances of the traits of the species
  # This array has 3 dimensions, the first one is for the species, the second for the parameter choice and the third is for the trait choice
  trait_consumer <- array(0, dim = c(nb_consumer, 2, 2))

  # Fill array p

  # -> first dimension
  # Generate Trait 1 optima for each species
  trait_consumer[, 1, 1] <- corr_env_trait * trait_env_con[,1] + (1 - corr_env_trait) * runif(nb_consumer, 0, 1)
  # Generate random trait's niche widths for each species
  trait_consumer[, 2, 1] <- abs(rnorm(nb_consumer, mean = mean_tol, sd = sd_tol))

  # -> second dimension
  trait_consumer[, 1, 2] <- runif(nb_consumer, min = gradmin2, max = gradmax2)
  trait_consumer[, 2, 2] <- abs(rnorm(nb_consumer, mean = mean_tol, sd = sd_tol))

  # Assign names for both
  dimnames(trait_consumer)[[1]] <- paste0("con", 1:nb_consumer)
  dimnames(trait_consumer)[[2]] <- c("mean", "sd")

  ### Probability matrix (only matching) ###
  # Initialize empty community matrix
  matching_matrix <- matrix(0, nrow = nrow(trait_resource), ncol = nb_consumer)

  for (i in 1:nrow(trait_resource)) {
    for (j in 1:nb_consumer) {
      # Fill each cell with a "presence probability" or an "interaction probability"
      # from a multivariate normal law depending on:
      # - the matching between resource species trait and consumer species trait
      # - the matching between the site environmental value and the species niche optimum on this gradient
      matching_matrix[i, j] <- mvtnorm::dmvnorm(trait_resource[i, ] - trait_consumer[j, 1, ], sigma = diag(trait_consumer[j, 2, ]^2))
    }
  }
  # Transform negative values to zero probability
  matching_matrix <- ifelse(matching_matrix > 0, matching_matrix, 0)

  # Make columns a proba distribution
  # - each species (column) is distributed in sites following a probability of choosing this site
  # - each consumer (column) chooses the resource according to a given proba of presence
  matching_matrix <- sweep(matching_matrix, 2, STATS = apply(matching_matrix, 2, sum), FUN = "/")

  # Quick patch (in case there are species with zero obs that became NA at the division step)
  matching_matrix[is.na(matching_matrix)] <- 0

  # Assign names
  dimnames(matching_matrix)[[1]] <- paste0("res", 1:nb_resource)
  dimnames(matching_matrix)[[2]] <- paste0("con", 1:nb_consumer)

  ### Results ###
  trait <- list(matching_matrix = matching_matrix,
                trait_resource = trait_resource,
                trait_consumer = trait_consumer)
  return(trait)
}

##################### Mix abundance and trait matching #####################

#' Mix abundance and trait matching
#'
#' @description
#' Take in account the probability of matching only by meeting randomly (with the abundances) and the
#' of interacting due to trait matching.
#'
#' @param location Numeric, Number of location along the gradient (i.e. number of networks)
#' @param abund_resource Array, resource abundance along the gradient
#' @param abund_consumer Array, consumer abundance along the gradient
#' @param matching_matrix Matrix, Array containing the probabilities of species interactions only based on trait matching
#' @param delta Numeric, weight of trait matching relatively to abundance
#' @param nb_resource Numeric, Number of resources in the bipartite network
#' @param nb_consumer Numeric, Number of consumers in the bipartite network

#'
#' @return Matrix, Theoretical interaction probability taking in account trait matching and abundances
#'
#' @export


int_count_th <- function(location, abund_resource, abund_consumer, matching_matrix, delta,
                         nb_resource, nb_consumer) {
  ### Theoretical interaction count (based on abundances) ###
  # This code makes sense only for interaction matrices because the abundance of
  # resource species is a limiting factor here.
  # It makes less sense in the context of species x sites association, unless we consider
  # resources in the different sites are limited and a site has a limited number of species.
  prop_row <- abund_resource[location, ] / sum(abund_resource[location, ]) # Get the proportion of each resource (its "availability")
  ab_neutral <- prop_row %*% t(abund_consumer[location, ]) # Get the predicted interaction solely based on the neutral effect

  ### Probability matrix (matching and abundance) ###
  # these theoretical abundances of interactions must then be confronted to the probability of interactions
  ab_mix <- ab_neutral * matching_matrix^delta # We multiply expected interaction number by trait matching
  # Create a vector of probabilities that takes into account the matching
  p_mix <- ab_mix / sum(ab_mix)
  p_mix[is.na(p_mix)] <- 0 # Handle divisions per zero

  # Assign names
  dimnames(p_mix)[[1]] <- paste0("res", 1:nb_resource)
  dimnames(p_mix)[[2]] <- paste0("con", 1:nb_consumer)

  ### Results ###
  return(p_mix)
}

##################### Sampling with Multinomial #####################

# Need to add ninter to the arguments of the function

# Final community matrix (with counts) ---
# Then we need to sample observations in this web
# The method is inspired by Fründ et al 2016
# We sample ninter interactions from a multinomial distribution, where the probability to
# draw each interaction depends on the probability taking into account abundance and matching

#' Sampling with Multinomial
#'
#' @description
#' Using the multinomial law we can sample the theoretical network according to the probability of two
#' species interaction's probability.
#'
#' @importFrom stats rmultinom
#'
#' @param th_network  Matrix, Theoretical interaction probability taking in account trait matching and abundances
#' @param ninter Numeric, number of interactions observed on the network
#' @param nb_resource Numeric, Number of resources in the bipartite network
#' @param nb_consumer Numeric, Number of consumers in the bipartite network
#' #'
#' @return  Matrix, Observed interactions across an environmental gradient
#'
#' @export


sampling <- function(th_network, ninter = 100, nb_resource, nb_consumer){
  obs_network_vect <- stats::rmultinom(
    n = 1,
    size = ninter,
    prob = as.numeric(th_network)
  )
  obs_network <- matrix(obs_network_vect, nrow = nb_resource, byrow = FALSE) # Reformat to a matrix
  # Assign names
    dimnames(obs_network)[[1]] <- paste0("res", 1:nb_resource)
    dimnames(obs_network)[[2]] <- paste0("con", 1:nb_consumer)
  return(obs_network)
}



##################### Master function #####################

#' Network sampling generation across an environmental gradient
#'
#' @description
#' Generate and environmental gradient and random trait matching to create an theoretical interaction
#' probability and then sample this theoretical network to simulate random observation.
#'
#' @importFrom stats runif rnorm dnorm rpois rmultinom
#' @importFrom mvtnorm dmvnorm
#'
#' @param nb_resource Numeric, Number of resources in the bipartite network
#' @param nb_consumer Numeric, Number of consumers in the bipartite network
#' @param nb_location Numeric, Number of location along the gradient (i.e. number of networks)
#' @param know_env_grad_pos Boolean, If True: then evenly spaced sampling along the environmental
#' gradient, otherwise, uniformly drawn position along the gradient
#' @param mean_tol_env Numeric, Mean of the standard deviation of the niche tolerance for an environmental gradient between 0 and 1
#' @param sd_tol_env Numeric, Standard deviation of the standard deviation of the niche tolerance for an environmental gradient between 0 and 1
#' @param magn_res_min Numeric, Lower bound of the order of magnitude of size of a resource population
#' @param magn_res_max Numeric, Higher bound of the order of magnitude of size of a resource population
#' @param magn_con_min Numeric, Lower bound of the order of magnitude of size of a consumer population
#' @param magn_con_max Numeric, Higher bound of the order of magnitude of size of a consumer population
#' @param corr_env_trait Numeric, weight given on the correlation between the environment gradient and the trait one
#' @param ratio_grad Numeric between 0 and 1, Ratio between the first and second gradient
#' @param mean_tol Numeric, Mean of the standard deviation of the trait tolerance
#' @param sd_tol Numeric, Standard deviation of the standard deviation of the trait tolerance
#' @param delta Numeric, weight of trait matching relatively to abundance
#' @param ninter Numeric, number of interactions observed on the network
#'
#' @return List of matrix, Observed interactions across an environmental gradient,
#' as well as the abundances and related distribution information,
#' the theoretical network,
#' the trait distribution and trait matching probabilities.
#'
#' @export


env_grad_netw <- function(nb_resource = 40, nb_consumer = 100,
                          nb_location = 3, know_env_grad_pos = TRUE,
                          mean_tol_env = 0.1, sd_tol_env = 0.1,
                          magn_res_min = 20, magn_res_max = 200,
                          magn_con_min = 100, magn_con_max = 10000,
                          corr_env_trait= 0,
                          ratio_grad = 0.8,
                          mean_tol = 0.1, sd_tol = 1,
                          delta = 1,
                          ninter = 100) {
  abundance <- abund_env_grad(
    nb_resource = nb_resource, nb_consumer = nb_consumer,
    nb_location = nb_location, know_env_grad_pos = know_env_grad_pos,
    mean_tol_env = mean_tol_env, sd_tol_env = sd_tol_env,
    magn_res_min = magn_res_min, magn_res_max = magn_res_max,
    magn_con_min = magn_con_min, magn_con_max = magn_con_max
  )
  trait <- trait_match_mat(ratio_grad = ratio_grad,
                           mean_tol = mean_tol, sd_tol = sd_tol,
                           nb_resource = nb_resource, nb_consumer = nb_consumer,
                           corr_env_trait= corr_env_trait,
                           trait_env_res = abundance$th_distrib_resource,
                           trait_env_con = abundance$th_distrib_consumer
  )
  th_env_netw <- list()
  for (i in 1:nb_location) {
    th_env_netw[[i]] <- int_count_th(i,
                                     abund_resource = abundance$abundance_resource,
                                     abund_consumer = abundance$abundance_consumer,
                                     matching_matrix = trait$matching_matrix,
                                     delta = delta,
                                     nb_resource = nb_resource,
                                     nb_consumer = nb_consumer)
  }
  obs_env_netw <- list()
  for (i in 1:nb_location) {
    obs_env_netw[[i]] <- sampling(th_env_netw[[i]],
                                  ninter = ninter,
                                  nb_resource = nb_resource,
                                  nb_consumer = nb_consumer)
  }
  return(list(abudance = abundance, th_network = th_env_netw, obs_network = obs_env_netw, trait = trait))
}

