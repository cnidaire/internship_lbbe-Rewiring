# Header #############################################################
#
# Author: Lisa Nicvert
# Email:  lisa.nicvert@univ-lyon1.fr
#
# Date: 2023-12-18
#
# Script Description: plotting functions

# Network -----------------------------------------------------------------

#' Plot matrix
#'
#' Plot an interaction matrix
#'
#' @param mat The matrix. It represents the interaction frequency
#' of species interactions (it is assumed to be plants x animals).
#' @param tile_fill Color fill of tiles. Use NA for no fill.
#' @param max_size The maximum circle area to be used in `scale_size_area`. Defaults to 0.7 times
#' the actual maximum.
#' @param base_size Base text size
#' @param xlab Title of the x axis
#' @param ylab Title of the y axis
#' @param legend_title Title of the legend
#' @param col Color of the points
#' @param alpha If true, will make less abundant interactions more
#' transparent
#' @param trans Transformation to apply to the scaling of points.
#' @param breaks Breaks to use for the legend of the points size.
#'
#' @return A ggplot
#'
#' @export
plot_matrix <- function(mat, tile_fill = "white",
                        col = "black",
                        alpha = FALSE,
                        max_size = max(mat)*0.7,
                        base_size = 12,
                        xlab = "Animals", ylab = "Plants",
                        trans = "identity",
                        breaks = waiver(),
                        legend_title = "Frequency") {

  # Matrix to df
  df <- matrix_to_df(mat)

  # Filter out frequency zero for plotting points
  df_points <- df |>
    dplyr::filter(value != 0)

  # Plot
  g <- ggplot(df,
         aes(y = plants, x = animals)) +
    geom_tile(fill = tile_fill)

  if (alpha) { # adjust alpha
    g <- g + geom_point(data = df_points,
                        aes(size = value, alpha = value),
                        col = col, stroke = 0)
  } else { # Don't use alpha
    g <- g + geom_point(data = df_points,
                        aes(size = value),
                        col = col, stroke = 0)
  }

  g <- g +
    scale_size_area(max_size = max_size, trans = trans,
                    breaks = breaks) +
    coord_fixed() +
    scale_x_discrete(position = "top") +
    theme_linedraw(base_size = base_size) +
    xlab(xlab) +
    ylab(ylab) +
    labs(size = legend_title) +
    theme(axis.text.x.top = element_text(angle = 90, vjust = 0.5),
          legend.position = "bottom")
  g
}


# Multivariate ------------------------------------------------------------


#' Plot eigenvalues
#'
#' Barplot of eigenvalues
#'
#' @param eigenvalues The eigenvalues
#' @param showrank Should the x-axis display the rank of the eigenvalues?
#'
#' @return A ggplot
#' @export
plot_eig <- function(eigenvalues, showrank = FALSE) {

  gg <- ggplot() +
    geom_col(aes(y = eigenvalues, x = factor(1:length(eigenvalues)))) +
    theme_linedraw() +
    scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
    xlab("Rank") +
    ylab("Eigenvalues")

  if (!showrank) {
    gg <- gg +
      theme(axis.text.x = element_blank(),
            axis.ticks.x = element_blank())
  }
  gg
}


#' Plot bi, tri or quadriplots
#'
#' Bi, tri or quadriplots from a multivariate analysis
#'
#' @param indiv_row Matrix of individuals coordinates for rows (type `dudi$li`)
#' @param indiv_col Matrix of individuals coordinates for columns (type `dudi$co`)
#' @param indiv_row_lab Labels for row individuals
#' @param indiv_col_lab Labels for columns individuals
#' @param var_row Matrix of variables coordinates for rows (type `dudi$corR`)
#' @param var_col Matrix of variables coordinates for columns (type `dudi$corQ`)
#' @param var_row_lab Labels for row variables
#' @param var_col_lab Labels for columns variables
#' @param row_color Color for the row individuals or variables
#' @param col_color Color for the columns individuals or variables
#' @param eig Eigenvalues vector
#' @param x Axis to use for the x-axis
#' @param y Axis to use for the y-axis
#' @param max.overlaps `max.overlaps` argument for `ggrepel::geom_text_repel`
#' @param mult factor to multiply the vectors (arrows on the plot)
#' @param xlim x-axis limits. Defaults to data range if not specified
#' @param ylim y-axis limits. Defaults to data range if not specified
#' @param grad graduations for the major.grid
#' @param title plot title
#' @param alphapoints Transparency value for points
#'
#' @return a ggplot
#'
#' @export
multiplot <- function(indiv_row = NULL, indiv_col = NULL,
                      indiv_row_lab = rownames(indiv_row), indiv_col_lab = rownames(indiv_col),
                      var_row = NULL, var_col = NULL,
                      var_row_lab = rownames(var_row), var_col_lab = rownames(var_col),
                      row_color = "black", col_color = "black",
                      eig = NULL,
                      x = 1, y = 2,
                      xlim = NULL, ylim = NULL,
                      grad = 4,
                      mult = 1,
                      title = NULL,
                      max.overlaps = 20,
                      alphapoints = 0.8) {

  xlab <- paste0("Axis ", x)
  ylab <- paste0("Axis ", y)

  if (!is.null(eig)) {
    xlab <- paste0(xlab, " (", round(eig[x]/sum(eig)*100, 1), " % variability)")
    ylab <- paste0(ylab, " (", round(eig[y]/sum(eig)*100, 1), " % variability)")
  }


  g <- ggplot() +
    geom_vline(xintercept = 0) +
    geom_hline(yintercept = 0) +
    theme_linedraw() +
    coord_fixed() +
    xlab(xlab) +
    ylab(ylab)

  # Plot title
  if (!is.null(title)) {
    g <- g + ggtitle(title)
  }

  # Set x axis limits and breaks
  if (!is.null(xlim)) {
    g <- g + scale_x_continuous(breaks = seq(xlim[1] - grad, xlim[2] + grad,
                                             by = grad),
                                limits = xlim)
  } else {
    g <- g + scale_x_continuous(breaks = seq(-50, 50, by = grad))
  }

  # Set y axis limits and breaks
  if (!is.null(ylim)) {
    g <- g + scale_y_continuous(breaks = seq(ylim[1] - grad, ylim[2] + grad,
                                             by = grad),
                                limits = ylim)
  } else {
    g <- g + scale_y_continuous(breaks = seq(-50, 50, by = grad))
  }

  # Plot row individuals
  if (!is.null(indiv_row)) {
    g <- g +
      geom_point(aes(x = indiv_row[, x], y = indiv_row[, y]),
                 col = row_color,
                 alpha = alphapoints)
  }

  # Plot column individuals
  if (!is.null(indiv_col)) {
    g <- g +
      geom_point(aes(x = indiv_col[, x], y = indiv_col[, y]),
                 col = col_color,
                 alpha = alphapoints)

    if (!is.null(indiv_col_lab)) {
      g <- g +
        geom_text_repel(aes(x = indiv_col[, x], y = indiv_col[, y],
                            label = indiv_col_lab),
                        col = col_color,
                        max.overlaps = max.overlaps)
    }

  }

  # Plot row labels over points
  if (!is.null(indiv_row) & !is.null(indiv_row_lab)) {
    g <- g +
      geom_text_repel(aes(x = indiv_row[, x], y = indiv_row[, y],
                          label = indiv_row_lab),
                      col = row_color,
                      max.overlaps = max.overlaps)
  }

  # Plot rows variables
  if (!is.null(var_row)) {
    g <- g +
      geom_segment(aes(x = 0, y = 0,
                       xend = var_row[, x]*mult, yend = var_row[, y]*mult),
                   arrow = arrow(length = grid::unit(0.20, "cm")))
  }

  # Plot columns variables
  if (!is.null(var_col)) {
    g <- g +
      geom_segment(aes(x = 0, y = 0,
                       xend = var_col[, x]*mult, yend = var_col[, y]*mult),
                   arrow = arrow(length = grid::unit(0.20,"cm"))) +
      geom_label(aes(x = var_col[, x]*mult, y = var_col[, y]*mult,
                     label = var_col_lab),
                 col = col_color,
                 vjust = ifelse(var_col[, y] > 0, 0, 1))
  }


  # Plot row variables over arrows
  if (!is.null(var_row)) {
    g <- g +
      geom_label(aes(x = var_row[, x]*mult, y = var_row[, y]*mult,
                     label = var_row_lab),
                 col = row_color,
                 vjust = ifelse(var_row[, y] > 0, 0, 1))
  }

  g
}


#' Plot reciprocal scaling
#'
#' Plot reciprocal scaling
#'
#' @param dudi A dudi object to pair with the analysis. Used for the eigenvalues (always)
#' and for the arrows of explanatory variables if required.
#' It must be of class `coa`, `pcaiv` or `dpcaiv` (obtained with the new function `dpcaiv2`).
#' @param recscal A dataframe (expected to be the output of `reciprocal.coa` function).
#' The first columns must contain the reciprocal scaling scores and the last 3 columns
#' are `Row`, `Col` and `Weight`.
#' @param xax The index of the multivariate axis to plot on the x-axis (the column `xax` from
#' the `recscal` dataframe).
#' @param yax The index of the multivariate axis to plot on the y-axis  (the column `yax` from
#' the `recscal` dataframe).
#' @param labsize Size of the ellipses labels
#' @param psize Size of the points
#' @param group The group of the reciprocal COA dataframe to use for the ellipses (`co` or `li`)
#' @param col The ellipses colors
#' @param alpha The ellipses transparency
#' @param plot_arrows Whether to plot the arrows for the variables
#' @param plot_points Plot the data points?
#' @param plot_labels Plot ellipses labels?
#' @param ... Additional parameters passed to `s.class`
#'
#' @return A plot with the points grouped by ellipses.
#'
#' @export
plot_reciprocal <- function(dudi, recscal,
                            xax = 1, yax = 2,
                            labsize = 1,
                            psize = 1,
                            group = c("li", "co"),
                            col= "cornflowerblue",
                            alpha = 0.2,
                            plot_arrows = TRUE,
                            plot_points = TRUE,
                            plot_labels = TRUE,
                            ...){

  explained_var <- round(dudi$eig[c(xax, yax)]/sum(dudi$eig)*100, 2)

  if(!(inherits(dudi, "coa") | inherits(dudi, "caiv") | inherits(dudi, "dpcaiv"))){
    stop(paste0("Function not defined for 'dudi' of class ", class(dudi),
                ": 'dudi' of class coa, caiv or dpcaiv expected."))
  }

  if (length(group) != 1) {
    group <- group[1]
  }

  starsize <- 1

  if(!plot_points) {
    psize <- 0
    starsize <- 0
  }

  if(!plot_labels) {
    labsize <- 0
  }

  if(group == "li"){
    s.class(dfxy = recscal[,c(xax, yax)],
            fac = as.factor(recscal$Row),
            wt = recscal$Weight,
            xlab = paste0("Axis ", xax, " (", explained_var[1],"%)"),
            ylab = paste0("Axis ", yax, " (", explained_var[2],"%)"),
            plabel.optim = TRUE,
            ppoints.cex = psize,
            plabel.cex = labsize,
            starSize = starsize,
            plegend.drawKey = FALSE,
            pellipses.alpha = alpha,
            col = col,
            ...)
  }else if(group == "co"){
    s.class(dfxy = recscal[,c(xax, yax)],
            fac = as.factor(recscal$Col),
            wt = recscal$Weight,
            xlab = paste0("Axis ", xax, " (", explained_var[1],"%)"),
            ylab = paste0("Axis ", yax, " (", explained_var[2],"%)"),
            plabel.optim = TRUE,
            ppoints.cex = psize,
            plabel.cex = labsize,
            starSize = starsize,
            plegend.drawKey = FALSE,
            pellipses.alpha = alpha,
            col = col,
            ...)
  }

  if(plot_arrows){
    if(inherits(dudi, "dpcaiv")){
      if(group == "li"){
        s.arrow(dudi$corR, add = TRUE)
      }else if(group == "co"){
        s.arrow(dudi$corQ, add = TRUE)
      }
    } else if (inherits(dudi, "caiv") ) {
      s.arrow(dudi$cor, add = TRUE)
    }
  }
}


# Linear model ------------------------------------------------------------


#' Plot linear model
#'
#' Plot the linear models that predicts variance with mean of the
#' reciprocal scaling.
#'
#' @param df The dataframe containing the true data. It must have columns `mean` (used for the x-axis) and
#' `var` (y-axis).
#' @param dat_pred The dataframe containing the predicted data (assumed to be over the true data range).
#' It is assumed to be obtained with [get_pred()]. It must have columns `x`, `fit`, `lwr`, `upr`.
#' @param lab A label to add to the graph. If provided, will be added in the top-left corner.
#' It must be a dataframe with at least one column `R2` (to create this dataframe, see [lm_labels]).
#' If `facet` is not `NULL`, it must have a column
#' `type` too. If it has a column `formula`, the formula will be displayed along with the coefficient of determination.
#' @param col Color of the data points and prediction line. If there are facets, it should have length 2 (one color per
#' facet).
#' @param ylab Label of the y-axis
#' @param text_size Size of the text (points labels and R squared)
#' @param max.overlaps `max.overlaps` argument for `ggrepel::geom_text_repel`
#' @param xlab Label of the x-axis
#' @param points_size Size of the points
#' @param facet A column to use for facetting. Defaults to `NULL` (no facets).
#' @param nudge_x Nudge to use for top left corner labels
#'
#' @return A ggplot object showing variance vs mean along with the predicted values of the linear model
#'
#' @export
plot_lm_mean_var <- function(df,
                             dat_pred,
                             lab = NULL,
                             col = "black",
                             ylab = "Variance",
                             xlab = "Mean",
                             text_size = 3,
                             points_size = 1,
                             facet = NULL,
                             nudge_x = 0.1,
                             max.overlaps = 5) {

  p <- ggplot() + theme_linedraw()

  if(!missing(dat_pred)) {
    if (!is.null(facet)) {
      p <- p + geom_line(aes(x = x, y = fit, col = .data[[facet]]),
                         data = dat_pred, show.legend = FALSE)
    } else {
      p <- p +
        geom_line(aes(x = x, y = fit), col = col,
                  data = dat_pred)
    }

    p <- p +
      geom_ribbon(aes(x = x, ymin = lwr, ymax = upr), alpha = 0.3,
                  data = dat_pred)
  }

  if (!is.null(facet)) {
    p <- p +
      ggplot2::facet_grid(cols = ggplot2::vars(.data[[facet]]),
                          scales = "free_x") +
      geom_point(aes(x = mean, y = var, col = .data[[facet]]),
                 size = points_size,
                 data = df,
                 show.legend = FALSE) +
      scale_color_manual(values = col)
  } else {
    p <- p +
      geom_point(aes(x = mean, y = var),
                 col =  col,
                 size = points_size,
                 data = df)
  }

  p <- p +
    geom_text_repel(aes(x = mean, y = var,
                        label = rownames(df)),
                    data = df,
                    size = text_size,
                    max.overlaps = max.overlaps) +
    xlab(xlab) +
    ylab(ylab)

  if(!is.null(lab)) {
    # Get min value of the x axis
    xmin <- sapply(ggplot_build(p)$layout$panel_params, function(x) min(x$x.range))

    p <- p +
      geom_text(data = lab,
                aes(label = r2),
                parse = TRUE,
                size = text_size,
                x = xmin + nudge_x,
                y = Inf,
                hjust = 0, vjust = 1.4)

    if ("formula" %in% colnames(lab)) {
      p <- p +
        geom_text(data = lab,
                  aes(label = formula),
                  parse = TRUE,
                  size = text_size,
                  x = xmin + nudge_x,
                  y = Inf,
                  hjust = 0, vjust = 2.4)
    }

  }

  return(p)
}
