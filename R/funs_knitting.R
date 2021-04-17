library(bib2df)
library(rvest)
library(xml2)
library(stringi)

render_html <- function(input, output, csl, support_folder, ...) {
  # Add CSS file as a dependency so it goes into the _files directory
  dep <- htmltools::htmlDependency(
    name = "ath",
    version = "1.0.0",
    "pandoc/css",
    stylesheet = "ath-clean.css"
  )
  extra_dependencies <- list(dep)
  
  # IMPORTANT
  # When knitting to docx, bookdown deletes the _files directory for whatever
  # reason, so if you knit to HTML and then docx, you get a nice *_files
  # directly that then disappears when the Word file is done. One way around
  # this is to specify lib_dir here in rmarkdown::render()
  
  out <- rmarkdown::render(
    input = input,
    output_file = output,
    bookdown::html_document2(
      template = "pandoc/templates/html.html",
      pandoc_args = c("--metadata", "link-citations=true",
                      "--metadata", "linkReferences=true",
                      paste0("--csl=", csl)),
      md_extensions = "+raw_tex+smart-autolink_bare_uris+ascii_identifiers",
      toc = TRUE,
      number_sections = FALSE,
      self_contained = FALSE,
      theme = NULL,
      extra_dependencies = extra_dependencies,
      lib_dir = support_folder
    ),
    encoding = "UTF-8"
  )
  
  return(fs::path_rel(out))
}

render_pdf <- function(input, output, bibstyle, ...) {
  out <- rmarkdown::render(
    input = input,
    output_file = output,
    bookdown::pdf_document2(
      template = "pandoc/templates/xelatex.tex",
      latex_engine = "xelatex",
      dev = "cairo_pdf",
      pandoc_args = c("--top-level-division=section",
                      "--shift-heading-level-by=0",
                      "-V", bibstyle,
                      "-V", "chapterstyle=hikma-article"),
      md_extensions = "+raw_tex+smart-autolink_bare_uris",
      toc = FALSE,
      keep_tex = FALSE,
      citation_package = "biblatex"
    ),
    encoding = "UTF-8"
  )
  
  return(fs::path_rel(out))
}

render_pdf_ms <- function(input, output, bibstyle, ...) {
  out <- rmarkdown::render(
    input = input,
    output_file = output,
    bookdown::pdf_document2(
      template = "pandoc/templates/xelatex-manuscript.tex",
      latex_engine = "xelatex",
      dev = "cairo_pdf",
      pandoc_args = c("--top-level-division=section",
                      "--shift-heading-level-by=0",
                      "-V", bibstyle),
      md_extensions = "+raw_tex+smart-autolink_bare_uris",
      toc = FALSE,
      keep_tex = FALSE,
      citation_package = "biblatex"
    ),
    encoding = "UTF-8"
  )
  
  return(fs::path_rel(out))
}

render_docx <- function(input, output, csl, ...) {
  out <- rmarkdown::render(
    input = input,
    output_file = output,
    bookdown::word_document2(
      reference_docx = "pandoc/templates/ath-manuscript.docx",
      pandoc_args = c(paste0("--csl=", csl)),
      md_extensions = "+raw_tex+smart-autolink_bare_uris",
      toc = FALSE,
      number_sections = FALSE
    ),
    encoding = "UTF-8"
  )
  
  return(fs::path_rel(out))
}


extract_bib <- function(input_rmd, input_bib, output, ...) {
  # Load the document
  document <- readLines(input_rmd)
  
  # Find all the citation-looking things in the document. This picks up e-mail
  # addresses (like example@gsu.edu) and it picks up bookdown-style references,
  # like \@ref(fig:thing). I filter out the "ref" entries, but leave the e-mail
  # addresses because there's too much possible variation there to easily remove
  # them. As long as there aren't citation keys like "gsu" or "gmail", it should
  # be fine. I also remove pandoc-crossref-style references like @fig:thing,
  # @tbl:thing, @eq:thing, and @sec:thing
  found_citations <- document %>%
    map(~as_tibble(str_match_all(., "@([[:alnum:]:&!~=_+-]+)")[[1]][,2])) %>%
    bind_rows() %>%
    filter(value != "ref",
           !str_starts(value, "fig:"),
           !str_starts(value, "tbl:"),
           !str_starts(value, "eq:"),
           !str_starts(value, "sec:")) %>%
    distinct(value) %>%
    pull(value)
  
  # Load the bibliography and convert to a data frame
  # When year is the last key in an entry and the closing entry brace is on the
  # same line, like `Year = {2006}}`, bib2df() parses the year as "2006}" and
  # includes the closing }, which then causes warnings about year not being an
  # integer. So here I remove all curly braces from the YEAR column
  suppressWarnings(suppressMessages({
    bib_df <- bib2df(input_bib) %>%
      mutate(YEAR = str_remove_all(YEAR, "\\{|\\}"))
  }))
  
  # In biblatex, entries can be cross-referenced using the crossref key. When
  # including something that's cross-referenced, like an incollection item, the
  # containing item should also be extracted
  if (any(names(bib_df) == "CROSSREF")) {
    crossrefs <- bib_df %>%
      filter(BIBTEXKEY %in% found_citations) %>%
      filter(!is.na(CROSSREF)) %>%
      pull(CROSSREF)
  } else {
    crossrefs <- as.character(0)
  }
  
  # Write a simplified bibtex file to disk (no BibDesk-specific entries) and only
  # include citations that appear in the document or that are cross-referenced
  bib_df %>%
    filter(BIBTEXKEY %in% c(found_citations, crossrefs)) %>%
    select(-starts_with("BDSK"), -RATING, -READ,
           -starts_with("DATE."), -KEYWORDS) %>%
    arrange(CATEGORY, BIBTEXKEY) %>%
    df2bib(output)
}


# string::stri_count_words() counts, um, words. That's its whole job. But it
# doesn't count them like Microsoft Word counts them, and academic publishing
# portals tend to care about Word-like counts. For instance, Word considers
# hyphenated words to be one word, while stringr counts them as two (and even
# worse, stringi counts / as word boundaries, so URLs can severely inflate your
# word count).
#
# Also, academic writing typically doesn't count the title, abstract, table
# text, figure captions, or equations as words in the manuscript (and it
# SHOULDN'T count bibliographies, but it always seems to ugh).
#
# This parses the rendered HTML, removes extra elements, adjusts the text so
# that stringi treats it more like Word, and then finally provides a more
# accurate word count.
count_words <- function(html) {
  # Read the HTML file
  ms_raw <- read_html(html)
  
  # Extract just the article, ignoring title, abstract, etc.
  ms <- ms_raw %>%
    html_nodes("article")
  
  # Get rid of figures, tables, and math
  xml_remove(ms %>% html_nodes("figure"))
  xml_remove(ms %>% html_nodes("table"))
  xml_remove(ms %>% html_nodes(".display"))  # Block math
  xml_replace(ms %>% html_nodes(".inline"), read_xml("<span>MATH</span>")) %>%
    invisible()
  
  # Go through each child element in the article and extract it
  ms_cleaned_list <- map(html_children(ms), ~ {
    .x %>%
      html_text(trim = TRUE) %>%
      # ICU counts hyphenated words as multiple words, so replace - with DASH
      str_replace_all("\\-", "DASH") %>%
      # ICU also counts / as multiple words, so URLs go crazy. Replace / with SLASH
      str_replace_all("\\/", "SLASH") %>%
      # ICU *also* counts [things] in brackets multiple times, so kill those too
      str_replace_all("\\[|\\]", "") %>%
      # Other things to ignore
      str_replace_all("×", "")
  })
  
  # Get count of words! (close enough to Word)
  final_count <- sum(stri_count_words(ms_cleaned_list))
  
  class(final_count) <- c("wordcount", "numeric")
  
  return(final_count)
}

print.wordcount <- function(x) {
  cat(scales::comma(x), "words in manuscript\n")
}
