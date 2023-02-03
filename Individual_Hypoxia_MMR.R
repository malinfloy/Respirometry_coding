#MMR for all individuals of intermitten-flow repsirometry - Hypoxia
#1 row = 2 seconds -> 30 rows = 1 min

# MMR Trial 1 - ----------------------------------------------------

# Chamber 1 2ml
ch1_t1_rep_2 <- subset_data(t1,
                            from = 39479, # MMR start 0820
                            to = 39479 + 600, # + 20 min 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_2ML <- ch1_t1_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 10 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.15) |>                 
  # adjust
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "linear") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05643, 
               t =25.1, S = 0, 
               mass = 0.00014) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 2mg
ch2_t1_rep_2 <- subset_data(t1,
                            from = 39809, # 0831
                            to = 39809 + 450, # 15 min last fish 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_2MB <- ch2_t1_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.15) |>                 
  # adjust
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05760, 
               t =25.1, S = 0, 
               mass = 0.00007) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 2fg

ch3_t1_rep_2 <- subset_data(t1,
                            from = 39659, # 0826
                            to = 39659 + 600, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  

ch3_H_mmr_2Fg <- ch3_t1_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05908, 
               t =25.1, S = 0, 
               mass = 0.00025) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 2fl
ch4_t1_rep_2 <- subset_data(t1,
                            from = 39329,
                            to = 39329 + 600 - 150, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_2FP <- ch4_t1_rep_2 |>                              
  # subset first replicate
  subset_data(from = 60, # 2 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05982, 
               t =25.2, S = 0, 
               mass = 0.00051) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR for trial 2 -  -----------------------------------------------
# Chamber 1 2mp
ch1_t2_rep_2 <- subset_data(t2,
                            from = 40078, # 0832
                            to = 40078 + 600, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_2MP <- ch1_t2_rep_2 |> 
  
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>        
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05644, 
               t =25.1, S = 0, 
               mass = 0.00013) |>           
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# Chamber 2 2mb

ch2_t2_rep_2 <- subset_data(t2,
                            from = 40438,  # 0844
                            to = 40438 + 570,
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_2MB <- ch2_t2_rep_2 |> 
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                # subset first replicate
  subset_data(from = 30, 
              by = "row") |>                # subset again to apply a 'wait' period
  auto_rate(width = 0.15) |>                 # use auto_rate to get most linear regions
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         # adjust
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05758, 
               t =25.1 , S = 0, mass = 0.00009) |>            # convert
  select_rate(method = "highest", 
              n = 1) |>                     # select highest rate 
  summary(export = TRUE)

# chamber 3 2fb

ch3_t2_rep_2 <- subset_data(t2,
                            from = 40198, # 0836
                            to = 40198 + 600, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2) 


ch3_H_mmr_2FB <- ch3_t2_rep_2 |> 
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                # subset first replicate
  subset_data(from = 30, 
              by = "row") |>                # subset again to apply a 'wait' period
  auto_rate(width = 0.2) |>                 # use auto_rate to get most linear regions
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         # adjust
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05889, 
               t =25.1, S = 0, 
               mass = 0.00044) |>            # convert
  select_rate(method = "highest", 
              n = 1) |>                     # select highest rate 
  summary(export = TRUE)

# Chamber 4 2fp

ch4_t2_rep_2 <- subset_data(t2,
                            from = 40558, # 0848
                            to = 40558 + 450, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>      
  plot(width= 0.2) 



ch4_H_mmr_2FP <- ch4_t2_rep_2 |>                            # using the inspected replicate 1 data...
  subset_data(from = 60, # 2 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>                # subset first replicate
  subset_data(from = 60, 
              by = "row") |>                # subset again to apply a 'wait' period
  auto_rate(width = 0.2) |>                 # use auto_rate to get most linear regions
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         # adjust
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05988, 
               t =25.1, S = 0, 
               mass = 0.00045) |>            # convert
  select_rate(method = "highest", 
              n = 1) |>                     # select highest rate 
  summary(export = TRUE)                    # final reportable result




# MMR Trial 3--------------------------------------------------------
# MMR Trial 4--------------------------------------------------------

# MMR Trial 5 - ----------------------------------------------------------------
# Chamber 1 7ml
#swimtunnel note on ch1 and ch3
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



# MMR Trial 6  ----------------------------------------------------
# Chamber 1 7mp

ch1_t6_rep_2 <- subset_data(t6,
                            from = 39505, # 0818 
                            to = 39505 +  930, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_7MP <- ch1_t6_rep_2 |> 
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
  adjust_rate(by = bg_T6_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05640, 
               t =25.3, S = 0, 
               mass = 0.00017) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 7Mg
ch2_t6_rep_2 <- subset_data(t6,
                            from = 39595, # 0821
                            to = 39595 + 840, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_7MG <- ch2_t6_rep_2 |> 
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
  adjust_rate(by = bg_T6_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05753, 
               t =25.3, S = 0, 
               mass = 0.00014) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 7FL

ch3_t6_rep_2 <- subset_data(t6,
                            from = 39865, #0830
                            to = 39865 + 570, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_7FL <- ch3_t6_rep_2 |> 
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
  adjust_rate(by = bg_T6_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05888, 
               t =25.3, S = 0,
               mass = 0.00045) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 7fg
ch4_t6_rep_2 <- subset_data(t6,
                            from = 39955, #0833
                            to = 39955 + 600, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_7FG <- ch4_t5_rep_2 |>                              
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
  adjust_rate(by = bg_T6_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05952, 
               t =25.3, S = 0, 
               mass = 0.00081) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR Trial 7  ----------------------------------------------------
# Chamber 1 5mg
ch1_t7_rep_2 <- subset_data(t7,
                            from = 39620, # 0820 - 0850
                            to = 39620 + 900, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_5MG <- ch1_t7_rep_2 |> 
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
  adjust_rate(by = bg_T7_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =25.2, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 - 5mp
ch2_t7_rep_2 <- subset_data(t7,
                            from = 39710, # 0823
                            to = 39710 + 810, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_5MB <- ch2_t7_rep_2 |> 
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
  adjust_rate(by = bg_T7_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =25.2, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 5ml

ch3_t7_rep_2 <- subset_data(t7,
                            from = 39980, # 0832
                            to = 39980 + 540, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_5ML <- ch3_t7_rep_2 |> 
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
  adjust_rate(by = bg_T7_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05921, 
               t =25.2, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 5fp
ch4_t7_rep_2 <- subset_data(t7,
                            from = 40070, #0835
                            to = 40070 + 600, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_5FP <- ch4_t7_rep_2 |>                              
  # subset first replicate
  subset_data(from = 60, # 2 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bg_T7_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05991, 
               t =25.2, S = 0, 
               mass = 0.00042) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 



# MMR trial 8  -----------------------------------------------------
# Chamber 1 5mb
ch1_t8_rep_2 <- subset_data(t8,
                            from = 39166, # 0812 - 0842
                            to = 39166 +  900, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_5MB <- ch1_t8_rep_2 |> 
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
  adjust_rate(by = bg_T8_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =25.1, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 - 5fb
ch2_t8_rep_2 <- subset_data(t8,
                            from = 39226, # 0814
                            to = 39226 + 840, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_H_mmr_5FB <- ch2_t8_rep_2 |> 
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
  adjust_rate(by = bg_T8_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05735, 
               t =25.1, S = 0, 
               mass = 0.00032) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 5fl

ch3_t8_rep_2 <- subset_data(t8,
                            from = 39526, # 0824
                            to = 39526 + 540, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.15)  


ch3_H_mmr_5FL <- ch3_t8_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.1) |>                 
  # adjust
  adjust_rate(by = bg_T8_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05897, 
               t =25.1, S = 0, 
               mass = 0.00036) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 5fg
ch4_t8_rep_2 <- subset_data(t8,
                            from = 39586, #0826
                            to = 39586 + 480, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_5FG <- ch4_t8_rep_2 |>                              
  # subset first replicate
  subset_data(from = 60, # 2 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bg_T8_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05993, 
               t =25.1, S = 0, 
               mass = 0.00040) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 9  ----------------------------------------------------
# Chamber 1 9ml
ch1_t9_rep_2 <- subset_data(t9,
                            from = 39769, # 0820 - 0850
                            to = 39769 + 900, 
                            by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.1) 


ch1_H_mmr_9ML <- ch1_t9_rep_2 |> 
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
  adjust_rate(by = bg_T9_ch1, 
              method = "value") |>         
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
  summary(export = TRUE)


# Chamber 2 - 9mg
ch2_t9_rep_2 <- subset_data(t9,
                            from = 39859, # 0823
                            to = 39859 + 810, 
                            by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_9MG <- ch2_t9_rep_2 |> 
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
  adjust_rate(by = bg_T9_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =25, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 9Mp

ch3_t9_rep_2 <- subset_data(t9,
                            from = 40099, # 0831
                            to = 40099 + 570, 
                            by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.15)  


ch3_H_mmr_9Mp <- ch3_t9_rep_2 |> 
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
  adjust_rate(by = bg_T9_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05917, 
               t =25, S = 0, 
               mass = 0.00016) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 9Fb
ch4_t9_rep_2 <- subset_data(t9,
                            from = 40219, #0835
                            to = 40219 + 600, 
                            by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_9Fb <- ch4_t9_rep_2 |>                              
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
  adjust_rate(by = bg_T9_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05999, 
               t =25, S = 0, 
               mass = 0.00034) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 10  ----------------------------------------------------
# Chamber 1 9Mb
ch1_t10_rep_2 <- subset_data(t10,
                             from = 39201, # 0819 - 0845
                             to = 39201 +  780, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_9Mb <- ch1_t10_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =25.4, S = 0, 
               mass = 0.00012) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 - 9fl
ch2_t10_rep_2 <- subset_data(t10,
                             from = 39321, # 0823
                             to = 39321 + 660, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_H_mmr_9FL <- ch2_t10_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05725, 
               t =25.4, S = 0, 
               mass = 0.00042) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 9fp

ch3_t10_rep_2 <- subset_data(t10,
                             from = 39561, # 0831
                             to = 39561 + 420, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_9Fp <- ch3_t10_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                 
  # adjust
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05876, 
               t =25.4, S = 0, 
               mass = 0.00057) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 9fg background
#empty chamber since fish was dead, background was done on it 



# MMR trial 11 -----------------------------------------------------------------
# Chamber 1 4mb
ch1_t11_rep_2 <- subset_data(t11,
                             from = 39968, # 0816 - 0842/43
                             to = 39968 + 780, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_4Mb <- ch1_t11_rep_2 |> 
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
  adjust_rate(by = bg_T11_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05747, 
               t =25.3, S = 0, 
               mass = 0.00010) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 4ml
ch2_t11_rep_2 <- subset_data(t11,
                             from = 40298, # 0827
                             to = 40298 + 450, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_H_mmr_4ML <- ch2_t11_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to =300,  # 10 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                 
  # adjust
  adjust_rate(by = bg_T11_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =25.3, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 4fl

ch3_t11_rep_2 <- subset_data(t11,
                             from = 40058, # 0819
                             to = 40058 + 690, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_4FL <- ch3_t11_rep_2 |> 
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
  adjust_rate(by = bg_T11_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05894, 
               t =25.3, S = 0, 
               mass = 0.00039) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 4fb
    # No hypoxia MMR, fist observation of bleeding in the head region

# MMR trial 12 -----------------------------------------------------------------
# Chamber 1 4mp
ch1_t12_rep_2 <- subset_data(t12,
                             from = 39572, # 0816 - 0846.59
                             to = 39572 + 900, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_4Mp <- ch1_t12_rep_2 |> 
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
  adjust_rate(by = bg_T12_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =25.2, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 4mg
ch2_t12_rep_2 <- subset_data(t12,
                             from = 39662, # 0819
                             to = 39662 + 810, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_4Mg <- ch2_t12_rep_2 |> 
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
  adjust_rate(by = bg_T12_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05756, 
               t =25.2, S = 0, 
               mass = 0.00011) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 4fp

ch3_t12_rep_2 <- subset_data(t12,
                             from = 39932, # 0828
                             to = 39932 + 540, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_mmr4Fp <- ch3_t12_rep_2 |> 
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
  adjust_rate(by = bg_T12_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05890, 
               t =25.2, S = 0, 
               mass = 0.00043) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 4fg
ch4_t12_rep_2 <- subset_data(t12,
                             from = 40022, #0831
                             to = 40022 + 450, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_4Fg <- ch4_t12_rep_2 |>                              
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
  adjust_rate(by = bg_T12_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05961, 
               t =25.2, S = 0, 
               mass = 0.00072) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 13 -----------------------------------------------------------------
# Chamber 1 12mp
ch1_t13_rep_2 <- subset_data(t13,
                             from = 39444, # 0833 -09:00
                             to = 39444 + 810, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_12Mp <- ch1_t13_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =25.1, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 12mg bg


# Chamber 3 12fg

ch3_t13_rep_2 <- subset_data(t13,
                             from = 39504, # 0835
                             to = 39504 + 750, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_12Fg <- ch3_t13_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05896, 
               t =25.1, S = 0, 
               mass = 0.00037) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 12fb
ch4_t13_rep_2 <- subset_data(t13,
                             from = 39774, # 0844
                             to = 39774 + 450, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_12Fb <- ch4_t13_rep_2 |>                              
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05989, 
               t =25.1, S = 0, 
               mass = 0.00044) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 14 -----------------------------------------------------------------
# Chamber 1 12Ml
ch1_t14_rep_2 <- subset_data(t14,
                             from = 39631, # 0824 - 52
                             to = 39631 + 840, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.2) 


ch1_H_mmr_12ML <- ch1_t14_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =24.8, S = 0, 
               mass = 0.00012) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 12mb bg
            

# Chamber 3 12fL

ch3_t14_rep_2 <- subset_data(t14,
                             from = 39721, # 0827
                             to = 39721 + 750, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_12FL <- ch3_t14_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05901, 
               t =24.8, S = 0, 
               mass = 0.00032) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 12Fp
ch4_t14_rep_2 <- subset_data(t14,
                             from = 39991, #0836
                             to = 39991 + 450, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_12Fp <- ch4_t14_rep_2 |>                              
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05996, 
               t =24.8, S = 0, 
               mass = 0.00037) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 





# MMR trial 15 -----------------------------------------------------------------
# Chamber 1 3mp
ch1_t15_rep_2 <- subset_data(t15,
                             from = 39576, # 0815 -51
                             to = 39576 +  1080, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_3Mp <- ch1_t15_rep_2 |> 
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
  adjust_rate(by = bg_T15_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05641, 
               t =24.7, S = 0, 
               mass = 0.00016) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 3fb
ch2_t15_rep_2 <- subset_data(t15,
                             from = 39726, # 0820
                             to = 39726 + 930, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_H_mmr_3Fb <- ch2_t15_rep_2 |> 
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
  adjust_rate(by = bg_T15_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05722, 
               t =24.8, S = 0,
               mass = 0.00045) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 3fL

ch3_t15_rep_2 <- subset_data(t15,
                             from = 39966, # 0828
                             to = 39966 + 690, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_3FL <- ch3_t15_rep_2 |> 
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
  adjust_rate(by = bg_T15_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05861, 
               t =24.8, S = 0, 
               mass = 0.00072) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 3fg
ch4_t15_rep_2 <- subset_data(t15,
                             from = 40146, #0834
                             to = 40146 + 510, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_3Fg <- ch4_t15_rep_2 |>                              
  # subset first replicate
  subset_data(from = 60, # 2 min wait period 
              to = 450,  # 15 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bg_T15_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05940, 
               t =24.8, S = 0, 
               mass = 0.00093) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 16 -----------------------------------------------------------------
# Chamber 1 3mg
ch1_t16_rep_2 <- subset_data(t16,
                             from = 39044, # 0819 - 56
                             to = 39044 +  1110, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_3Mg <- ch1_t16_rep_2 |> 
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
  adjust_rate(by = bg_T16_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =24.4, S = 0, 
               mass = 0.00012) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 3mL
ch2_t16_rep_2 <- subset_data(t16,
                             from = 39164, # 0823
                             to = 39164 + 990, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_3ML <- ch2_t16_rep_2 |> 
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
  adjust_rate(by = bg_T16_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05756, 
               t =24.4, S = 0, 
               mass = 0.00011) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 3fp

ch3_t16_rep_2 <- subset_data(t16,
                             from = 39464, # 0833
                             to = 39464 + 690, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_3Fp <- ch3_t16_rep_2 |> 
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
  adjust_rate(by = bg_T16_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05904, 
               t =24.4, S = 0, 
               mass = 0.00029) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 3mb bg



# MMR trial 17 -----------------------------------------------------------------
# Chamber 1 6mp
ch1_t17_rep_2 <- subset_data(t17,
                             from = 37216, # 0822 - 48
                             to = 37216 +  780,
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_5Mp <- ch1_t17_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =24.5, S = 0, 
               mass = 0.00009) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 6mg
ch2_t17_rep_2 <- subset_data(t17,
                             from = 37276, # 0824
                             to = 37276 + 720, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_5Mg <- ch2_t17_rep_2 |> 
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
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05761, 
               t =24.5, S = 0, 
               mass = 0.00006) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 6fb

ch3_t17_rep_2 <- subset_data(t17,
                             from = 37546, # 08:33
                             to = 37546 + 450, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_6Fb <- ch3_t17_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                 
  # adjust
  adjust_rate(by = bgch4_pre, 
              by2 = bgch4_post, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05893, 
               t =24.5, S = 0, 
               mass = 0.00040) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 6ml bg


# MMR trial 18 -----------------------------------------------------------------
# Chamber 1 6mb
ch1_t18_rep_2 <- subset_data(t18,
                             from = 39274, # 0827-57
                             to = 39274 + 900, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_6Mb <- ch1_t18_rep_2 |> 
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
  adjust_rate(by = bg_T18_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05649, 
               t =25.8, S = 0, 
               mass = 0.00008) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 6fp
ch2_t18_rep_2 <- subset_data(t18,
                             from = 39364, # 0830
                             to = 39364 + 810, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.2) 


ch2_H_mmr_6Fp <- ch2_t18_rep_2 |> 
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
  adjust_rate(by = bg_T18_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05739, 
               t =25.8, S = 0, 
               mass = 0.00028) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 6fg

ch3_t18_rep_2 <- subset_data(t18,
                             from = 39635, # 0839
                             to = 39635 + 540, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_6Fg <- ch3_t18_rep_2 |> 
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
  adjust_rate(by = bg_T18_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05896, 
               t =25.8, S = 0, 
               mass = 0.00037) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 6fl
ch4_t18_rep_2 <- subset_data(t18,
                             from = 39724, #0842
                             to = 39724 + 450, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_5FL <- ch4_t18_rep_2 |>                              
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
  adjust_rate(by = bg_T18_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05979, 
               t =25.8, S = 0, 
               mass = 0.00054) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 19 -----------------------------------------------------------------
# Chamber 1 1mp
# athletic male
ch1_t19_rep_2 <- subset_data(t19,
                             from = 35026, # 0827- 56
                             to = 35026 +  870, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_1Mp <- ch1_t19_rep_2 |> 
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
  adjust_rate(by = bg_T19_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
                time.unit = "secs", 
                output.unit = "mg/h/g", 
                volume = 0.05641, 
                t =25.7, S = 0, 
                mass = 0.000016) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 1mg
ch2_t19_rep_2 <- subset_data(t19,
                             from = 35116, #0830 
                             to = 35116 + 780, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_1Mg <- ch2_t19_rep_2 |> 
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
  adjust_rate(by = bg_T19_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05752, 
               t =25.7, S = 0, 
               mass = 0.00015) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 1fg

ch3_t19_rep_2 <- subset_data(t19,
                             from = 35418, # 0840
                             to = 35418 + 480, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_1Fg <- ch3_t19_rep_2 |> 
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
  adjust_rate(by = bg_T19_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05892, 
               t =25.7, S = 0, 
               mass = 0.00041) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 1fl
ch4_t19_rep_2 <- subset_data(t19,
                             from = 35476, #0842
                             to = 35476 + 435, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_1FL <- ch4_t19_rep_2 |>                              
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
  adjust_rate(by = bg_T19_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05981, 
               t =25.7, S = 0, 
               mass = 0.00052) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 


# MMR trial 20 -----------------------------------------------------------------
# Chamber 1 1mb
ch1_t20_rep_2 <- subset_data(t20,
                             from = 45099, # 1128 -1157
                             to = 45099 +  870, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_1Mb <- ch1_t20_rep_2 |> 
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
  adjust_rate(by = bg_T20_ch1, 
              method = "value") |>         
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
ch2_t20_rep_2 <- subset_data(t20,
                             from = 45189, # 1131
                             to = 45189 + 780, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_1ML <- ch2_t20_rep_2 |> 
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
  adjust_rate(by = bg_T20_ch2, 
              method = "value") |>         
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

ch3_t20_rep_2 <- subset_data(t20,
                             from = 45489, # 1141
                             to = 45489 + 480, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_1Fp <- ch3_t20_rep_2 |> 
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>                
  
  # subset again to apply a 'wait' period
  subset_data(from = 30, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                 
  # adjust
  adjust_rate(by = bg_T20_ch3, 
              method = "value") |>         
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
ch4_t20_rep_2 <- subset_data(t20,
                             from = 45549, #1143
                             to = 45549 + 420, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_1Fb <- ch4_t20_rep_2 |>                              
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bg_T20_ch4, 
              method = "value") |>         
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
ch1_t23_rep_2 <- subset_data(t23,
                             from = 36836, # 0831- 0859
                             to = 36836 + 840, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_8Mb <- ch1_t23_rep_2 |> 
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
  adjust_rate(by = bg_T23_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05646, 
               t =25.2, S = 0, 
               mass = 0.00011) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 8mg
ch2_t23_rep_2 <- subset_data(t23,
                             from = 36896, # 0833
                             to = 36896 + 780, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_8Mg <- ch2_t23_rep_2 |> 
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
  adjust_rate(by = bg_T23_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =25.2, S = 0, 
               mass = 0.00012) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 8fb

ch3_t23_rep_2 <- subset_data(t23,
                             from = 37166, # 0842
                             to = 37166 + 510, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_8Fb <- ch3_t23_rep_2 |> 
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
  adjust_rate(by = bg_T23_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05899, 
               t =25.2, S = 0, 
               mass = 0.00034) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 8fg
ch4_t23_rep_2 <- subset_data(t23,
                             from = 37256, #0845
                             to = 37256 + 420, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_8Fg <- ch4_t23_rep_2 |>                              
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bg_T23_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05950, 
               t =25.2, S = 0, 
               mass = 0.00083) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 





# MMR trial 24 -----------------------------------------------------------------
# Chamber 1 8ml
ch1_t24_rep_2 <- subset_data(t24,
                             from = 39466, # 0830 - 58
                             to = 39466 + 840, 
                             by = "row") |> 
  inspect(time= 2, oxygen = 1) |> 
  plot(width = 0.15) 


ch1_H_mmr_8ML <- ch1_t24_rep_2 |> 
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
  adjust_rate(by = bg_T24_ch1, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05642, 
               t =24.9, S = 0, 
               mass = 0.00015) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)


# Chamber 2 8mp
ch2_t24_rep_2 <- subset_data(t24,
                             from = 39556, # 0833
                             to = 39556 + 750, 
                             by = "row") |> 
  inspect(time= 5, oxygen = 4) |> 
  plot(width = 0.15) 


ch2_H_mmr_8Mp <- ch2_t24_rep_2 |> 
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
  adjust_rate(by = bg_T24_ch2, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05736, 
               t =24.9, S = 0, 
               mass = 0.00031) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)



# Chamber 3 8fp

ch3_t24_rep_2 <- subset_data(t24,
                             from = 39796, # 0841
                             to = 39796 + 510, 
                             by = "row") |> 
  inspect(time= 8, oxygen = 7) |> 
  plot(width = 0.2)  


ch3_H_mmr_8Fp <- ch3_t24_rep_2 |> 
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
  adjust_rate(by = bg_T24_ch3, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05884, 
               t =24.9, S = 0, 
               mass = 0.00049) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE)


# chamber 4 8fl
ch4_t24_rep_2 <- subset_data(t24,
                             from = 39886, #0844
                             to = 39886 + 420, 
                             by =  "row") |> 
  inspect(time = 11, oxygen =10 ) |>       
  plot(width= 0.2) 



ch4_H_mmr_8FL <- ch4_t24_rep_2 |>                              
  # subset first replicate
  subset_data(from = 30, # 1 min wait period 
              to = 300,  # 10 min later 
              by = "row") |>               
  
  # subset again to apply a 'wait' period
  subset_data(from = 60, 
              by = "row") |>                
  
  # use auto_rate to get most linear regions
  auto_rate(width = 0.2) |>                
  # adjust
  adjust_rate(by = bg_T24_ch4, 
              method = "value") |>         
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05959, 
               t =24.9, S = 0, 
               mass = 0.00074) |>            
  # select highest rate 
  select_rate(method = "highest", 
              n = 1) |>                     
  summary(export = TRUE) 













