#MMR for all individuals of intermitten-flow repsirometry - Normoxia
#1 row = 2 seconds -> 30 rows = 1 min

# MMR Trial 1----------------------------------------------------

# Chamber 1 2ml 
ch1_t1_rep_1 <- subset_data(t1,
                            from = 520, # MMR start 10:41
                            to = 520 +  1080 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


 ch1_N_mmr_2Ml <- ch1_t1_rep_1 |> 
  # subset first replicate
   subset_data(from = 30, # 1 min wait period 
              to = 450,  # 10 min later 
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
               volume = 0.05643, 
               t =25.6, S = 0, 
               mass = 0.00014) |>            
  # select highest rate
   select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE) # -0.78
 
 
# Chamber 2 2mg
 ch2_t1_rep_1 <- subset_data(t1,
                             from = 640, # 1045
                             to = 640 + 960 - 150, # flushing 1112
                             by = "row") |> 
   inspect(time= 5, oxygen = 4) |> 
   plot(width = 0.15) 
 
 
 ch2_N_mmr_2Mg <- ch2_t1_rep_1 |> 
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
                volume = 0.05760, 
                t =25.6, S = 0, 
                mass = 0.00007) |>            
   # select highest rate 
   select_rate(method = "highest", 
               n = 1) |>                     
   summary(export = TRUE) # -1.38
 
 
 
# Chamber 3 2fg 
 ch3_t1_rep_1 <- subset_data(t1,
                             from = 880, # 10:53
                             to = 880 + 720 - 150, 
                             by = "row") |> 
   inspect(time= 8, oxygen = 7) |> 
   plot(width = 0.2)  
 
 
 ch3_N_mmr_2Fg <- ch3_t1_rep_1 |> 
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
                volume = 0.05908, 
                t =25.6, S = 0, 
                mass = 0.00025) |>            
   # select highest rate 
   select_rate(method = "highest", 
               n = 1) |>                     
   summary(export = TRUE) # -1.13
 
 
# chamber 4 2fl 
 ch4_t1_rep_1 <- subset_data(t1,
                             from = 1000,
                             to = 1000 + 600 - 150, 
                             by =  "row") |> 
   inspect(time = 11, oxygen =10 ) |>       
   plot(width= 0.2) 
 
 
 
 ch4_N_mmr_2FL <- ch4_t1_rep_1 |>                              
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
                volume = 0.05982, 
                t =25.6, S = 0, 
                mass = 0.00051) |>            
   # select highest rate 
   select_rate(method = "highest", 
               n = 1) |>                     
   summary(export = TRUE) # -0.90

 
 
 
# MMR Trial 2-----------------------------------------------
# Chamber 1 2mp
ch1_t2_rep_1 <- subset_data(t2,
                            from = 425, # MMR start 10:30 
                            to = 425 +  1110 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_2Mp <- ch1_t2_rep_1 |> 

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
               volume = 0.05644, 
               t =25, S = 0, 
               mass = 0.00013) |>           
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) # -0.97


# Chamber 2 2mb 
ch2_t2_rep_1 <- subset_data(t2,
                            from = 574, 
                            to = 574 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_2Mb <- ch2_t2_rep_1 |> 
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
               volume = 0.05758, 
               t =25 , S = 0, 
               mass = 0.00009) |>
# select highest rate
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) # -0.59


# chamber 3 2fb 
ch3_t2_rep_1 <- subset_data(t2,
                            from = 934, # 10:47
                            to = 934 + 450 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2) 


ch3_N_mmr_2Fb <- ch3_t2_rep_1 |> 
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                # subset first replicate
  subset_data(from = 30, 
              by = "row") |>                # subset again to apply a 'wait' period
  auto_rate(width = 0.2) |>                 # use auto_rate to get most linear regions
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05889, 
               t =25, S = 0, 
               mass = 0.00044) |>            # convert
  select_rate(method = "highest", 
              n = 1) |>                     # select highest rate 
  summary(export = TRUE) # -1.3



# Chamber 4 2fp 
ch4_t2_rep_1 <- subset_data(t2,
                         from = 755,
                         to = 755 + 780 - 150, 
                         by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_2Fp <- ch4_t2_rep_1 |>                              # using the inspected replicate 1 data...
  subset_data(from = 60, # 2 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                # subset first replicate
  subset_data(from = 60, 
              by = "row") |>                # subset again to apply a 'wait' period
  auto_rate(width = 0.2) |>               # use auto_rate to get most linear regions
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05988, 
               t =25, S = 0, 
               mass = 0.00045) |>            # convert
  select_rate(method = "highest", 
              n = 1) |>                     # select highest rate 
  summary(export = TRUE)   # -0,92             
 


# MMR Trial 3--------------------------------------------------------

# MMR Trial 4--------------------------------------------------------

# MMR Trial 5----------------------------------------------------------------
# Chamber 1 7ml

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






# MMR Trial 6----------------------------------------------------
# Chamber 1 7mp

ch1_t6_rep_1 <- subset_data(t6,
                            from = 358, # MMR start 10:33
                            to = 358 +  1050 - 150, # 11:03 flush  on
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_7Mp <- ch1_t6_rep_1 |> 
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
               volume = 0.05640, 
               t =25.9, S = 0, 
               mass = 0.00017) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 7Mg
ch2_t6_rep_1 <- subset_data(t6,
                            from = 688, # 1044
                            to = 688 + 720 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_7Mg <- ch2_t6_rep_1 |> 
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
               t =25.9, S = 0, 
               mass = 0.00014) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# Chamber 3 7FL

ch3_t6_rep_1 <- subset_data(t6,
                            from = 448, # 10:36
                            to = 448 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_7Fl <- ch3_t6_rep_1 |> 
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
               volume = 0.05888, 
               t =25.9, S = 0,
               mass = 0.00045) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 7fg
ch4_t6_rep_1 <- subset_data(t6,
                            from = 808, #1048
                            to = 808 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_7Fg <- ch4_t6_rep_1 |>                              
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
               volume = 0.05952, 
               t =25.9, S = 0, 
               mass = 0.00081) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR Trial 7  ----------------------------------------------------
# Chamber 1 5mg
ch1_t7_rep_1 <- subset_data(t7,
                            from = 294, # 1029
                            to = 294 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_5Mg <- ch1_t7_rep_1 |> 
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
               volume = 0.05648, 
               t =24.7, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 5mp
ch2_t7_rep_1 <- subset_data(t7,
                            from = 384, # 1032
                            to = 384 + 930 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_5Mp <- ch2_t7_rep_1 |> 
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
               volume = 0.05755, 
               t =24.7, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 5ml

ch3_t7_rep_1 <- subset_data(t7,
                            from = 624, # 10:40
                            to = 624 + 690 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_5Ml <- ch3_t7_rep_1 |> 
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
               volume = 0.05921, 
               t =24.7, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 5fp
ch4_t7_rep_1 <- subset_data(t7,
                            from = 714, #1043
                            to = 714 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_5Fp <- ch4_t7_rep_1 |>                              
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
               volume = 0.05991, 
               t =24.7, S = 0, 
               mass = 0.00042) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 




# MMR trial 8  -----------------------------------------------------
# Chamber 1 5mb
ch1_t8_rep_1 <- subset_data(t8,
                            from = 350, # 1038
                            to = 350 +  1050 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_5Mb <- ch1_t8_rep_1 |> 
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
               volume = 0.05648, 
               t =24.7, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 5fb
ch2_t8_rep_1 <- subset_data(t8,
                            from = 440, # 1041
                            to = 440 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_N_mmr_5Fb <- ch2_t8_rep_1 |> 
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
               volume = 0.05735, 
               t =24.7, S = 0, 
               mass = 0.00032) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 5fl

ch3_t8_rep_1 <- subset_data(t8,
                            from = 710, # 10:50
                            to = 710 + 690 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.15)  


ch3_N_mmr_5Fl <- ch3_t8_rep_1 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.1) |>                 
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05897, 
               t =24.7, S = 0, 
               mass = 0.00036) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 5fg
ch4_t8_rep_1 <- subset_data(t8,
                            from = 770, #1052
                            to = 714 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_5Fg <- ch4_t8_rep_1 |>                              
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
               volume = 0.05993, 
               t =24.7, S = 0, 
               mass = 0.00040) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 9  ----------------------------------------------------
# Chamber 1 9ml
ch1_t9_rep_1 <- subset_data(t9,
                            from = 383, # 1027
                            to = 383 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.1) 


ch1_N_mmr_9Ml <- ch1_t9_rep_1 |> 
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
               volume = 0.05644, 
               t =24.8, S = 0, 
               mass = 0.00013) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 9mg
ch2_t9_rep_1 <- subset_data(t9,
                            from = 443, # 1029
                            to = 443 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_9Mg <- ch2_t9_rep_1 |> 
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
               volume = 0.05755, 
               t =24.8, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# Chamber 3 9Mp

ch3_t9_rep_1 <- subset_data(t9,
                            from = 713, # 10:38
                            to = 713 + 690 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.15)  


ch3_N_mmr_9Mp <- ch3_t9_rep_1 |> 
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
               volume = 0.05917, 
               t =24.8, S = 0, 
               mass = 0.00016) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 9Fb
ch4_t9_rep_1 <- subset_data(t9,
                            from = 803, #1041
                            to = 803 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_9Fb <- ch4_t9_rep_1 |>                              
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
               volume = 0.05999, 
               t =24.8, S = 0, 
               mass = 0.00034) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 10  ----------------------------------------------------
# Chamber 1 9Mb
ch1_t10_rep_1 <- subset_data(t10,
                            from = 505, # 1049
                            to = 505 +  960 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_9Mb <- ch1_t10_rep_1 |> 
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
               volume = 0.05645, 
               t =25.2, S = 0, 
               mass = 0.00012) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 9fl
ch2_t10_rep_1 <- subset_data(t10,
                            from = 595, # 1052
                            to = 595 + 870 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_N_mmr_9Fl <- ch2_t10_rep_1 |> 
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
               volume = 0.05725, 
               t =25.2, S = 0, 
               mass = 0.00042) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 9fp

ch3_t10_rep_1 <- subset_data(t10,
                            from = 865, # 11:01
                            to = 865 + 600 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_9Fp <- ch3_t10_rep_1 |> 
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
               volume = 0.05876, 
               t =25.2, S = 0, 
               mass = 0.00057) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 9fg background
#empty chamber since fish was dead, background was done on it 




# MMR trial 11 -----------------------------------------------------------------
# Chamber 1 4mb
ch1_t11_rep_1 <- subset_data(t11,
                            from = 461, # 1019
                            to = 461 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_4Mb <- ch1_t11_rep_1 |> 
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
               volume = 0.05747, 
               t =25.2, S = 0, 
               mass = 0.00010) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 4ml
ch2_t11_rep_1 <- subset_data(t11,
                            from = 791, # 1030
                            to = 791 + 690 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_N_mmr_4Ml <- ch2_t11_rep_1 |> 
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
               volume = 0.05645, 
               t =25.2, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 4fl

ch3_t11_rep_1 <- subset_data(t11,
                            from = 521, # 10:21
                            to = 521 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_4Fl <- ch3_t11_rep_1 |> 
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
               volume = 0.05894, 
               t =25.2, S = 0, 
               mass = 0.00039) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 4fb
ch4_t11_rep_1 <- subset_data(t11,
                            from = 881, #1033
                            to = 881 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_4Fb <- ch4_t11_rep_1 |>                              
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
               volume = 0.05981, 
               t =25.2, S = 0, 
               mass = 0.00052) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 12 -----------------------------------------------------------------
# Chamber 1 4mp
ch1_t12_rep_1 <- subset_data(t12,
                            from = 545, # 1035
                            to = 545 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_4Mp <- ch1_t12_rep_1 |> 
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
               volume = 0.05648, 
               t =24.8, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 4mg
ch2_t12_rep_1 <- subset_data(t12,
                            from = 905, # 1047
                            to = 905 + 660 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_4Mg <- ch2_t12_rep_1 |> 
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
               volume = 0.05756, 
               t =24.8, S = 0, 
               mass = 0.00011) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 4fp

ch3_t12_rep_1 <- subset_data(t12,
                            from = 635, # 10:38
                            to = 635 + 930 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_mmr4Fp <- ch3_t12_rep_1 |> 
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
               volume = 0.05890, 
               t =24.8, S = 0, 
               mass = 0.00043) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 4fg
ch4_t12_rep_1 <- subset_data(t12,
                            from = 965, #1049
                            to = 965 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_4Fg <- ch4_t12_rep_1 |>                              
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
               volume = 0.05961, 
               t =24.8, S = 0, 
               mass = 0.00072) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 13 -----------------------------------------------------------------
# Chamber 1 12mp
ch1_t13_rep_1 <- subset_data(t13,
                            from = 478, # 1054
                            to = 478 +  900 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_12Mp <- ch1_t13_rep_1 |> 
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
               volume = 0.05648, 
               t =24.7, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 12mg bg


# Chamber 3 12fg

ch3_t13_rep_1 <- subset_data(t13,
                            from = 418, # 10:52
                            to = 418 + 660 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_12Fg <- ch3_t13_rep_1 |> 
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
               volume = 0.05896, 
               t =24.7, S = 0, 
               mass = 0.00037) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 12fb
ch4_t13_rep_1 <- subset_data(t13,
                            from = 777, #1104
                            to = 777 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_12Fb <- ch4_t13_rep_1 |>                              
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
               volume = 0.05989, 
               t =24.7, S = 0, 
               mass = 0.00044) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 14-----------------------------------------------------------------
# Chamber 1 12Ml
ch1_t14_rep_1 <- subset_data(t14,
                            from = 485, # 1039
                            to = 485 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.2) 


ch1_N_mmr_12Ml <- ch1_t14_rep_1 |> 
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
               volume = 0.05645, 
               t =24.6, S = 0, 
               mass = 0.00012) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 12mb bg


# Chamber 3 12fL

ch3_t14_rep_1 <- subset_data(t14,
                            from = 545, # 10:41
                            to = 545 + 900 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_12Fl <- ch3_t14_rep_1 |> 
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
               volume = 0.05901, 
               t =24.6, S = 0, 
               mass = 0.00032) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 12Fp
ch4_t14_rep_1 <- subset_data(t14,
                            from = 845, #1051
                            to = 845 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_12Fp <- ch4_t14_rep_1 |>                              
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
               volume = 0.05996, 
               t =24.6, S = 0, 
               mass = 0.00037) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 15 -----------------------------------------------------------------
# Chamber 1 3mp
ch1_t15_rep_1 <- subset_data(t15,
                            from = 370, # 1028
                            to = 370 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_3Mp <- ch1_t15_rep_1 |> 
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
               volume = 0.05641, 
               t =24.4, S = 0, 
               mass = 0.00016) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 3fb
ch2_t15_rep_1 <- subset_data(t15,
                            from = 430, # 1030
                            to = 430 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_N_mmr_3Fb <- ch2_t15_rep_1 |> 
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
               volume = 0.05722, 
               t =24.4, S = 0,
               mass = 0.00045) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 3fL

ch3_t15_rep_1 <- subset_data(t15,
                            from = 740, # 10:40
                            to = 740 + 650 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_3Fl <- ch3_t15_rep_1 |> 
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
               volume = 0.05861, 
               t =24.4, S = 0, 
               mass = 0.00072) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 3fg
ch4_t15_rep_1 <- subset_data(t15,
                            from = 790, #1042
                            to = 790 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_3Fg <- ch4_t15_rep_1 |>                              
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
               volume = 0.05940, 
               t =24.4, S = 0, 
               mass = 0.00093) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 16 -----------------------------------------------------------------
# Chamber 1 3mg
ch1_t16_rep_1 <- subset_data(t16,
                            from = 558, # 1056
                            to = 558 +  990 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_3Mg <- ch1_t16_rep_1 |> 
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
               volume = 0.05645, 
               t =24.3, S = 0, 
               mass = 0.00012) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 3mL
ch2_t16_rep_1 <- subset_data(t16,
                            from = 948, # 1109
                            to = 948 + 600 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_3ML <- ch2_t16_rep_1 |> 
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
               volume = 0.05756, 
               t =24.3, S = 0, 
               mass = 0.00011) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# Chamber 3 3fp

ch3_t16_rep_1 <- subset_data(t16,
                            from = 738, # 1102
                            to = 738 + 810 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_3Fp <- ch3_t16_rep_1 |> 
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
               volume = 0.05904, 
               t =24.3, S = 0, 
               mass = 0.00029) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 3mb bg




# MMR trial 17 -----------------------------------------------------------------
# Chamber 1 6mp
ch1_t17_rep_1 <- subset_data(t17,
                            from = 1130, # 1219
                            to = 1130 +  600 - 240, # 8 min flush????
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_5Mp <- ch1_t17_rep_1 |> 
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
               volume = 0.05648, 
               t =26, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 6mg
ch2_t17_rep_1 <- subset_data(t17,
                            from = 770, # 1207
                            to = 770 + 990 - 270, # 9 min?
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_5Mg <- ch2_t17_rep_1 |> 
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
               volume = 0.05761, 
               t =26, S = 0, 
               mass = 0.00006) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 6fb

ch3_t17_rep_1 <- subset_data(t17,
                            from = 590, # 1201
                            to = 590 + 1170 - 270, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_6Fb <- ch3_t17_rep_1 |> 
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
               volume = 0.05893, 
               t =26, S = 0, 
               mass = 0.00040) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 6ml bg



# MMR trial 18 -----------------------------------------------------------------
# Chamber 1 6mb
ch1_t18_rep_1 <- subset_data(t18,
                            from = 518, # 1055
                            to = 518 + 990 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_6Mb <- ch1_t18_rep_1 |> 
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
               volume = 0.05649, 
               t =24.5, S = 0, 
               mass = 0.00008) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 6fp
ch2_t18_rep_1 <- subset_data(t18,
                            from = 908, # 1108
                            to = 908 + 600 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_N_mmr_6Fp <- ch2_t18_rep_1 |> 
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
               volume = 0.05739, 
               t =24.5, S = 0, 
               mass = 0.00028) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# Chamber 3 6fg

ch3_t18_rep_1 <- subset_data(t18,
                            from = 458, # 1053
                            to = 458 + 1050 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_6Fg <- ch3_t18_rep_1 |> 
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
               volume = 0.05896, 
               t =24.5, S = 0, 
               mass = 0.00037) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 6fl
ch4_t18_rep_1 <- subset_data(t18,
                            from = 788, #1104
                            to = 788 + 720 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_5FL <- ch4_t18_rep_1 |>                              
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
               volume = 0.05979, 
               t =24.5, S = 0, 
               mass = 0.00054) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 19 -----------------------------------------------------------------
# Chamber 1 1mp
  # athletic male
ch1_t19_rep_1 <- subset_data(t19,
                            from = 379, # 1312
                            to = 379 +  1050 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_1Mp <- ch1_t19_rep_1 |> 
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
               volume = 0.05641, 
               t =25.2, S = 0, 
               mass = 0.000016) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 1mg
ch2_t19_rep_1 <- subset_data(t19,
                            from = 739, # 1324
                            to = 739 + 690 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_1Mg <- ch2_t19_rep_1 |> 
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
               volume = 0.05752, 
               t =25.2, S = 0, 
               mass = 0.00015) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 1fg

ch3_t19_rep_1 <- subset_data(t19,
                            from = 439, # 1314
                            to = 439 + 990 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_1Fg <- ch3_t19_rep_1 |> 
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
               volume = 0.05892, 
               t =25.2, S = 0, 
               mass = 0.00041) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 1fl
ch4_t19_rep_1 <- subset_data(t19,
                            from = 830, #1327
                            to = 830 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_1FL <- ch4_t19_rep_1 |>                              
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
               volume = 0.05981, 
               t =25.2, S = 0, 
               mass = 0.00052) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 20 -----------------------------------------------------------------
# Chamber 1 1mb
ch1_t20_rep_1 <- subset_data(t20,
                            from = 403, # 1038
                            to = 403 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_1Mb <- ch1_t20_rep_1 |> 
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
               t =25.4, S = 0, 
               mass = 0.00011) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 1ml
ch2_t20_rep_1 <- subset_data(t20,
                            from = 763, # 1050
                            to = 763 + 660 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_1ML <- ch2_t20_rep_1 |> 
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
               volume = 0.05755, 
               t =25.4, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 1fp

ch3_t20_rep_1 <- subset_data(t20,
                            from = 493, # 10:41
                            to = 493 + 930 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_1Fp <- ch3_t20_rep_1 |> 
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
               volume = 0.05914, 
               t =25.4, S = 0, 
               mass = 0.00019) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 1fb
ch4_t20_rep_1 <- subset_data(t20,
                            from = 823, #1052
                            to = 823 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_1Fb <- ch4_t20_rep_1 |>                              
  # subset first replicate
  subset_data(from = 60, # 2 min wait period 
              to = 510,  # 15 min later 
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
               volume = 0.06005, 
               t =25.4, S = 0, 
               mass = 0.00028) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 




# MMR trial 21------------------------------------------------------------------

# MMR trial 22 -----------------------------------------------------------------

# MMR trial 23 -----------------------------------------------------------------
# Chamber 1 8mb
ch1_t23_rep_1 <- subset_data(t23,
                            from = 360, # 1215
                            to = 360 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_8Mb <- ch1_t23_rep_1 |> 
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
               volume = 0.05646, 
               t =25.1, S = 0, 
               mass = 0.00011) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 8mg
ch2_t23_rep_1 <- subset_data(t23,
                            from = 690, # 1226
                            to = 690 + 690 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_8Mg <- ch2_t23_rep_1 |> 
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
               volume = 0.05755, 
               t =25.1, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 8fb

ch3_t23_rep_1 <- subset_data(t23,
                            from = 450, # 1218
                            to = 450 + 930 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_8Fb <- ch3_t23_rep_1 |> 
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
               volume = 0.05899, 
               t =25.1, S = 0, 
               mass = 0.00034) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 8fg
ch4_t23_rep_1 <- subset_data(t23,
                            from = 780, #1229
                            to = 780 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_8Fg <- ch4_t23_rep_1 |>                              
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
               volume = 0.05950, 
               t =25.1, S = 0, 
               mass = 0.00083) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 24 -----------------------------------------------------------------
# Chamber 1 8ml
ch1_t24_rep_1 <- subset_data(t24,
                            from = 440, # 1049
                            to = 440 +  1020 - 150, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_N_mmr_8ML <- ch1_t24_rep_1 |> 
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
               volume = 0.05642, 
               t =25, S = 0, 
               mass = 0.00015) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 8mp
ch2_t24_rep_1 <- subset_data(t24,
                            from = 770, # 1100
                            to = 770 + 690 - 150, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_N_mmr_8Mp <- ch2_t24_rep_1 |> 
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
               volume = 0.05736, 
               t =25, S = 0, 
               mass = 0.00031) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 8fp

ch3_t24_rep_1 <- subset_data(t24,
                            from = 500, # 1051
                            to = 500 + 960 - 150, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_N_mmr_8Fp <- ch3_t24_rep_1 |> 
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
               volume = 0.05884, 
               t =25, S = 0, 
               mass = 0.00049) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 8fl
ch4_t24_rep_1 <- subset_data(t24,
                            from = 860, #1103
                            to = 860 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_N_mmr_8FL <- ch4_t24_rep_1 |>                              
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
               volume = 0.05959, 
               t =25, S = 0, 
               mass = 0.00074) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 











