# Codes for putting SMR and MMR into a dataframe ------
SMR_df_all<- ls(pattern = "^[NH]smr_") |> set_names() |> 
  map(get) |> 
  map(~pluck(.x,"rate.output") |> mean() |> round(digits = 3) |> abs()) |> 
  unlist() |> 
  enframe( name = "Fish_ID", value = "Metabolic_rate") |> 
  mutate(Treatment = ifelse(str_detect(Fish_ID, "^N"), "Normoxic", "Hypoxic"),   
         Aquarium = str_extract(Fish_ID, "(?<=_)\\d{1,2}"),
         Fish_ID = str_extract(Fish_ID, "(?<=_)[^_]+$"), 
         Acclimation = ifelse(Aquarium %in% c(1,3,5,8,10,12), "Hypoxia", "Normoxia"),
         Measured = "SMR")

MMR_df_all <- ls(pattern = "^[NH]mmr_") |> set_names() |> 
  map(get) |> 
  map(~pluck(.x,"rate.output") |> round(digits = 3) |> abs()) |> 
  unlist() |> 
  enframe( name = "Fish_ID", value = "Metabolic_rate") |> 
  mutate(Treatment = ifelse(str_detect(Fish_ID, "^N"), "Normoxic", "Hypoxic"),
         Aquarium = str_extract(Fish_ID, "(?<=_)\\d{1,2}"),
         Fish_ID = str_extract(Fish_ID, "(?<=_)[^_]+$"), 
         Acclimation = ifelse(Aquarium %in% c(1,3,5,8,10,12), "Hypoxia", "Normoxia"),
         Measured = "MMR") 

mr_df <- rbind(MMR_df_all,SMR_df_all) 

### TABLE FOR MASTHER THESIS ### 
metabolic_rate_table <-  mr_df |> 
  pivot_wider(names_from = c("Measured","Treatment"), values_from = "Metabolic_rate") |> 
  distinct(Fish_ID, .keep_all = TRUE)

# export for safty
write.csv(metabolic_rate_table, file = "MR_table.csv",row.names = FALSE,quote = TRUE)



# Codes for ggplots ------

### plot that shows the entire thing together
ggplot(mr_df, aes( x = Treatment, 
                   y = Metabolic_rate,
                   fill = Measured)) +
  geom_boxplot() +
  geom_point(position=position_dodge(width=0.75), aes(group=Acclimation), alpha=0.2)+
  scale_y_continuous(limits = c(0,1.5))+
  labs(x = "Condtion during measurments",
       y ="Oxygen consumption mg/O2/h",
       title = "SMR vs MMR under hypoxic and normoxic conditons",
       ) +
  facet_wrap(facets = vars(Acclimation))+
  scale_fill_manual(values = c("#0097A7", "#FFC107")) +
  theme(strip.text = element_text(size = 10, face = "bold"),
        panel.background = element_rect(fill = "#f1f1f2"),
        strip.background = element_rect(fill = "#B2EBF2"))
  


