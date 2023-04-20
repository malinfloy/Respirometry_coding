

###### Linear mixed model analysis ####
## testing of model ##
#check model 
##Start with the fullest model
mod1Aic <- lmer(MMR ~ Treatment*Acclimation + (1|Fish_ID), na.action=na.omit, data = MMR_all, REML = F) 
##Then remove the interaction
mod2Aic <- lmer(MMR ~ Treatment+Acclimation + (1|Fish_ID), na.action=na.omit, data = MMR_all, REML = F) 
###If the change in AIC is <+2 points then it does not support the removal of the interaction
extractAIC(mod1Aic) - extractAIC(mod2Aic) 
# AIC does not support the removal of the interaction so keep mod1Aic
# the deltaAIC is <+2 points.

summary(mod1Aic)

###Total variance = fish_ID+residual = 
0.03786 + 0.02603 =0.06389
0.03786/0.06389*100 # 59% of the variance not explained by the model is due to individual differences

## Adding SGR and final weight, testing what is best:
mod3Aic <- lmer(MMR ~ Treatment+Acclimation + SGR + Weight_end + (1|Fish_ID), na.action=na.omit, data = MMR_all, REML = F)
mod3.2Aic <- lmer(MMR ~ Treatment+Acclimation + SGR + (1|Aquarium/Fish_ID), na.action=na.omit, data = MMR_all, REML = F)
mod3.3Aic <- lmer(MMR ~ Treatment+Acclimation + Weight_end + (1|Aquarium/Fish_ID), na.action=na.omit, data = MMR_all, REML = F)

extractAIC(mod1Aic) ## favoured
extractAIC(mod2Aic) ## Last model that was favoured by AIC
extractAIC(mod3Aic) ##  the addition of SGR and final weight? 
extractAIC(mod3.2Aic) ##  the removal of final weight?
extractAIC(mod3.3Aic) ##  the removal of SGR 

### SMR analysis ### ----
# new df for SMR analysis
SMR_all <- merge(Growth_data, SMR_df_all, by= "Fish_ID") |> 
  mutate(SGR = round((((log(Weight_end)-log(Weight_start))/58)*100), digits = 2)) |> 
  rename(SMR = Metabolic_rate)

#check the data 
hist(SMR_all$SMR) # two high outliers
SMR_all<- subset(SMR_all, SMR<2)
hist(SMR_all$SMR)

### Final model with final weight ###

mod_SMRW <- lmer(SMR ~ Treatment*Acclimation + Weight_end + (1|Aquarium/Fish_ID), na.action=na.omit, data = SMR_all, REML = F)
summary(mod_SMRW)
confint(mod_SMRW, level=0.95)

# P values
modxnlme_weight <-lme(SMR ~ Treatment*Acclimation+Weight_end, random = ~1|Fish_ID, na.action=na.omit, data = SMR_all)
summary(modxnlme_weight) 

anova(modxnlme_weight)

# plot to see
ggplot(SMR_all, aes(x=factor(Treatment), y = as.numeric(SMR))) + 
  geom_boxplot(aes(fill=Acclimation)) + geom_point(position=position_dodge(width=0.75), aes(group=Acclimation), alpha=0.2)


### MMR analysis ### ----
# new df for MMR analysis
MMR_all <- merge(Growth_data, MMR_df_all, by= "Fish_ID") |> 
  mutate(SGR = round((((log(Weight_end)-log(Weight_start))/58)*100), digits = 2)) |> 
  rename(MMR = Metabolic_rate)

# check data
hist(MMR_all$MMR)
MMR_all<- subset(MMR_all, MMR<1.5)
hist(MMR_all$MMR)

### Final model MMR with final weight - Estimate extraction ###
mod_MMRW <- lmer(MMR ~ Treatment*Acclimation + Weight_end + (1|Aquarium/Fish_ID), na.action=na.omit, data = MMR_all, REML = F)
summary(mod_MMRW)
confint(mod_MMRW, level=0.95)

modxnlme_weight_1 <- lme(MMR ~ Treatment*Acclimation+Weight_end, random = ~1|Fish_ID, na.action=na.omit, data = MMR_all)
summary(modxnlme_weight_1)
anova(modxnlme_weight_1)

#plot to see
p <-ggplot(MMR_all, aes(x=factor(Treatment), y = as.numeric(MMR))) + 
  geom_boxplot(aes(fill=Acclimation)) + geom_point(position=position_dodge(width=0.75), aes(group=Acclimation), alpha=0.2)
p

#check estimates
qqnorm(resid(modxnlme_1))
plot(modxnlme_1, factor(Fish_ID)~resid(.), abline=0)
  
### specific growth rate analysis + aerobic scope + plots ---- 

Growth_data <- read_excel("weight_start_end.xlsx")
  Growth_data$Fish_ID <- tolower(Growth_data$Fish_ID)


AS_data <- metabolic_rate_table|> 
  mutate(AS_H = MMR_Hypoxic - SMR_Hypoxic) |> 
  mutate(AS_N = MMR_Normoxic - SMR_Normoxic) |> 
  mutate(sex = toupper(str_extract(Fish_ID, "f|m")))

#check the data 
hist(AS_data$AS_H)
AS_data<- subset(AS_data, AS_H>-1)
hist(AS_data$AS_H)
hist(AS_data$AS_N)

### plot + analysis for AEROBIC SCOPE grouped by sex and acclimation
### Hypoxic
modxnlme_ASH <- lme(AS_H ~ Acclimation, random = ~1|Fish_ID, na.action=na.omit, data = AS_data)
summary(modxnlme_ASH)
anova(modxnlme_ASH)

qqnorm(resid(modxnlme_ASH))

AS_H_plot <- ggplot(AS_data, aes( x = sex, 
                   y = AS_H,
                   fill = sex)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0,1.5))+
  labs(x = "Sex",
       y ="Aerobic scope",
       title = "The aerobic scope under hypoxic levels",
  ) +
  facet_wrap(facets = vars(Acclimation))+
  scale_fill_manual(values = c("#0097A7", "#FFC107")) +
  theme(strip.text = element_text(size = 10, face = "bold"),
        panel.background = element_rect(fill = "#f1f1f2"),
        strip.background = element_rect(fill = "#B2EBF2"))
AS_H_plot

### Normoxic

modxnlme_ASN <- lme(AS_N ~ Acclimation, random = ~1|Fish_ID, na.action=na.omit, data = AS_data)
summary(modxnlme_ASN)
anova(modxnlme_ASN)
qqnorm(resid(modxnlme_ASN))

AS_N_plot<- ggplot(AS_data, aes( x = sex, 
                      y = AS_N,
                      fill = sex)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0,1.5))+
  labs(x = "Sex",
       y ="Aerobic scope",
       title = "The aerobic scope under normoxic levels",
  ) +
  facet_wrap(facets = vars(Acclimation))+
  scale_fill_manual(values = c("#0097A7", "#FFC107")) +
  theme(strip.text = element_text(size = 10, face = "bold"),
        panel.background = element_rect(fill = "#f1f1f2"),
        strip.background = element_rect(fill = "#B2EBF2"))
AS_N_plot

library(patchwork)
AS_plot <- (AS_H_plot + AS_N_plot) |> 
  plot()


### plot for growth analysis by sex and acclimation ####
SGR_data <- merge(metabolic_rate_table, Growth_data, by = "Fish_ID") |> 
  mutate(SGR = round((((log(Weight_end)-log(Weight_start))/58)*100), digits = 2)) |> 
  mutate(sex = toupper(str_extract(Fish_ID, "f|m")))


### analysis ###
hist(SGR_data$SGR)  
SGR_data <- subset(SGR_data, SGR>-1)
hist(SGR_data$SGR)

mod_gr <- lm(SGR~Acclimation+sex, data = SGR_data)
summary(mod_gr)
anova(mod_gr)

qqnorm(resid(mod_gr))

pgr <-ggplot(merged_df, aes(x=factor(Acclimation), y = as.numeric(SGR))) + 
  geom_boxplot(aes(fill=sex)) + geom_point(position=position_dodge(width=0.75), aes(group=Acclimation), alpha=0.2)
pgr


# plot
SGR_plot <- ggplot(SGR_data, aes( x = sex, 
                                  y = SGR,
                                  fill = sex)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0,1.5))+
  labs(x = "Sex",
       y ="Weight mg",
       title = "The Specific Growth Rate",
  ) +
  facet_wrap(facets = vars(Acclimation))+
  scale_fill_manual(values = c("#0097A7", "#FFC107")) +
  theme(strip.text = element_text(size = 10, face = "bold"),
        panel.background = element_rect(fill = "#f1f1f2"),
        strip.background = element_rect(fill = "#B2EBF2"))
  plot(SGR_plot)




  
  