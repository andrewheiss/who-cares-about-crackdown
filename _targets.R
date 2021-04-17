library(targets)
library(tarchetypes)
library(tibble)

# General variables
csl <- "pandoc/csl/the-open-university-harvard.csl"
bibstyle <- "bibstyle-chicago-authordate"

options(tidyverse.quiet = TRUE,
        dplyr.summarise.inform = FALSE)

set.seed(1746)  # From random.org

tar_option_set(packages = c("tidyverse", "here", "fs", "scales",
                            "readxl", "haven", "sf", "lubridate", "scales",
                            "janitor", "kableExtra", "huxtable", "modelsummary",
                            "knitr", "withr", "flextable", "testthat", "DT",
                            "brms", "tidybayes", "broom", "cmdstanr", "jsonlite"))

source("R/funs_data-generation.R")
source("R/funs_survey.R")
source("R/funs_notebook.R")
source("R/funs_knitting.R")

# here::here() returns an absolute path, which then gets stored in tar_meta and
# becomes computer-specific (i.e. /Users/andrew/Research/blah/thing.Rmd).
# There's no way to get a relative path directly out of here::here(), but
# fs::path_rel() works fine with it (see
# https://github.com/r-lib/here/issues/36#issuecomment-530894167)
here_rel <- function(...) {fs::path_rel(here::here(...))}

# Pipeline
list(
  # Define raw data files
  tar_target(excel_simulator_file,
             here_rel("data", "raw_data", "Market Simulator Version 01.xlsx"),
             format = "file"),
  tar_target(gamma_draws_file,
             here_rel("data", "raw_data", "posterior_draws", "public_political_social_charity_demo.rds"),
             format = "file"),
  tar_target(survey_results_file,
             here_rel("data", "raw_data", "final_data.rds"),
             format = "file"),
  tar_target(giving_aggregate_file,
             here_rel("data", "raw_data", "data-FTjUv.csv")),
  tar_target(giving_per_capita_file,
             here_rel("data", "raw_data", "data-xextT.csv")),
  
  # Define helper functions
  tar_target(plot_funs, here_rel("R", "graphics.R"), format = "file"),
  
  # Process and clean data
  tar_target(sim_excel_final, process_excel_simulation(excel_simulator_file)),
  tar_target(gammas, load_gammas(gamma_draws_file)),
  tar_target(personas, build_personas()),
  tar_target(orgs, build_orgs()),
  tar_target(market_shares, create_predicted_market_shares(gammas, personas, orgs)),
  tar_target(sim_final, create_simulation(market_shares, personas, orgs)),
  tar_target(survey_results, read_rds(survey_results_file)),
  tar_target(participant_summary, create_sample_summary(survey_results)),
  tar_target(giving_aggregate, {
    read_csv(giving_aggregate_file, col_types = cols()) %>%
      mutate(total = `Total donations` * 1000000000)
  }),
  tar_target(giving_per_capita, read_csv(giving_per_capita_file, col_types = cols())),

  # Render the analysis notebook
  tar_notebook_pages(),
  
  # tarchetypes::tar_render() automatically detects target dependencies in Rmd
  # files and knits them, but there's no easy way to pass a custom rendering
  # script like bookdown::html_document2(), so two things happen here:
  #   1. Set a file-based target with tar_target_raw() and use tar_knitr_deps()
  #      to detect the target dependencies in the Rmd file
  #   2. Use a bunch of other file-based targets to actually render the document
  #      through different custom functions
  tar_target(bib_file,
             here_rel("manuscript", "bibliography.bib"),
             format = "file"),

  tar_target_raw("main_manuscript", here_rel("manuscript", "manuscript.Rmd"),
                 format = "file",
                 deps = c("bib_file",
                          tar_knitr_deps(here_rel("manuscript", "manuscript.Rmd")))),
  tar_target(html,
             render_html(
               input = main_manuscript,
               output = here_rel("manuscript", "output", "manuscript.html"),
               csl = csl,
               bib_file,
               support_folder = "output/html-support"),
             format = "file")#,
  # tar_target(pdf,
  #            render_pdf(
  #              input = main_manuscript,
  #              output = here_rel("manuscript", "output/manuscript.pdf"),
  #              bibstyle = bibstyle,
  #              bib_file),
  #            format = "file"),
  # tar_target(ms_pdf,
  #            render_pdf_ms(
  #              input = main_manuscript,
  #              output = here_rel("manuscript", "output/manuscript-ms.pdf"),
  #              bibstyle = bibstyle,
  #              bib_file),
  #            format = "file"),
  # tar_target(docx,
  #            render_docx(
  #              input = main_manuscript,
  #              output = here_rel("manuscript", "output/manuscript.docx"),
  #              csl = csl,
  #              bib_file),
  #            format = "file"),
  # tar_target(bib,
  #            extract_bib(
  #              input_rmd = main_manuscript,
  #              input_bib = bib_file,
  #              output = here_rel("manuscript", "output", "extracted-citations.bib")),
  #            format = "file")
)
