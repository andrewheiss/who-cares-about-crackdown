library(patchwork)
library(scales)

plot_income <- function(grey = FALSE) {
  if (grey) {
    color_pairs <- c("grey30", "grey80")
  } else {
    color_pairs <- clrs_ngo_pairs[[1]]
  }
  
  plot_income_issue <- sim_final %>% 
    group_by(org_issue, persona_income) %>% 
    summarize(avg_share = mean(share)) %>% 
    mutate(facet = "Issue area") %>% 
    ggplot(aes(y = fct_rev(str_wrap_factor(org_issue, 15)),
               x = avg_share, color = fct_rev(persona_income))) +
    geom_pointrange(size = 0.75, fatten = 1.5,
                    aes(xmin = 0, xmax = ..x..), position = position_dodge(width = 0.5)) + 
    scale_x_continuous(labels = percent_format(accuracy = 1), expand = expansion(add = c(0, 0.002)),
                       breaks = seq(0, 0.06, 0.02)) +
    scale_color_manual(values = color_pairs, guide = FALSE) +
    coord_cartesian(xlim = c(0, 0.06)) +
    labs(x = "Average donation share", y = NULL, color = NULL) +
    facet_wrap(vars(facet)) +
    theme_ngo() +
    theme(panel.grid.major.y = element_blank())
  
  plot_income_funding <- sim_final %>% 
    group_by(org_funding, persona_income) %>% 
    summarize(avg_share = mean(share)) %>% 
    mutate(facet = "Funding sources") %>% 
    ggplot(aes(y = fct_rev(str_wrap_factor(org_funding, 10)), 
               x = avg_share, color = fct_rev(persona_income))) +
    geom_pointrange(size = 0.75, fatten = 1.5,
                    aes(xmin = 0, xmax = ..x..), position = position_dodge(width = 0.5)) + 
    scale_x_continuous(labels = percent_format(accuracy = 1), expand = expansion(add = c(0, 0.002))) +
    coord_cartesian(xlim = c(0, 0.06)) +
    scale_color_manual(values = color_pairs, guide = FALSE) +
    labs(x = "Average donation share", y = NULL, color = NULL) +
    facet_wrap(vars(facet)) +
    theme_ngo() +
    theme(panel.grid.major.y = element_blank())
  
  plot_income_relationship <- sim_final %>% 
    mutate(persona_income = fct_recode(persona_income,
                                       "< $61,372/year" = "Lower income",
                                       "> $61,372/year" = "Higher income")) %>% 
    group_by(org_relationship, persona_income) %>% 
    summarize(avg_share = mean(share)) %>% 
    mutate(facet = "Relationship with host government") %>% 
    ggplot(aes(y = fct_rev(str_wrap_factor(org_relationship, 10)), 
               x = avg_share, color = fct_rev(persona_income))) +
    geom_pointrange(size = 0.75, fatten = 1.5, 
                    aes(xmin = 0, xmax = ..x..), position = position_dodge(width = 0.5)) +
    scale_x_continuous(labels = percent_format(accuracy = 1), expand = expansion(add = c(0, 0.003))) +
    coord_cartesian(xlim = c(0, 0.1)) +
    scale_color_manual(values = color_pairs, 
                       guide = guide_legend(reverse = TRUE, nrow = 1,
                                            override.aes = list(size = 0.25,
                                                                linetype = 0))) +
    labs(x = "Average donation share", y = NULL, color = NULL) +
    facet_wrap(vars(str_wrap(facet, 50))) +
    theme_ngo() +
    theme(panel.grid.major.y = element_blank(),
          legend.key.width = unit(0.5, "lines"))
  
  plot_income_relationship_extreme <- sim_excel_final %>% 
    mutate(persona_income = fct_recode(persona_income,
                                       "$50,000/year" = "Lower income",
                                       "$100,000/year" = "Higher income"),
           org_relationship = fct_recode(org_relationship,
                                         "Under crackdown" = "Crackdown")) %>% 
    group_by(org_relationship, persona_income) %>% 
    summarize(avg_share = mean(share)) %>% 
    mutate(facet = "Relationship with host government") %>% 
    ggplot(aes(y = fct_rev(str_wrap_factor(org_relationship, 10)), 
               x = avg_share, color = fct_rev(persona_income))) +
    geom_pointrange(size = 0.75, fatten = 1.5, linetype = "21", pch = 2,
                    aes(xmin = 0, xmax = ..x..), position = position_dodge(width = 0.5)) + 
    scale_x_continuous(labels = percent_format(accuracy = 1), expand = expansion(add = c(0, 0.002))) +
    coord_cartesian(xlim = c(0, 0.1)) +
    scale_color_manual(values = color_pairs, 
                       guide = guide_legend(reverse = TRUE, nrow = 1,
                                            override.aes = list(size = 0.25, 
                                                                linetype = 0))) +
    labs(x = "Average donation share", y = NULL, color = NULL) +
    facet_wrap(vars(str_wrap(facet, 50))) +
    theme_ngo() +
    theme(panel.grid.major.y = element_blank(),
          legend.key.width = unit(0.5, "lines"))
  
  plot_income <- ((plot_income_issue + labs(x = NULL)) + 
                    (plot_income_funding + labs(x = NULL))) / 
    (plot_income_relationship + plot_income_relationship_extreme)
  
  plot_income
}
