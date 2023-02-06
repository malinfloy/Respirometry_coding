# SMR for all individuals during normoxia conditions


# Trial 1 ----
# Trial 2----
# Trial 3----
# Trial 4----
# Trial 5----
# Chamber 1 - 7ml
ch1_N_smr_7mL <- t5 |>
  subset_data(from = 1477, # flush started 11:10 - Ended 11:15, from = 11:15
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

# chamber 2 7Mb
ch2_N_smr_7mb <- t5 |>
  subset_data(from = 1477, 
              to = 33727, 
              by = "row") |>
  inspect(time=5, oxygen =4) |>
  
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
    by = bg_T5_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05753, 
               t =24.9, S = 0, 
               mass = 0.00014) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 7fb
ch3_N_smr_7Fb <- t5 |>
  subset_data(from = 1477, 
              to = 32977, # 70 cycles after 
              by = "row") |>
  inspect(time= 8, oxygen = 7) |>
  
  #extract rates
  auto_rate.int(
    starts = 450,  # 10 min measure + 5 min flush
    wait = 60,    # 2 min
    measure = 150, # 5 min
    method = "lowest",
    width = 90,   # extract lowest rate from a 3-min duration
    by = "row") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T5_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05912, 
               t =24.9, S = 0, 
               mass = 0.00021) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 7fp

ch4_N_smr_7Fp <- t5 |>
  subset_data(from = 1477, 
              to = 32977, # 70 cycles after 
              by = "row") |>
  inspect(time= 11, oxygen = 10) |>
  
  #extract rates
  auto_rate.int(
    starts = 450,  # 10 min measure + 5 min flush
    wait = 60,    # 2 min
    measure = 150, # 5 min
    method = "lowest",
    width = 90,   # extract lowest rate from a 3-min duration
    by = "row") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T5_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05967, 
               t =24.9, S = 0, 
               mass = 0.00066) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# Trial 6----
# Chamber 1 7mp
ch1_N_mmr_7Mp <- t6 |>
  subset_data(from = 1416, # flush ended 1108
              to = 32618, # 52 cycles
              by = "row") |>
  inspect(time=2, oxygen =1) |> 
  
  #extract rates
  auto_rate.int(
    starts = 600,  # 15 min measure + 5 min flush
    wait = 60,    # 2 min
    measure = 150, # 5 min
    method = "lowest",
    width = 90,   # extract lowest rate from a 3-min duration
    by = "row") |> 
  
  #Adjust the rates
  adjust_rate(
    by = bg_T6_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05640, 
               t =25.9, S = 0, 
               mass = 0.00017) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Chamber 2 7mg 
ch2_N_smr_7Mg <- t6 |>
     subset_data(from = 1416, # flush ended 1108
                 to = 32616, 
                 by = "row") |>
     inspect(time=5, oxygen =4) |> 
     
     #extract rates
     auto_rate.int(
       starts = 600,  # 15 min measure + 5 min flush
       wait = 60,    # 2 min
       measure = 150, # 5 min
       method = "lowest",
       width = 90,   # extract lowest rate from a 3-min duration
       by = "row") |> 
   
   #Adjust the rates
   adjust_rate(
     by = bg_T6_ch2,
     method = "value") |>
     
     # convert
     convert_rate(oxy.unit = "%Air", 
                  time.unit = "secs", 
                  output.unit = "mg/h/g", 
                  volume = 0.05753, 
                  t =25.3, S = 0, 
                  mass = 0.00014) |>
     
     # Select rate
     select_rate(method = "lowest_percentile", n = 0.1) |>  
     summary() |>
     mean()
   
# chamber 3 7fl
ch3_H_mmr_7FL <-t6 |>
  subset_data(from = 1408, # flush ended 1108
              to = 32608, 
              by = "row") |>
  inspect(time=8, oxygen =7) |> 
  
  #extract rates
  auto_rate.int(
    starts = 450,  # 10 min measure + 5 min flush
    wait = 60,    # 2 min
    measure = 150, # 5 min
    method = "lowest",
    width = 90,   # extract lowest rate from a 3-min duration
    by = "row") |> 

#Adjust the rates
adjust_rate(
  by = bg_T6_ch3,
  method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05888, 
               t =25.3, S = 0,
               mass = 0.00045) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

ch4_H_mmr_7FG
  
# Trial 7----
# Trial 8----
# Trial 9----
# Trial 10----
# Trial 11----
# Trial 12----
# Trial 13----
# Trial 14----
# Trial 15----
# Trial 16----
# Trial 17----
# Trial 18----
# Trial 19----
# Trial 20----
# Trial 21----
# Trial 22----
# Trial 23----
# Trial 24----







