# ggplot themes -----------------------------------------------------------

#' theme_ngo
#'
#' A custom ggplot2 theme used throughout this project
#'
#' @param base_size base font size (default is 11)
#' @param base_family base font family (default is IBM Plex Sans Condensed)
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = wt)) +
#'   geom_point() +
#'   theme_ngo()
theme_ngo <- function(base_size = 9, base_family = "IBM Plex Sans Condensed") {
  ret <- theme_bw(base_size, base_family) +
    theme(plot.title = element_text(size = rel(1.4), face = "bold",
                                    family = "IBM Plex Sans Condensed"),
          plot.subtitle = element_text(size = rel(1), face = "plain",
                                       family = "IBM Plex Sans Condensed Light"),
          plot.caption = element_text(size = rel(0.8), color = "grey50", face = "plain",
                                      family = "IBM Plex Sans Condensed Light",
                                      margin = margin(t = 10)),
          panel.border = element_rect(color = "grey50", fill = NA, size = 0.15),
          panel.spacing = unit(1, "lines"),
          panel.grid.minor = element_blank(),
          strip.text = element_text(size = rel(0.9), hjust = 0,
                                    family = "IBM Plex Sans Condensed", face = "bold"),
          strip.background = element_rect(fill = "#ffffff", colour = NA),
          axis.ticks = element_blank(),
          axis.title = element_text(family = "IBM Plex Sans Condensed SemiBold", face = "plain", 
                                    size = rel(0.8)),
          axis.title.x = element_text(margin = margin(t = 5)),
          axis.text = element_text(family = "IBM Plex Sans Condensed Light", face = "plain"),
          legend.key = element_blank(),
          legend.text = element_text(size = rel(0.75), 
                                     family = "IBM Plex Sans Condensed Light", face = "plain"),
          legend.spacing = unit(0.1, "lines"),
          legend.box.margin = margin(t = -0.5, unit = "lines"),
          legend.margin = margin(t = 0),
          legend.position = "bottom")
  
  ret
}


# Colors ------------------------------------------------------------------

# colors_plasma <- viridisLite::plasma(6, begin = 0, end = 0.85)
# colors_plasma %>% scales::show_col()
# 
# colors_viridis <- viridisLite::viridis(6, begin = 0, end = 0.97)
# colors_viridis %>% scales::show_col()

# colors_viridis <- viridisLite::viridis(4, option = "viridis")

# Okabe and Ito (2008) colorblind-safe qualitative palette: https://jfly.uni-koeln.de/color/
# See also https://clauswilke.com/dataviz/color-pitfalls.html
clrs_okabe_ito <- list(orange = "#E69F00",
                       sky_blue = "#56B4E9",
                       bluish_green = "#009E73",
                       yellow = "#F0E442",
                       blue = "#0072B2",
                       vermilion = "#D55E00",
                       reddish_purple = "#CC79A7",
                       black = "#000000")

clrs_ngo_pairs <- list(c(clrs_okabe_ito[[1]], clrs_okabe_ito[[2]]),
                       c(clrs_okabe_ito[[3]], clrs_okabe_ito[[4]]),
                       c(clrs_okabe_ito[[5]], clrs_okabe_ito[[6]]),
                       c(clrs_okabe_ito[[7]], clrs_okabe_ito[[8]]))


# Helper functions --------------------------------------------------------

# Wrap factor levels
# via Hadley: https://github.com/tidyverse/stringr/issues/107#issuecomment-233723948
str_wrap_factor <- function(x, ...) {
  levels(x) <- str_wrap(levels(x), ...)
  x
}
