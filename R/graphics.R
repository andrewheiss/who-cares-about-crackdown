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

clrs_ngo <- as.list(c(viridisLite::plasma(6, begin = 0, end = 0.85), 
                      viridisLite::viridis(6, begin = 0, end = 0.94)))
# unlist(clrs_ngo) %>% scales::show_col()
names(clrs_ngo) <- c("pl_blue", "pl_purple_dark", "pl_purple_light", 
                     "pl_pink", "pl_orange", "pl_yellow",
                     "vi_purple", "vi_blue_dark", "vi_blue_light", 
                     "vi_turquoise", "vi_green", "vi_yellow")

# Colors via http://clrs.cc/
clrs <- list(
  navy = "#001F3F",
  blue = "#0074D9",
  aqua = "#7FDBFF",
  teal = "#39CCCC",
  olive = "#3D9970",
  green = "#2ECC40",
  lime = "#01FF70",
  yellow = "#FFDC00",
  orange = "#FF851B",
  red = "#FF4136",
  fuchsia = "#F012BE",
  purple = "#B10DC9",
  maroon = "#85144B",
  white = "#FFFFFF",
  silver = "#DDDDDD",
  gray = "#AAAAAA",
  black = "#111111"
)
