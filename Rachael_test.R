# import data--------------------------------------------------------------------
# Probably easier ways to make the time numeric when it goes over midnight, but this was my solution.
# Had to round the time to make the "sequential" in "inspect" function pass. Some data are unevenly-spaced and some
# are not. Not too sure if this is somehting I need to fix.

trial5 <-
  import_file(
    "Respirometry data/Raw data/2022-10-04_102546_04_10_T5/2022-10-04_102546_04_10_T5.txt"
  )

trial5$date_time_1 = dmy_hms(paste(trial5$`Date [A Ch.1 Main]`, trial5$`Time [A Ch.1 Main]`)) |>
  round_date("sec")
trial5$date_time_2 = dmy_hms(paste(trial5$`Date [A Ch.2 Main]`, trial5$`Time [A Ch.2 Main]`)) |>
  round_date("sec")
trial5$date_time_3 = dmy_hms(paste(trial5$`Date [A Ch.3 Main]`, trial5$`Time [A Ch.3 Main]`)) |>
  round_date("sec")
trial5$date_time_4 = dmy_hms(paste(trial5$`Date [A Ch.4 Main]`, trial5$`Time [A Ch.4 Main]`)) |>
  round_date("sec")


trial5$num_time_ch1 <-
  as.numeric(difftime(trial5[[81]], trial5[[1, 81]], units = "secs"))
trial5$num_time_ch2 <-
  as.numeric(difftime(trial5[[82]], trial5[[1, 82]], units = "secs"))
trial5$num_time_ch3 <-
  as.numeric(difftime(trial5[[83]], trial5[[1, 83]], units = "secs"))
trial5$num_time_ch4 <-
  as.numeric(difftime(trial5[[84]], trial5[[1, 84]], units = "secs"))

t5 <- select(
  trial5,
  oxygen_ch1 = "Oxygen (%air sat.) [A Ch.1 Main]",
  "num_time_ch1",
  "date_time_1",
  oxygen_ch2 = "Oxygen (%air sat.) [A Ch.2 Main]",
  "num_time_ch2",
  "date_time_2",
  oxygen_ch3 = "Oxygen (%air sat.) [A Ch.3 Main]",
  "num_time_ch3",
  "date_time_3",
  oxygen_ch4 = "Oxygen (%air sat.) [A Ch.4 Main]",
  "num_time_ch4",
  "date_time_4"
)

# import of background data ---------------------
# Measured straight after the trial


bg_T5 <-
  import_file("Respirometry data/Raw data/2022-10-05_084323_Bg_T5/2022-10-05_084323_Bg_T5.txt")

bg_T5$date_time_1 = dmy_hms(paste(bg_T5$`Date [A Ch.1 Main]`, bg_T5$`Time [A Ch.1 Main]`)) |>
  round_date("sec")
bg_T5$date_time_2 = dmy_hms(paste(bg_T5$`Date [A Ch.2 Main]`, bg_T5$`Time [A Ch.2 Main]`)) |>
  round_date("sec")
bg_T5$date_time_3 = dmy_hms(paste(bg_T5$`Date [A Ch.3 Main]`, bg_T5$`Time [A Ch.3 Main]`)) |>
  round_date("sec")
bg_T5$date_time_4 = dmy_hms(paste(bg_T5$`Date [A Ch.4 Main]`, bg_T5$`Time [A Ch.4 Main]`)) |>
  round_date("sec")


bg_T5$num_time_ch1 <-
  as.numeric(difftime(bg_T5[[81]], bg_T5[[1, 81]], units = "secs"))
bg_T5$num_time_ch2 <-
  as.numeric(difftime(bg_T5[[82]], bg_T5[[1, 82]], units = "secs"))
bg_T5$num_time_ch3 <-
  as.numeric(difftime(bg_T5[[83]], bg_T5[[1, 83]], units = "secs"))
bg_T5$num_time_ch4 <-
  as.numeric(difftime(bg_T5[[84]], bg_T5[[1, 84]], units = "secs"))

bg_T5 <- select(
  bg_T5,
  oxygen_ch1 = "Oxygen (%air sat.) [A Ch.1 Main]",
  "num_time_ch1",
  "date_time_1",
  oxygen_ch2 = "Oxygen (%air sat.) [A Ch.2 Main]",
  "num_time_ch2",
  "date_time_2",
  oxygen_ch3 = "Oxygen (%air sat.) [A Ch.3 Main]",
  "num_time_ch3",
  "date_time_3",
  oxygen_ch4 = "Oxygen (%air sat.) [A Ch.4 Main]",
  "num_time_ch4",
  "date_time_4"
)

# Chamber 1
bg_T5_ch1 <- bg_T5 |>
  subset_data(from = 10, to = 330, by = "row") |>
  inspect(time = 2, oxygen = 1) |>
  calc_rate.bg()

# Chamber 2
bg_T5_ch2 <- bg_T5 |>
  subset_data(from = 10, to = 330, by = "row") |>
  inspect(time = 5, oxygen = 4) |>
  calc_rate.bg()

# Chamber 3
bg_T5_ch3 <- bg_T5 |>
  subset_data(from = 10, to = 330, by = "row") |>
  inspect(time = 8, oxygen = 7) |>
  calc_rate.bg()

#chamber 4
bg_T5_ch4 <- bg_T5 |>
  subset_data(from = 10, to = 330, by = "row") |>
  inspect(time = 11, oxygen = 10) |>
  calc_rate.bg()



# MMR Trial 5 - Normoxia treatment--------
ch1_t5_rep_1 <- subset_data(t5,
                            from = 397, # MMR start 10:39
                            to = 397 +  1080 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_7Ml <- ch1_t5_rep_1 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.15) |>                 
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05646, 
               t =24.9, S = 0, 
               mass = 0.00011) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 7Mb
ch2_t5_rep_1 <- subset_data(t5,
                            from = 787, # 1052
                            to = 787 + 690 - 150, # flushing 1110
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_7Mb <- ch2_t5_rep_1 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.15) |>                 
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05753, 
               t =24.9, S = 0, 
               mass = 0.00014) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# Chamber 3 7fb

ch3_t5_rep_1 <- subset_data(t5,
                            from = 517, # 10:43
                            to = 517 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_7Fb <- ch3_t5_rep_1 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                 
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05912, 
               t =24.9, S = 0, 
               mass = 0.00021) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 7fp
ch4_t5_rep_1 <- subset_data(t5,
                            from = 847, #1054
                            to = 847 + 630 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_7Fp <- ch4_t5_rep_1 |>                              
  # subset first replicate
  subset_data(from = 60, # 2 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05967, 
               t =24.9, S = 0, 
               mass = 0.00066) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)
# MMR Trial 5 - Hypoxia treatment-----------------------------------------------
# Chamber 1 7ml
ch1_t5_rep_2 <- subset_data(t5,
                            from = 39154, # 0811
                            to = 39154 + 870, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_7ML <- ch1_t5_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.15) |>                 
  # adjust
  adjust_rate(by = bg_T5_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05646, 
               t =25, S = 0, 
               mass = 0.00011) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 7Mb
ch2_t5_rep_2 <- subset_data(t5,
                            from = 39214, # 0813
                            to = 39214 + 810, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_7MB <- ch2_t5_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.15) |>                 
  # adjust
  adjust_rate(by = bg_T5_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05753, 
               t =25, S = 0, 
               mass = 0.00014) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 7fb

ch3_t5_rep_2 <- subset_data(t5,
                            from = 39514, # 0823
                            to = 39514 + 510, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_7FB <- ch3_t5_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                 
  # adjust
  adjust_rate(by = bg_T5_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05912, 
               t =25, S = 0, 
               mass = 0.00021) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 7fp
ch4_t5_rep_2 <- subset_data(t5,
                            from = 39574, # 0825
                            to = 39574 + 450, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_7FP <- 
  ch4_t5_rep_2 |>                              
  # subset first replicate
  subset_data(from = 60, # 2 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bg_T5_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05967, 
               t =25, S = 0, 
               mass = 0.00066) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 
# SMR trial5 - Normoxia treatment-----


ch1_N_smr_7mL <- t5 |>
  subset_data(from = 1477, # after first flush. flush started 11:10 - Ended 11:15, from = 11:15
              to = 33727, # 42 cycles later around 05:10 am. 50 min before hypoxia treatment
              by = "row") |>
  inspect(time=2, oxygen =1) |>
 
   #extract rates
  auto_rate.int(
    starts = 600,  # 15 min measure + 5 min flush
    wait = 120,    # 4 min
    measure = 300, # 10 min
    method = "lowest",
    width = 150,   # extract lowest rate from a 5-min duration
    by = "row") |>
  
  #Adjust the rates
  adjust_rate(
              by = bg_T5_ch1,
              method = "value") |>
  # convert
  convert_rate(
    oxy.unit = "%Air",
    time.unit = "secs",
    output.unit = "mg/h/g",
    volume = 0.05646,
    t = 25, S = 0,   # Ask Rachael about one T at beginning and another at end
    mass = 0.00011) |>
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()




