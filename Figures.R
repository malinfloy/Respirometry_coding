# Codes for putting SMR and MMR into a dataframe ------

#With aquarium and treatment
SMR_df_all<- ls(pattern = "^[NH]smr_") |> set_names() |> 
  map(get) |> 
  map(~pluck(.x,"rate.output") |> mean() |> round(digits = 3) |> abs()) |> 
  unlist() |> 
  enframe( name = "Fish_ID", value = "mean_value") |> 
  mutate(Treatment = ifelse(str_detect(Fish_ID, "^N"), "Normoxic", "Hypoxic"),   
         Aquarium = str_extract(Fish_ID, "(?<=_)\\d{1,2}"),
         Fish_ID = str_extract(Fish_ID, "(?<=_)[^_]+$"), 
         Acclimation = ifelse(Aquarium %in% c(1,3,5,8,10,12), "Hypoxia", "Normoxia"),
         Name = "SMR")

MMR_df_all <- ls(pattern = "^[NH]mmr_") |> set_names() |> 
  map(get) |> 
  map(~pluck(.x,"rate.output") |> round(digits = 3) |> abs()) |> 
  unlist() |> 
  enframe( name = "Fish_ID", value = "mean_value") |> 
  mutate(Treatment = ifelse(str_detect(Fish_ID, "^N"), "Normoxic", "Hypoxic"),
         Aquarium = str_extract(Fish_ID, "(?<=_)\\d{1,2}"),
         Fish_ID = str_extract(Fish_ID, "(?<=_)[^_]+$"), 
         Acclimation = ifelse(Aquarium %in% c(1,3,5,8,10,12), "Hypoxia", "Normoxia"),
         Name = "MMR") 


# Table for the master thesis
metabolic_rate_table <-  mr_df |> 
  pivot_wider(names_from = c("Name","Treatment"), values_from = "mean_value") |> 
  distinct(Fish_ID, .keep_all = TRUE)


# Codes for ggplots ------

mr_df <- rbind(MMR_df_all,SMR_df_all) 


# plot that shows the entire thing together
ggplot(mr_df, aes( x = Treatment, 
                   y = mean_value,
                   fill = Name)) +
  geom_boxplot() +
  geom_jitter(width = 0.1, height = 0, alpha = 0.3) +
  scale_y_continuous(limits = c(0,1.5))+
  labs(x = "Condtion during measurments",
       y ="Oxygen consumption mg/O2/h",
       title = "SMR vs MMR under hypoxic and normoxic conditons",
       ) +
  facet_wrap(facets = vars(Acclimation))+
  scale_fill_manual(values = c("#E66100", "#5D3A9B")) +
  theme(strip.text = element_text(size = 10, face = "bold"),
        panel.background = element_rect(fill = "grey90"),
        strip.background = element_rect(fill = "#effab2"))
  
#width = 0.1, height = 0, alpha = 0.3

ggplot(mr_df ,aes(x = Treatment, y = mean_value, fill = Name)) +
  geom_boxplot() +
  geom_jitter(width = 0.1, height = 0, alpha = 0.3) +
  #geom_line(aes(group = Name, x = Treatment)) + 
  scale_y_continuous(limits = c(0, 1.5)) +
  labs(x = "Condtion during measurments",
       y = "Oxygen consumption mg/O2/h",
       title = "SMR vs MMR under hypoxic and normoxic conditons") +
  facet_wrap(facets = vars(Acclimation)) +
  scale_fill_manual(values = c("#E66100", "#5D3A9B")) +
  theme(strip.text = element_text(size = 10, face = "bold"),
        panel.background = element_rect(fill = "grey90"),
        strip.background = element_rect(fill = "#effab2"))

