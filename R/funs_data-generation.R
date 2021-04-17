library(fastDummies)
library(readxl)

process_excel_simulation <- function(simulator_path) {
  suppressMessages({
    sim_raw <- read_excel(simulator_path,
                          sheet = "Results", 
                          range = "O3:AU27")
  })
  
  orgs_raw <- read_excel(simulator_path,
                         sheet = "Results", 
                         range = "N4:O27", 
                         col_names = c("organization", "org_details"))
  
  personas_raw <- read_excel(simulator_path,
                             sheet = "Results", range = "P2:AU3") %>% 
    pivot_longer(everything(), names_to = "persona", values_to = "persona_details")
  
  sim_long <- sim_raw %>% 
    rename(org_details = `...1`) %>% 
    pivot_longer(cols = -org_details, names_to = "persona_details", values_to = "share")
  
  sim_excel_clean <- sim_long %>% 
    left_join(orgs_raw, by = "org_details") %>% 
    left_join(personas_raw, by = "persona_details") %>% 
    separate(org_details, into = c("org_issue", "org_funding", "org_relationship"), sep = ", ") %>% 
    separate(persona_details, into = c("demographics", "actions", "persona_trust"), sep = ", ") %>% 
    separate(demographics, into = c("persona_income", "persona_gender"), sep = " Income ") %>% 
    separate(actions, into = c("persona_ideology", "persona_experience"), sep = " that ") %>% 
    mutate(org_issue = recode(org_issue, "Refugess Relief" = "Refugee Relief"),
           org_funding = recode(org_funding, "Grants" = "Mostly funded by government grants",
                                "Small Donors" = "Mostly funded by small donors"),
           persona_income = paste(persona_income, "income"),
           persona_income = factor(persona_income, levels = c("Lower income", "Higher income"), ordered = TRUE),
           persona_trust = recode(persona_trust,
                                  "Doesn't Trust or Donate" = "Less trusting; donates and volunteers less often",
                                  "Trusts and Donates" = "More trusting; donates and volunteers often"),
           persona_experience = recode(persona_experience,
                                       "Doesn't Read or Travel" = "Doesn't follow news; has not travelled abroad",
                                       "Reads and Travels" = "Follows the news; has travelled abroad")) %>% 
    mutate_at(vars(organization, persona), ~fct_inorder(.))
  
  return(sim_excel_clean)
}

load_gammas <- function(gamma_path) {
  # Gammas of the "everything" model
  gammas <- read_rds(gamma_path) %>% 
    group_by(i, j) %>% 
    summarize(gamma_mean = mean(Gamma)) %>% 
    ungroup() %>% 
    pivot_wider(names_from = j, values_from = gamma_mean) %>% 
    select(-i) %>% 
    t()
  
  return(gammas)
}

build_orgs <- function() {
  organization_columns <- c("organization", "issue.area", "transparency", 
                            "accountability", "funding", "relationship")
  
  organization_possibilities <- expand_grid(
    issue.area = c("Emergency response", "Environment", "Human rights", "Refugee relief"),
    relationship = c("Friendly", "Criticized", "Under crackdown"),
    funding = c("Small private donations", "Government grants")
  ) %>% 
    mutate(org_id = paste0("org", 1:n()))
  
  organizations <- organization_possibilities %>% 
    mutate(
      organization = "Red Cross",
      transparency = "Yes",
      accountability = "Yes"
    ) %>% 
    select(org_id, all_of(organization_columns)) %>% 
    mutate(organization = factor(organization, 
                                 levels = c("Amnesty International", "Greenpeace", 
                                            "Oxfam", "Red Cross")),
           issue.area = factor(issue.area, 
                               levels = c("Emergency response", "Environment", 
                                          "Human rights", "Refugee relief")),
           transparency = factor(transparency, levels = c("No", "Yes")),
           accountability = factor(accountability, levels = c("No", "Yes")),
           funding = factor(funding, levels = c("Small private donations", 
                                                "Handful of wealthy private donors", 
                                                "Government grants")),
           relationship = factor(relationship, levels = c("Friendly", "Criticized", 
                                                          "Under crackdown")))
  
  org_details <- organizations %>% 
    mutate(organization = str_replace(org_id, "org", "Org "),
           funding = fct_recode(funding, 
                                "Mostly funded by small donors" = "Small private donations",
                                "Mostly funded by government grants" = "Government grants"),
           relationship = fct_rev(relationship)) %>%
    select(org_id, organization, org_issue = issue.area, 
           org_funding = funding, org_relationship = relationship)
  
  org_table <- organizations %>% 
    dummy_columns(select_columns = organization_columns,
                  remove_selected_columns = TRUE) %>% 
    pivot_longer(cols = -org_id, names_to = "name", ) %>% 
    pivot_wider(names_from = org_id, values_from = value) %>% 
    separate(name, into = c("attribute", "option"), sep = "_") %>% 
    filter(!(option %in% c("Emergency response", "No", "Small private donations", "Friendly")))
  
  org_attributes <- tribble(
    ~`Issue area`, ~`Relationship with government`, ~`Funding`, ~`Funding sources`, ~`Organizational practices`, ~`Organization`,
    "Emergency response", "Friendly", "Small private donors", "Small private donors", "Financial transparency", "Amnesty International",
    "Environment", "Criticized", "Government grants", "Wealthy donors", "Accountability", "Greenpeace",
    "Human rights", "Crackdown", NA, "Government grants", NA, "Oxfam",
    "Refugee relief", NA, NA, NA, NA, "Red Cross"
  )
  
  return(lst(org_details, org_table, org_attributes))
}

build_personas <- function() {
  persona_columns <- c("national.news", "international.news", "medium.follow.tv", 
                       "medium.follow.print", "medium.follow.online", "medium.follow.social", 
                       "medium.follow.radio", "medium.follow.email", "medium.follow.app", 
                       "follow.govt", "travel", "ideology", "trust.institutions", 
                       "should.be.charitable", "religious.attendance", "religion.importance", 
                       "religion", "trust.charity.importance", "trust.charities", 
                       "donation.frequency", "donated.last.year", "volunteered", 
                       "volunteer.frequency", "history.activism.personal", "history.activism.family",
                       "membership.church", "membership.sport", "membership.art", "membership.union", 
                       "membership.party", "membership.environment", "membership.professional", 
                       "membership.charitable", "membership.consumer", "membership.other", 
                       "gender", "marital", "education", "income", "race", "age")
  
  persona_demographics <- expand_grid(
    income = c("Less than median", "More than median"),
    education = c("High school graduate", "4 year degree"),
    religious.attendance = c("Rarely", "At least once a month")
  ) %>% 
    mutate(demographics_id = 1:n())
  
  persona_politics <- tribble(
    ~ideology, ~national.news, ~international.news, ~travel,
    "Extremely liberal", "At least once a day",  "Always", "Yes",
    "Extremely conservative", "At least once a day", "Always", "Yes",
    "Extremely liberal", "Rarely", "Never", "No",
    "Extremely conservative", "Rarely", "Never", "No"
  ) %>% 
    mutate(politics_id = 1:n())
  
  persona_social <- tibble(
    social_id = 1:2,
    trust.institutions = c("Complete trust", "No trust"),
    should.be.charitable = c("Strongly agree", "Strongly disagree"),
    trust.charities = c("Complete trust", "No trust"),
    volunteer.frequency = c("At least once a month", "Rarely"),
    donation.frequency = c("At least once a month", 
                           "More than once a month, less than once a year"),
    history.activism.personal = c("Involved", "Not involved"),
    membership.party = c("Active member", "Don't belong"),
    membership.charitable = c("Active member", "Don't belong")
  )
  
  persona_possibilities <- expand_grid(
    demographics_id = persona_demographics$demographics_id,
    politics_id = persona_politics$politics_id,
    social_id = persona_social$social_id
  ) %>% 
    left_join(persona_demographics, by = "demographics_id") %>% 
    left_join(persona_politics, by = "politics_id") %>% 
    left_join(persona_social, by = "social_id") %>% 
    select(-ends_with("_id")) %>% 
    mutate(persona_id = paste0("persona", 1:n()))
  
  # Columns that should be held constant
  # persona_columns %>% .[!(. %in% colnames(persona_possibilities))] %>% cat(sep = "\n")
  
  personas <- persona_possibilities %>% 
    mutate(
      medium.follow.tv = "Follow",
      medium.follow.print = "Follow",
      medium.follow.online = "Don't follow",
      medium.follow.social = "Follow",
      medium.follow.radio = "Don't follow",
      medium.follow.email = "Don't follow",
      medium.follow.app = "Don't follow",
      follow.govt = "Often",
      religion.importance = "Important",
      religion = "Protestant",
      trust.charity.importance = "Somewhat important",
      donated.last.year = "$100-$499",
      volunteered = "No",
      history.activism.family = "Not involved",
      membership.church = "Don't belong",
      membership.sport = "Don't belong",
      membership.art = "Don't belong",
      membership.union = "Don't belong",
      membership.environment = "Don't belong",
      membership.professional = "Don't belong",
      membership.consumer = "Don't belong",
      membership.other = "Don't belong",
      gender = "Male",
      marital = "Married",
      race = "White",
      age = "Less than median"
    ) %>% 
    select(persona_id, all_of(persona_columns)) %>% 
    mutate(
      national.news = factor(national.news, levels = c("Rarely", "Once a week", "At least once a day")),
      international.news = factor(international.news, levels = c("Never", "Sometimes", "Always")),
      medium.follow.tv = factor(medium.follow.tv, levels = c("Don't follow", "Follow")),
      medium.follow.print = factor(medium.follow.print, levels = c("Don't follow", "Follow")),
      medium.follow.online = factor(medium.follow.online, levels = c("Don't follow", "Follow")),
      medium.follow.social = factor(medium.follow.social, levels = c("Don't follow", "Follow")),
      medium.follow.radio = factor(medium.follow.radio, levels = c("Don't follow", "Follow")),
      medium.follow.email = factor(medium.follow.email, levels = c("Don't follow", "Follow")),
      medium.follow.app = factor(medium.follow.app, levels = c("Don't follow", "Follow")),
      follow.govt = factor(follow.govt, levels = c("Not often", "Often")),
      travel = factor(travel, levels = c("No", "Yes")),
      ideology = factor(ideology, 
                        levels = c("Extremely liberal", "Somewhat liberal", 
                                   "Slightly liberal", "Moderate", "Slightly conservative", 
                                   "Somewhat conservative", "Extremely conservative")),
      trust.institutions = factor(trust.institutions,
                                  levels = c("No trust", "Very little trust", "Little trust", 
                                             "Neutral", "Some trust", "A lot of trust", "Complete trust")),
      should.be.charitable = factor(should.be.charitable,
                                    levels = c("Strongly disagree", "Disagree", "Somewhat disagree", 
                                               "Neutral", "Somewhat agree", "Agree", "Strongly agree")),
      religious.attendance = factor(religious.attendance,
                                    levels = c("Not sure", "Rarely", "At least once a month")),
      religion.importance = factor(religion.importance,
                                   levels = c("Not important", "Important")),
      religion = factor(religion, 
                        levels = c("Catholic", "Protestant", "Christian Orthodox", "Jewish", 
                                   "Muslim", "Sikh", "Hindu", "Buddhist", "Atheist", "Other")),
      trust.charity.importance = factor(trust.charity.importance,
                                        levels = c("Not important", "Very unimportant", 
                                                   "Somewhat unimportant", "Neutral", 
                                                   "Somewhat important", "Very important", "Essential")),
      trust.charities = factor(trust.charities,
                               levels = c("No trust", "Very little trust", "Little trust", 
                                          "Neutral", "Some trust", "A lot of trust", "Complete trust")),
      donation.frequency = factor(donation.frequency,
                                  levels = c("More than once a month, less than once a year", "At least once a month")),
      donated.last.year = factor(donated.last.year,
                                 levels = c("$1-$49", "$50-$99", "$100-$499", "$500-$999", 
                                            "$1000-$4,999", "$5000-$9,999", "$10,000+")),
      volunteered = factor(volunteered, levels = c("No", "Yes")),
      volunteer.frequency = factor(volunteer.frequency,
                                   levels = c("Haven't volunteered in past 12 months", "Rarely", 
                                              "More than once a month, less than once a year", 
                                              "At least once a month")),
      history.activism.personal = factor(history.activism.personal,
                                         levels = c("Not involved", "Involved")),
      history.activism.family = factor(history.activism.family,
                                       levels = c("Not involved", "Involved")),
      membership.church = factor(membership.church,
                                 levels  = c("Don't belong", "Inactive member", "Active member")),
      membership.sport = factor(membership.sport,
                                levels = c("Don't belong", "Inactive member", "Active member")),
      membership.art = factor(membership.art,
                              levels = c("Don't belong", "Inactive member", "Active member")),
      membership.union = factor(membership.union,
                                levels = c("Don't belong", "Inactive member", "Active member")),
      membership.party = factor(membership.party,
                                levels = c("Don't belong", "Inactive member", "Active member")),
      membership.environment = factor(membership.environment,
                                      levels = c("Don't belong", "Inactive member", "Active member")),
      membership.professional = factor(membership.professional,
                                       levels  = c("Don't belong", "Inactive member", "Active member")),
      membership.charitable = factor(membership.charitable,
                                     levels  = c("Don't belong", "Inactive member", "Active member")),
      membership.consumer = factor(membership.consumer,
                                   levels  = c("Don't belong", "Inactive member", "Active member")),
      membership.other = factor(membership.other,
                                levels = c("Don't belong", "Inactive member", "Active member")),
      gender = factor(gender,
                      levels = c("Male", "Female", "Transgender", "Prefer not to say", "Other")),
      marital = factor(marital,
                       levels = c("Married", "Widowed", "Divorced", "Separated", "Never married")),
      education = factor(education,
                         levels = c("Less than high school", "High school graduate", "Some college", 
                                    "2 year degree", "4 year degree", "Graduate or professional degree", "Doctorate")),
      income = factor(income,
                      levels = c("Less than median", "More than median")),
      race = factor(race,
                    levels = c("White", "Black or African American", "American Indian or Alaska Native", 
                               "Asian", "Native Hawaiian or Pacific Islander", "Other")),
      age = factor(age,
                   levels = c("Less than median", "More than median"))
    )
  
  persona_base_cases <- c(
    "national.news_Rarely",
    "international.news_Never",
    "follow.govt_Not often",
    "travel_No",
    "ideology_Extremely liberal",
    "trust.institutions_No trust",
    "should.be.charitable_Strongly disagree",
    "religious.attendance_Not sure",
    "religion.importance_Not important",
    "religion_Catholic",
    "trust.charity.importance_Not important",
    "trust.charities_No trust",
    "donation.frequency_More than once a month, less than once a year",
    "donated.last.year_$1-$49",
    "volunteered_No",
    "volunteer.frequency_Haven't volunteered in past 12 months",
    "history.activism.personal_Not involved",
    "history.activism.family_Not involved",
    "gender_Male",
    "marital_Married",
    "education_Less than high school",
    "income_Less than median",
    "age_Less than median"
  )
  
  persona_details <- personas %>% 
    mutate(persona_income = fct_recode(income, 
                                       "Lower income" = "Less than median", 
                                       "Higher income" = "More than median"),
           persona_education = fct_recode(education, "College graduate" = "4 year degree"),
           persona_religion = fct_recode(religious.attendance, 
                                         "Rarely attends religious services" = "Rarely",
                                         "Attends at least monthly" = "At least once a month"),
           persona_ideology = fct_recode(ideology, 
                                         "Conservative" = "Extremely conservative",
                                         "Liberal" = "Extremely liberal"),
           persona_experience = ifelse(travel == "Yes", 
                                       "Follows the news; has travelled abroad", 
                                       "Doesn't follow news; has not travelled abroad"),
           persona_trust = ifelse(trust.charities == "Complete trust", 
                                  "More trusting; donates and volunteers often", 
                                  "Less trusting; donates and volunteers less often")) %>% 
    mutate(persona = str_replace(persona_id, "persona", "Persona ")) %>% 
    select(persona, starts_with("persona"))
  
  persona_table <- personas %>% 
    dummy_columns(select_columns = persona_columns,
                  remove_selected_columns = TRUE) %>% 
    pivot_longer(cols = -persona_id, names_to = "name", ) %>% 
    pivot_wider(names_from = persona_id, values_from = value) %>% 
    # Get rid of base cases
    filter(!(name %in% persona_base_cases)) %>% 
    filter(!str_detect(name, "Don't follow"),
           !str_detect(name, "Don't belong")) %>% 
    separate(name, into = c("attribute", "option"), sep = "_") %>% 
    # Add intercept
    add_row(attribute = "Intercept", option = "Intercept", .before = 1) %>% 
    mutate(across(everything(), ~replace_na(., 1)))
  
  persona_attributes <- tribble(
    ~`Demographics`, ~`Politics and public affairs`, ~`Social views`,
    "Higher income (> US median ($61,372)), high school graduate, frequent religious attendance", "Liberal (1), follows national and international news often, has traveled internationally", "High social trust: Trusts political institutions, trusts charities, thinks people should be more charitable, frequently volunteers, donates once a month, has a history of personal activism, is a member of an association",
    "Lower income (< US median), high school graduate, frequent religious attendance", "Conservative (7), follows news, has traveled", "Low social trust: Does not trust political institutions or charities, thinks people should be less charitable, does not volunteer or donate often, has no history of personal activism, is not a member of an association",
    "Higher income, college graduate, frequent religious attendance", "Liberal, does not follow news, has not traveled", NA,
    "Lower income, college graduate, frequent religious attendance", "Conservative, does not follow news, has not traveled", NA,
    "Higher income, high school graduate, rare religious attendance", NA, NA,
    "Lower income, high school graduate, rare religious attendance", NA, NA,
    "Higher income, college graduate, rare religious attendance", NA, NA,
    "Lower income, college graduate, rare religious attendance", NA, NA
  )
  
  return(lst(persona_details, persona_table, persona_attributes))
}

create_predicted_market_shares <- function(gammas, personas, orgs) {
  predicted_betas <- personas$persona_table %>% 
    summarize(across(starts_with("persona"), ~as.matrix(gammas) %*% as.matrix(.)))
  
  expected_utilities <- exp(t(orgs$org_table[,3:ncol(orgs$org_table)]) %*% 
                              as.matrix(predicted_betas[,1:ncol(predicted_betas)])) %>% 
    as_tibble(rownames = "org")
  
  prop_expected_utilities <- expected_utilities %>% 
    mutate(across(starts_with("persona"), ~. / sum(.)))
  
  return(prop_expected_utilities)
}

create_simulation <- function(eu, personas, orgs) {
  sim_clean <- eu %>% 
    pivot_longer(cols = -org, names_to = "persona_id", values_to = "share") %>% 
    left_join(orgs$org_details, by = c("org" = "org_id")) %>% 
    left_join(personas$persona_details, by = "persona_id")
  
  return(sim_clean)
}
