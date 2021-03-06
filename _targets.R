library(targets)
library(tarchetypes)
library(tibble)

# General variables
csl <- "pandoc/csl/apa.csl"
bibstyle <- "bibstyle-apa"

options(tidyverse.quiet = TRUE,
        dplyr.summarise.inform = FALSE)

set.seed(1746)  # From random.org

tar_option_set(packages = c("tidyverse", "here", "fs", "scales", "withr"))

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
             get_from_osf(osf_url = "https://osf.io/msaz8/",
                          out_dir = here_rel("data", "raw_data", "posterior_draws")),
             format = "file"),
  tar_target(survey_results_file,
             get_from_osf(osf_url = "https://osf.io/n2hwm/",
                          out_dir = here_rel("data", "raw_data")),
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
  tar_target(survey_csvy, 
             save_csvy(survey_results,
                       here_rel("data", "derived_data", "survey_results.csv"),
                       here_rel("data", "derived_data", "survey_results.yaml")),
             format = "file"),
  tar_target(participant_summary, create_sample_summary(survey_results)),
  tar_target(giving_aggregate, {
    read_csv(giving_aggregate_file, col_types = cols()) %>%
      mutate(total = `Total donations` * 1000000000)
  }),
  tar_target(giving_per_capita, read_csv(giving_per_capita_file, col_types = cols())),

  # Render the analysis notebook
  tar_notebook_pages(),
  
  # This is only here to trigger a re-build of the R Markdown website's
  # supporting files in `_site`, which copies the files in `output` to
  # `_site/output`. I unfortunately haven't found a way to make it so that the
  # site building occurs independently of `rmarkdown::render()`, so this is the
  # workaround: re-knit index.Rmd
  tar_target(supporting_files, 
             copy_notebook_supporting_files(here_rel("analysis", "index.Rmd"), 
                                            main_manuscript, html, 
                                            appendix, app_html)),
  
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
             format = "file"),
  tar_target(pdf,
             render_pdf(
               input = main_manuscript,
               output = here_rel("manuscript", "output", "manuscript.pdf"),
               bibstyle = bibstyle,
               bib_file),
             format = "file"),
  tar_target(ms_pdf,
             render_pdf_ms(
               input = main_manuscript,
               output = here_rel("manuscript", "output", "manuscript-ms.pdf"),
               bibstyle = bibstyle,
               bib_file),
             format = "file"),
  tar_target(docx,
             render_docx(
               input = main_manuscript,
               output = here_rel("manuscript", "output", "manuscript.docx"),
               csl = csl,
               bib_file),
             format = "file"),
  tar_target(bib,
             extract_bib(
               input_rmd = main_manuscript,
               input_bib = bib_file,
               output = here_rel("manuscript", "output", "extracted-citations.bib")),
             format = "file"),
  
  # Appendix stuff
  tar_target_raw("appendix", here_rel("manuscript", "appendix.Rmd"),
                 format = "file",
                 deps = c("bib_file",
                          tar_knitr_deps(here_rel("manuscript", "appendix.Rmd")))),
  tar_target(app_html,
             render_html(
               input = appendix,
               output = here_rel("manuscript", "output", "appendix.html"),
               csl = csl,
               bib_file,
               support_folder = "output/html-support"),
             format = "file"),
  tar_target(app_pdf,
             render_pdf(
               input = appendix,
               output = here_rel("manuscript", "output", "appendix.pdf"),
               bibstyle = bibstyle,
               bib_file),
             format = "file"),
  tar_target(app_ms_pdf,
             render_pdf_ms(
               input = appendix,
               output = here_rel("manuscript", "output", "appendix-ms.pdf"),
               bibstyle = bibstyle,
               bib_file),
             format = "file"),
  tar_target(app_docx,
             render_docx(
               input = appendix,
               output = here_rel("manuscript", "output", "appendix.docx"),
               csl = csl,
               bib_file),
             format = "file"),
  
  # Always show a word count
  tar_target(word_count, count_words(html)),
  tar_force(show_word_count, print(word_count), TRUE),
  
  # Knit the README
  tar_render(readme, here_rel("README.Rmd"))
)
