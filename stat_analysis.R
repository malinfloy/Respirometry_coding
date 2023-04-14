#linear mixed model 

# response variable is metabolic rate, treatment if the fixed effect of interest
# 1|Fish_Id specifies that there is a random intercept for each fish

# Fit LMM for SMR
model_SMR <- lmer(Metabolic_rate ~ Treatment + (1 | Fish_ID), data = SMR_df_all)
print(model_SMR) # MR increased by 0.17 from N to H.

model_SMR1 <- lmer(Metabolic_rate ~ Treatment + Acclimation + (1 | Fish_ID), data = SMR_df_all)
print(model_SMR1)


#MMR
model_MMR <- lmer(Metabolic_rate ~ Treatment + (1 | Fish_ID), data = MMR_df_all)
print(model_MMR) # 0.33 N->H

# Print model summary
summary(model_SMR) # metabolic rate is reduced by -0.46 from hypoxic to normoxic
summary(model_MMR)

report(model_SMR) |> summary()
report_table(model_SMR) |> summary()

plot(model_SMR)
qqnorm(resid(model_SMR))
qqline(resid(model_SMR))


plot(model_MMR)
qqnorm(resid(model_MMR))
qqline(resid(model_MMR))






# specific growth rate analysis
Growth_data <- read_excel("weight_start_end.xlsx") |> 
  mutate(days = 58)

specific_growth_rate <- (log(as.numeric(Growth_data$Weight_end)) - log(as.numeric(Growth_data$Weight_start))) / 
  (Growth_data$days)*100

print(paste("Specific growth rate:", specific_growth_rate))
