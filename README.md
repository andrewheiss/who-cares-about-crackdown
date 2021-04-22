
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Who Cares About Crackdowns? Exploring the Role of Trust in Individual Philanthropy

[Suparna Chaudhry](http://www.suparnachaudhry.com/) • Department of
International Affairs • Lewis & Clark College  
[Marc Dotson](https://marriottschool.byu.edu/directory/details?id=50683)
• Marriott School of Business • Brigham Young University  
[Andrew Heiss](https://www.andrewheiss.com/) • Andrew Young School of
Policy Studies • Georgia State University

------------------------------------------------------------------------

[![OSF
DOI](https://img.shields.io/badge/OSF-10.17605%2FOSF.IO%2FSM5EW-blue)](https://doi.org/10.17605/OSF.IO/SM5EW)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4064840.svg)](https://doi.org/10.5281/zenodo.4064840)

> Suparna Chaudhry, Marc Dotson, and Andrew Heiss. 2021. [“Who Cares
> About Crackdowns? Exploring the Role of Trust in Individual
> Philanthropy,”](https://doi.org/10.17605/OSF.IO/SM5EW)

**All this project’s materials are free and open:**

-   [Download the data](#data)
-   [See the analysis notebook
    website](https://stats.andrewheiss.com/who-cares-about-crackdowns/)

![Preregistered](img/preregistered_large_color.png)   ![Open
data](img/data_large_color.png)   ![Open](img/materials_large_color.png)

------------------------------------------------------------------------

## Abstract

The phenomenon of closing civic space has adversely impacted the
operations of INGOs. It has not just resulted in net losses of income
for INGOs, but also how and where funds are allocated. We argue that
individual private donors can be important in sustaining the operations
of INGOs working in repressive contexts. Individual donors do not use
the same performance-based metrics as official aid donors. Rather, trust
can be an important component of individual donor support for nonprofits
working towards difficult goals. How does trust in charitable
organizations influence individuals’ preferences to donate, especially
when these groups face crackdown? Using a simulated market for
philanthropic donations towards INGOs, based on data from a nationally
representative sample of individuals in the United States who regularly
donate to charity, we find that trust in charitable organizations
matters substantially in shaping donor preferences. Donor profiles with
high levels of social trust are likely to donate to INGOs with friendly
relationships with host governments. This support holds steady if INGOs
face criticism or crackdown. In contrast, donor profiles with lower
levels of social trust prefer to donate to organizations that do not
face criticism or crackdown abroad. The global crackdown on NGOs may
thus possibly sour NGOs’ least trusting individual donors. Our findings
have practical implications for INGOs raising funds from individuals
amid closing civic space.

------------------------------------------------------------------------

This repository contains the data and code for our paper. Our preprint
is online here:

> Suparna Chaudhry, Marc Dotson, and Andrew Heiss. 2021. “Who Cares
> About Crackdowns? Exploring the Role of Trust in Individual
> Philanthropy”". Online at <https://doi.org/10.17605/OSF.IO/SM5EW>

## How to download and replicate

You can either [download the compendium as a ZIP
file](/archive/master.zip) or use GitHub to clone or fork the compendium
repository (see the green “Clone or download” button at the top of the
GitHub page).

We use the [**renv**
package](https://rstudio.github.io/renv/articles/renv.html) to create a
stable version-specific library of packages, and we use the [**targets**
package](https://docs.ropensci.org/targets/) to manage all file
dependencies and run the analysis. To reproduce the findings and re-run
the analysis, do the following:

1.  Download and install these two fonts:
    -   [IBM Plex Sans](https://fonts.google.com/specimen/IBM+Plex+Sans)
    -   [Lora](https://fonts.google.com/specimen/Lora)
2.  [Install R](https://cloud.r-project.org/) (and preferably
    [RStudio](https://www.rstudio.com/products/rstudio/download/#download)).
3.  Open `whocares.Rproj` to open an [RStudio
    Project](https://r4ds.had.co.nz/workflow-projects.html).
4.  Make sure you have a working installation of LaTeX:
    -   *Easy-and-recommended way*: Install the **tinytex** package by
        running `install.packages("tinytex")` in the R console, then run
        `tinytex::install_tinytex()`
    -   *Easy-but-requires-huge-4+-GB-download way*: Download TeX Live
        ([macOS](http://www.tug.org/mactex/);
        [Windows](https://miktex.org/))
5.  If it’s not installed already, R *should* try to install the
    **renv** package when you open the RStudio Project for the first
    time. If you don’t see a message about package installation, install
    it yourself by running `install.packages("renv")` in the R console.
6.  Run `renv::restore()` in the R console to install all the required
    packages for this project.
7.  Run `targets::tar_make()` in the R console to automatically download
    all data files, process the data, run the analysis, and compile the
    paper and appendix.

Running `targets::tar_make()` will create several helpful outputs:

1.  All project data in `data/`
2.  An analysis notebook website in `analysis/_site/index.html`
3.  PDF, HTML, and Word versions of the manuscript in
    `manuscript/output/`

## Data

This project includes the following data files:

-   [**`data/raw_data/final_data.rds`**](https://osf.io/n2hwm/):
    Original results from the Qualtrics survey. This is [hosted at
    OSF](https://osf.io/n2hwm/) because of its size. Running
    `targets::tar_make(survey_results_file)` will download the `.rds`
    file from OSF and place it in `data/raw_data`. The [code for
    cleaning and processing this data is part of a separate project,
    “Why Donors
    Donate”](https://github.com/andrewheiss/why-donors-donate).
-   [**`data/derived_data/survey_results.csv`**](data/derived_data/survey_results.csv):
    CSV version of the survey data.
-   [**`data/derived_data/survey_results.yaml`**](data/derived_data/survey_results.yaml):
    [YAML metadata](https://csvy.org/) describing the syntax of the
    survey data.
-   [**`data/raw_data/posterior_draws/public_political_social_charity_demo.rds`**](https://osf.io/msaz8/):
    Gamma (Γ) coefficients from our multilevel Bayesian model. This is
    [hosted at OSF](https://osf.io/msaz8/) because of its size. Running
    `targets::tar_make(gamma_draws_file)` will download the `.rds` file
    from OSF and place it in `data/raw_data/posterior_draws`. The [code
    for running this model is part of a separate project, “Why Donors
    Donate”](https://github.com/andrewheiss/why-donors-donate).
-   [**`data/raw_data/Market Simulator Version 01.xlsx`**](data/raw_data/Market%20Simulator%20Version%2001.xlsx):
    An interactive Excel version of the market simulator to help
    demonstrate the intuition behind all the moving parts of the
    simulation.
-   [**`data/raw_data/data-xextT.csv`**](data/raw_data/data-xextT.csv):
    Per capita charitable donations in the US (2000–2014), downloaded
    from the [Datawrapper widget “How much money Americans give
    away”](https://theconversation.com/fewer-americans-are-giving-money-to-charity-but-total-donations-are-at-record-levels-anyway-98291#xextT)
    at [“Fewer Americans are giving money to charity but total donations
    are at record levels
    anyway”](https://theconversation.com/fewer-americans-are-giving-money-to-charity-but-total-donations-are-at-record-levels-anyway-98291).
-   [**`data/raw_data/data-FTjUv.csv`**](data/raw_data/data-FTjUv.csv):
    Aggregate charitable donations in the US (1977–2017), downloaded
    from the [Datawrapper widget “Four decades of American charitable
    giving”](https://theconversation.com/fewer-americans-are-giving-money-to-charity-but-total-donations-are-at-record-levels-anyway-98291#FTjUv)
    at [“Fewer Americans are giving money to charity but total donations
    are at record levels
    anyway”](https://theconversation.com/fewer-americans-are-giving-money-to-charity-but-total-donations-are-at-record-levels-anyway-98291).

## Licenses

**Text and figures:** All prose and images are licensed under Creative
Commons ([CC-BY-4.0](http://creativecommons.org/licenses/by/4.0/)).

**Code:** All code is licensed under the [MIT License](LICENSE.md).

## Contributions

We welcome contributions from everyone. Before you get started, please
see our [contributor guidelines](CONTRIBUTING.md). Please note that this
project is released with a [Contributor Code of Conduct](CONDUCT.md). By
participating in this project you agree to abide by its terms.
