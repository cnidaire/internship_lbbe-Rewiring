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
#' @param mean_tol_env Numeric, Mean of the standard deviation of the niche tolerance
#' @param sd_tol_env Numeric, Standard deviation of the standard deviation of the niche tolerance
#' @param env_grad_min Numeric, Maximum value of the gradient in arbitrary unit
#' @param env_grad_max Numeric, Minimum value of the gradient in arbitrary unit
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
#'                mean_tol_env = 1, sd_tol_env = 1,
#'                env_grad_min = 0, env_grad_max = 10)

abund_env_grad <- function(know_env_grad_pos = TRUE,
                           nb_resource = 40, nb_consumer = 100, nb_location = 3,
                           mean_tol_env = 1, sd_tol_env = 1,
                           env_grad_min = 0, env_grad_max = 10,
                           magn_res_min = 20, magn_res_max = 200,
                           magn_con_min = 100, magn_con_max = 10000) {
  ### resource gradient ###
  env_grad_resource <- array(0, dim = c(nb_resource, 2)) # two col, 1st: mean, 2nd: sd
  # Generate environmental optima for each species
  env_grad_resource[, 1] <- sort(runif(nb_resource, min = env_grad_min, max = env_grad_max))
  # Generate random niche widths for each species
  env_grad_resource[, 2] <- abs(rnorm(nb_resource, mean = mean_tol_env, sd = sd_tol_env))


  ### Consumer gradient ###
  env_grad_consumer <- array(0, dim = c(nb_consumer, 2)) # two col, 1st: mean, 2nd: sd
  # Generate environmental optima for each species
  env_grad_consumer[, 1] <- sort(runif(nb_consumer, min = env_grad_min, max = env_grad_max))
  # Generate random niche widths for each species
  env_grad_consumer[, 2] <- abs(rnorm(nb_consumer, mean = mean_tol_env, sd = sd_tol_env))

  ### Obtain abundances from a given position along the gradient ###
  if (know_env_grad_pos) {
    site_coordonates <- seq(from = env_grad_min,
                            to = env_grad_max,
                            by = (env_grad_max - env_grad_min) / (nb_location - 1))
  } else {
    site_coordonates <- sort(runif(n = nb_location,
                                   min = env_grad_min, max = env_grad_max))
  }

  ### Abundance Resource ###
  # Generate the magnitude of the abundance of resource species
  magn_res <- runif(nb_resource, magn_res_min, magn_res_max)
  # Generate abundances for each location
  abund_resource <- array(0, c(nb_location, nb_resource))
  for (site in 1:nb_location) {
    for (resource in 1:nb_resource) {
      abund_resource[site, resource] <- rpois(1, dnorm(site_coordonates[site],
                                                       mean = env_grad_resource[resource, 1],
                                                       sd = env_grad_resource[resource, 2]) * magn_res[resource])
    }
  }

  ### Abundance Consumer ###
  # Generate the magnitude of the abundance of consumer species
  magn_con <- runif(nb_consumer, magn_con_min, magn_con_max)
  # Generate abundances for each location
  abund_consumer <- array(0, c(nb_location, nb_consumer))
  for (site in 1:nb_location) {
    for (consumer in 1:nb_consumer) {
      abund_consumer[site, consumer] <- rpois(1, dnorm(site_coordonates[site],
                                                       mean = env_grad_consumer[consumer, 1],
                                                       sd = env_grad_consumer[consumer, 2]) * magn_con[consumer])
    }
  }

  ### Results ###
  abundance <- list(
    abundance_resource = abund_resource,
    abundance_consumer = abund_consumer,
    th_distrib_resource = env_grad_resource,
    th_distrib_consumer = env_grad_consumer,
    magnitude_resource = magn_res,
    magnitude_consumler = magn_con
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
#' @importFrom stats runif
#' @importFrom mvtnorm dmvnorm
#'
#' @param le_grad Numeric, Higher bound of the first trait gradient
#' @param ratio_grad Numeric between 0 and 1, Ratio between the first and second gradient
#' @param mean_tol Numeric, Mean of the standard deviation of the trait tolerance
#' @param sd_tol  Numeric, Standard deviation of the standard deviation of the trait tolerance
#' @param buffer Numeric, Enable the mean of the trait to fall outside of the gradient by the buffer value
#' @param nb_resource Numeric, Number of resource in the bipartite network
#' @param nb_consumer Numeric, Number of consumer in the bipartite network
#'
#' @return List, Array containing the probabilities of species interactions only based on trait matching
#' and then 2 Arrays containing the trait distribution of both traits respectively
#'
#' @export
trait_match_mat <- function(le_grad = 100, ratio_grad = 0.8,
                            mean_tol = 2, sd_tol = 10,
                            buffer = 1,
                            nb_resource = 40, nb_consumer = 100) {
  ### Initialize the gradient for axis 2 ###
  # The length of the second gradient is a fraction of the length of the first gradient
  gradmin2 <- 0
  gradmax2 <- le_grad - (1 - ratio_grad) * le_grad
  # For the columns, we include a buffer that is also on axis 2
  # (if buffer = 0 then gradmin/max2_buffer and gradmin/max2 are equal)
  gradmin2_buffer <- -buffer + gradmin2
  gradmax2_buffer <- buffer + gradmax2

  ### Resource species trait gradient ###
  # Initialize empty trait/environment values matrix
  trait_resource <- matrix(0, nrow = nb_resource, ncol = 2)
  # For each site, generate an environmental gradient value at random (uniform)
  trait_resource[, 1] <- runif(nb_resource, min = 0, max = le_grad)
  trait_resource[, 2] <- runif(nb_resource, min = gradmin2, max = gradmax2)

  ### Consumer species trait gradient ###
  # Initialize an array for species optima and tolerances
  # The array has last dimension 2 (one for each trait)
  trait_consumer <- array(0, dim = c(nb_consumer, 2, 2))

  # Fill array p

  # -> first dimension
  # Generate Trait 1 optima for each species
  trait_consumer[, 1, 1] <- runif(nb_consumer, min = 0 - buffer, max = le_grad + buffer)
  # Generate random trait's niche widths for each species
  trait_consumer[, 2, 1] <- abs(rnorm(nb_consumer, mean = mean_tol, sd = sd_tol))

  # -> second dimension
  trait_consumer[, 1, 2] <- runif(nb_consumer, min = gradmin2_buffer, max = gradmax2_buffer)
  trait_consumer[, 2, 2] <- abs(rnorm(nb_consumer, mean = mean_tol, sd = sd_tol))

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
#'
#' @return Matrix, Theoretical interaction probability taking in account trait matching and abundances
#'
#' @export


int_count_th <- function(location, abund_resource, abund_consumer, matching_matrix, delta = 1) {
  ### Theoretical interaction count (based on abundances) ###
  # This code makes sense only for interaction matrices because the abundance of
  # resource species is a limiting factor here.
  # It makes less sense in the context of species x sites association, unless we consider
  # resources in the different sites are limited and a site has a limited number of species.
  prop_row <- abund_resource[location, ] / sum(abund_resource[location, ]) # Get the proportion of each plant (its "availability")
  ab_neutral <- prop_row %*% t(abund_consumer[location, ]) # Get the predicted abundance -> the birds
  # choose a plant only based on its availability
  # Each bird abundance is exactly abund_consumer and the plants abundances are proportional to
  # abund_resource

  ### Probability matrix (matching and abundance) ###
  # these theoretical abundances of interactions must then be confronted to the probability of interactions
  ab_mix <- ab_neutral * matching_matrix^delta # We multiply expected interaction number by trait matching
  # Create a vector of probabilities that takes into account the matching
  p_mix <- ab_mix / sum(ab_mix)
  p_mix[is.na(p_mix)] <- 0 # Handle divisions per zero

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
#'
#' @return  Matrix, Observed interactions across an environmental gradient
#'
#' @export


sampling <- function(th_network, ninter = 100, nb_resource = nb_resource){
  obs_network_vect <- stats::rmultinom(
    n = 1,
    size = ninter,
    prob = as.numeric(th_network)
  )
  obs_network <- matrix(obs_network_vect, nrow = nb_resource, byrow = FALSE) # Reformat to a matrix
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
#' @param mean_tol_env Numeric, Mean of the standard deviation of the niche tolerance
#' @param sd_tol_env Numeric, Mean of the standard deviation of the niche tolerance
#' @param env_grad_min Numeric, Maximum value of the gradient in arbitrary unit
#' @param env_grad_max Numeric, Minimum value of the gradient in arbitrary unit
#' @param magn_res_min Numeric, Lower bound of the order of magnitude of size of a resource population
#' @param magn_res_max Numeric, Higher bound of the order of magnitude of size of a resource population
#' @param magn_con_min Numeric, Lower bound of the order of magnitude of size of a consumer population
#' @param magn_con_max Numeric, Higher bound of the order of magnitude of size of a consumer population
#' @param le_grad Numeric, Higher bound of the first trait gradient
#' @param ratio_grad Numeric between 0 and 1, Ratio between the first and second gradient
#' @param buffer Numeric, Enable the mean of the trait to fall outside of the gradient by the buffer value
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
                          mean_tol_env = 1, sd_tol_env = 1,
                          env_grad_min = 0, env_grad_max = 10,
                          magn_res_min = 20, magn_res_max = 200,
                          magn_con_min = 100, magn_con_max = 10000,
                          le_grad = 100, ratio_grad = 0.8,
                          buffer = 1,
                          mean_tol = 2, sd_tol = 10,
                          delta = 1,
                          ninter = 100) {
  abundance <- abund_env_grad(
    nb_resource = nb_resource, nb_consumer = nb_consumer,
    nb_location = nb_location, know_env_grad_pos = know_env_grad_pos,
    mean_tol_env = mean_tol_env, sd_tol_env = sd_tol_env,
    env_grad_min = env_grad_min, env_grad_max = env_grad_max,
    magn_res_min = magn_res_min, magn_res_max = magn_res_max,
    magn_con_min = magn_con_min, magn_con_max = magn_con_max
  )
  trait <- trait_match_mat(
    le_grad = le_grad, ratio_grad = ratio_grad,
    buffer = buffer,
    mean_tol = mean_tol, sd_tol = sd_tol,
    nb_resource = nb_resource, nb_consumer = nb_consumer
  )
  th_env_netw <- list()
  for (i in 1:nb_location) {
    th_env_netw[[i]] <- int_count_th(i,
                                     abund_resource = abundance$abundance_resource,
                                     abund_consumer = abundance$abundance_consumer,
                                     matching_matrix = trait$matching_matrix)
  }
  obs_env_netw <- list()
  for (i in 1:nb_location) {
    obs_env_netw[[i]] <- sampling(th_env_netw[[i]], ninter = ninter, nb_resource = nb_resource)
  }
  return(list(abudance = abundance, th_network = th_env_netw, obs_network = obs_env_netw, trait = trait))
}

