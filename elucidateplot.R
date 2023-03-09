library("europepmc")
library("cowplot")
library("tidyverse")


elucidate_trend <- europepmc::epmc_hits_trend(data_src = "med", #searches PubMed/Medline exclusively
                                              query = "elucidate[Text Word]", #search syntax in PubMed
                                              period = 1972:2022)



# Nicer plot

elucidate_trend %>%
  ggplot(aes(x = factor(year), y = num(all_hits))) +
  geom_col(fill = "#27ae60", width = 0.6, alpha = 0.9) +
  scale_y_continuous(expand = c(0, 0)) +
  theme_minimal_hgrid(12) +
  labs(x = "", y = "") +
  ggtitle("Elucidating the Elucidation of Research: 50 Year Overview") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


#most of this script was ripped from Dan Quintana's video which can be found below
# https://www.youtube.com/watch?v=_IlK7eK1jkY
