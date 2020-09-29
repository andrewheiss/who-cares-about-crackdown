# Universal pandoc options ------------------------------------------------

pander::panderOptions("table.split.table", Inf)
pander::panderOptions("table.split.cells", Inf)
pander::panderOptions("missing", "")
pander::panderOptions("big.mark", ",")
pander::panderOptions("digits", 3)
pander::panderOptions("round", 3)
pander::panderOptions("table.alignment.default", "left")


# Colors ------------------------------------------------------------------

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


# Bayes options -----------------------------------------------------------

CHAINS <- 4
ITER <- 4000
WARMUP <- 2000
BAYES_SEED <- 1234
options(mc.cores = parallel::detectCores())


# Ordered factor modeling setup -------------------------------------------

# By default, R uses polynomial contrasts for ordered factors in linear models
# options("contrasts")
# So make ordered factors use treatment contrasts instead
options(contrasts = rep("contr.treatment", 2))
# Or do it on a single variable:
# contrasts(df$x) <- "contr.treatment"
