create_sample_summary <- function(survey_results) {
  vars_to_summarize <- tribble(
    ~category, ~variable, ~clean_name,
    "Demographics", "Q5.12", "Gender",
    "Demographics", "Q5.17", "Age",
    "Demographics", "Q5.13", "Marital status",
    "Demographics", "Q5.14", "Education",
    "Demographics", "Q5.15", "Income",
    "Attitudes toward charity", "Q2.5", "Frequency of donating to charity",
    "Attitudes toward charity", "Q2.6", "Amount of donations to charity last year",
    "Attitudes toward charity", "Q2.7_f", "Importance of trusting charities",
    "Attitudes toward charity", "Q2.8_f", "Level of trust in charities",
    "Attitudes toward charity", "Q2.10", "Frequency of volunteering",
    "Politics, ideology, and religion", "Q2.1", "Frequency of following national news",
    "Politics, ideology, and religion", "Q5.7", "Traveled to a developing country",
    "Politics, ideology, and religion", "Q5.1", "Voted in last election",
    "Politics, ideology, and religion", "Q5.6_f", "Trust in political institutions and the state",
    "Politics, ideology, and religion", "Q5.2_f", "Political ideology",
    "Politics, ideology, and religion", "Q5.4", "Involvement in activist causes",
    "Politics, ideology, and religion", "Q5.8", "Frequency of attending religious services",
    "Politics, ideology, and religion", "Q5.9", "Importance of religion"
  )
  
  summarize_factor <- function(x) {
    output <- table(x) %>% 
      as_tibble() %>% 
      magrittr::set_colnames(., c("level", "count")) %>% 
      mutate(level = factor(level, levels = levels(x))) %>%
      mutate(prop = count / sum(count),
             nice_prop = scales::percent(prop))
    
    return(list(output))
  }
  
  participant_summary <- survey_results %>% 
    select(one_of(vars_to_summarize$variable)) %>% 
    summarize(across(everything(), summarize_factor)) %>% 
    pivot_longer(cols = everything(), names_to = "variable", values_to = "details") %>% 
    left_join(vars_to_summarize, by = "variable") %>% 
    unnest(details) %>% 
    mutate(level = as.character(level)) %>% 
    mutate(level = case_when(
      variable == "Q2.7_f" & level == "1" ~ "1 (not important)",
      variable == "Q2.7_f" & level == "7" ~ "7 (important)",
      variable == "Q2.8_f" & level == "1" ~ "1 (no trust)",
      variable == "Q2.8_f" & level == "7" ~ "7 (complete trust)",
      variable == "Q5.6_f" & level == "1" ~ "1 (no trust)",
      variable == "Q5.6_f" & level == "7" ~ "7 (complete trust)",
      variable == "Q5.2_f" & level == "1" ~ "1 (extremely liberal)",
      variable == "Q5.2_f" & level == "7" ~ "7 (extremely conservative)",
      variable == "Q5.15" & level == "Less than median" ~ "Less than 2017 national median ($61,372)",
      variable == "Q5.17" & level == "Less than median" ~ "Less than 2017 national median (36)",
      TRUE ~ level
    )) %>% 
    mutate(category = fct_inorder(category, ordered = TRUE))
  
  return(participant_summary)
}
