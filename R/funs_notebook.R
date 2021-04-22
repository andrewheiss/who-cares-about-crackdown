# This is adapted from TJ Mahr's {notestar}
# (https://github.com/tjmahr/notestar/blob/main/R/tar-notebook.R).
#
# He did all the hard work figuring out how to dynamically generate targets
# based on a bunch of files, while also checking for targets dependencies with
# tarchetypes::tar_knitr_deps(), based on this issue in {tarchetypes}:
# https://github.com/ropensci/tarchetypes/issues/23
#
# I just adapted it for an R Markdown website

notebook_rmd_collate <- function(dir_notebook = "analysis") {
  index <- file.path(dir_notebook, "index.Rmd")
  posts <- list.files(
    path = dir_notebook,
    pattern = ".*[^index].Rmd",
    full.names = TRUE
  )
  c(index, posts)
}

rmd_to_html <- function(x) gsub("[.]Rmd$", ".html", x = x)
html_to_rmd <- function(x) gsub("[.]html$", ".Rmd", x = x)

lazy_list <- function(...) {
  q <- rlang::enexprs(..., .named = TRUE, .check_assign = TRUE)
  data <- list()
  for (x in seq_along(q)) {
    data[names(q[x])] <- list(rlang::eval_tidy(q[[x]], data = data))
  }
  data
}

knit_notebook_page <- function(rmd_in, html_out) {
  rmarkdown::render_site(rmd_in, encoding = "UTF-8")
  html_out
}

tar_notebook_pages <- function(
  dir_notebook = "analysis",
  dir_html = "analysis/_site",
  yaml_config = "analysis/_site.yml"
) {
  
  rmds <- notebook_rmd_collate(dir_notebook)
  
  values <- lazy_list(
    rmd_file = !! rmds,
    rmd_page = basename(.data$rmd_file),
    sym_rmd_page = rlang::syms(.data$rmd_page),
    rmd_deps = lapply(.data$rmd_file, tarchetypes::tar_knitr_deps_expr),
    html_page = rmd_to_html(.data$rmd_page),
    html_file = file.path(!! dir_html, .data$html_page)
  )
  
  list(
    # Add _site.yml as a dependency
    # Have to use tar_target_raw() instead of tar_target() so that yaml_config is usable
    tar_target_raw("site_yml", yaml_config, format = "file"),
    
    # Prepare targets for each of the notebook pages
    tarchetypes::tar_eval_raw(
      quote(
        targets::tar_target(rmd_page, c(rmd_file, site_yml), format = "file")
      ),
      values = values
    ),
    
    tarchetypes::tar_eval_raw(
      quote(
        targets::tar_target(
          html_page,
          command = {
            rmd_deps
            sym_rmd_page
            knit_notebook_page(rmd_file, html_file);
            html_file
          },
          format = "file"
        )
      ),
      values = values
    )
  )
}

copy_notebook_supporting_files <- function(rmd, ...) {
  rmarkdown::render_site(rmd, encoding = "UTF-8")
}
