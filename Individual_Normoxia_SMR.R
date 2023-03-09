# SMR for all individuals during normoxia conditions


# Trial 1 ----
# Chamber 1 - 2ml
ch1_N_smr_2ml <- t1 |>  
  inspect(time= 2, oxygen = 1) |>
  subset_data(from = 3430,  # from after 4 slopes since we changed the measurement time 
              to = 33400, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 480, # 8 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T1_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05643, 
               t =25.6, S = 0, 
               mass = 0.00014) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 2mg
ch2_N_smr_2mg <- t1 |>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 3430, 
              to = 33400, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 480, # 8 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T1_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05760, 
               t =25.6, S = 0, 
               mass = 0.00007) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 2fg
ch3_N_smr_2fg <- t1 |>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1510, # from 11:14
              to = 33400, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T1_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05908, 
               t =25.6, S = 0, 
               mass = 0.00025) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 2fl

ch4_N_smr_2fl <- t1 |>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1510, # from 11:14 Seems like the pumps off here
              to = 33400, 
              by = "row") |>
  
  #extract rates
  calc_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T1_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05982, 
               t =25.6, S = 0, 
               mass = 0.00051) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 2----
# Chamber 1 - 2mp
ch1_N_smr_2mp <- t2 |>  
  inspect(time= 2, oxygen = 1) |>
  subset_data(from = 2374,  #11:35
              to = 33550, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T2_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05644, 
               t =25, S = 0, 
               mass = 0.00013) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 2mb
ch2_N_smr_2mb <- t2 |>
  inspect(time= 5, oxygen = 4) |>
  subset_data(from = 2374,  #11:35
              to = 33550, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 300,    # 5 min
    measure = 480, # 8 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T2_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05758, 
               t =25 , S = 0, 
               mass = 0.00009) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 2fb
ch3_N_smr_2fb <- t2 |>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 2224,  #11:30
              to = 33550, 
              by = "row") |>
  
  #extract rates
  calc_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T2_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05889, 
               t =25, S = 0, 
               mass = 0.00044) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 2fp

ch4_N_smr_2fp <- t2 |>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 2224,  #11:30
              to = 33550, 
              by = "row") |>
  
  #extract rates
  calc_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T2_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05988, 
               t =25, S = 0, 
               mass = 0.00045) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 3----
# Trial 4----
# Trial 5----
# Chamber 1 - 7ml
ch1_N_smr_7mL <- t5 |>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1477, # flush started 11:10 - Ended 11:15, from = 11:15
              to = 33727, # 42 cycles later around 05:10 am. 50 min before hypoxia treatment
              by = "row") |>

  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
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
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1477, 
              to = 33727, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
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
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1477, 
              to = 32900, # 70 cycles after 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
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
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1477, 
              to = 32900, # 70 cycles after 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
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
ch1_N_mmr_7mp <- t6 |>
  inspect(time=2, oxygen =1) |> 
  subset_data(from = 1416, # flush ended 1108
              to = 32600, # 52 cycles
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |> 
  
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
  inspect(time=5, oxygen =4) |>
     subset_data(from = 1416, # flush ended 1108
                 to = 32600, 
                 by = "row") |>
     
     #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |> 
   
   #Adjust the rates
   adjust_rate(
     by = bg_T6_ch2,
     method = "value") |>
     
     # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05753, 
               t =25.9, S = 0, 
               mass = 0.00014) |>
     
     # Select rate
     select_rate(method = "lowest_percentile", n = 0.1) |>  
     summary() |>
     mean()
   
# chamber 3 7fl
ch3_N_smr_7FL <-t6 |>
  inspect(time=8, oxygen =7) |> 
  subset_data(from = 1408, # flush ended 1108
              to = 32650, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |> 

#Adjust the rates
adjust_rate(
  by = bg_T6_ch3,
  method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05888, 
               t =25.9, S = 0,
               mass = 0.00045) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

#Chamber 4 7fg

ch4_N_smr_7fg <-t6 |>
  inspect(time=11, oxygen =10) |> 
  subset_data(from = 1408, # flush ended 1108
              to = 32650, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |> 
  
  #Adjust the rates
  adjust_rate(
    by = bg_T6_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05952, 
               t =25.9, S = 0, 
               mass = 0.00081) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()
  
# Trial 7----
# Chamber 1 5mg
ch1_N_mmr_5mg <- t7 |>
  inspect(time=2, oxygen =1) |> 
  subset_data(from = 1314, 
              to = 33621, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |> 
  
  #Adjust the rates
  adjust_rate(
    by = bg_T7_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =24.7, S = 0, 
               mass = 0.00009) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Chamber 2 5mp 
ch2_N_smr_5mp <- t7 |>
  inspect(time=5, oxygen =4) |>
  subset_data(from = 1314, 
              to = 33621, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 300,    # 5 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |> 
  
  #Adjust the rates
  adjust_rate(
    by = bg_T7_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =24.7, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# chamber 3 5ml
ch3_N_smr_5ml <-t7 |>
  inspect(time=8, oxygen =7) |> 
  subset_data(from = 1314, 
              to = 33621, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |> 
  
  #Adjust the rates
  adjust_rate(
    by = bg_T7_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05921, 
               t =24.7, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

#Chamber 4 5fp

ch4_N_smr_5fp <-t7 |>
  inspect(time=11, oxygen =10) |> 
  subset_data(from = 1314, 
              to = 33621, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |> 
  
  #Adjust the rates
  adjust_rate(
    by = bg_T7_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05991, 
               t =24.7, S = 0, 
               mass = 0.00042) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 8----
# chamber 1 5mb
# closed pahse goes up - can't use
ch1_N_smr_5mb <-t8|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1399, 
              to = 33300, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T8_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =24.7, S = 0, 
               mass = 0.00009) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 5fb
ch2_N_smr_5fb <-t8|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1399, 
              to = 33300, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T8_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05735, 
               t =24.7, S = 0, 
               mass = 0.00032) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 5fl
ch3_N_smr_5fl <-t8|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1399, 
              to = 33300,  
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T8_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05897, 
               t =24.7, S = 0, 
               mass = 0.00036) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 5fg

ch4_N_smr_5fg <-t8|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1399, 
              to = 33300, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 300, # 5 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T8_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05993, 
               t =24.7, S = 0, 
               mass = 0.00040) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 9----
# chamber 1 9ml
ch1_N_smr_9ml <-t9|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1403, 
              to = 33600, 
              by = "row") |>
  
  
  #extract rates
auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T9_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05644, 
               t =24.8, S = 0, 
               mass = 0.00013) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 9mg
ch2_N_smr_9mg <-t9|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1403, 
              to = 33600, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T9_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =24.8, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 9mp
ch3_N_smr_9mp <-t9|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1403, 
              to = 33600, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T9_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05917, 
               t =24.8, S = 0, 
               mass = 0.00016) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 9fb

ch4_N_smr_9fb <-t9|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1403, 
              to = 33600, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T9_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05999, 
               t =24.8, S = 0, 
               mass = 0.00034) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 10----
# chamber 1 9mb
ch1_N_smr_9mb <-t10|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1465, 
              to = 33200, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 240,   # extract lowest rate from a 4-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T10_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =25.2, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 9fl
ch2_N_smr_9fl <-t10|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1465, 
              to = 33200, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 240,   # extract lowest rate from a 4-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T10_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05725, 
               t =25.2, S = 0, 
               mass = 0.00042) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 9fp
ch3_N_smr_9fp <-t10|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1465, 
              to = 33200, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 240,   # extract lowest rate from a 4-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T10_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05876, 
               t =25.2, S = 0, 
               mass = 0.00057) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 9fb

#empty chamber since fish was dead, background was done on it 

# Trial 11----
#Chamber 1 4mb
ch1_N_smr_4mb <-t11|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1481, 
              to = 33850, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T11_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05747, 
               t =25.2, S = 0, 
               mass = 0.00010) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 4ml
ch2_N_smr_4ml <-t11|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1481, 
              to = 33850, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T11_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =25.2, S = 0, 
               mass = 0.00012)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 4fl
ch3_N_smr_4fl <-t11|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1481, 
              to = 33850, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T11_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05894, 
               t =25.2, S = 0, 
               mass = 0.00039) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 4fb

ch4_N_smr_4fb <-t11|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1481, 
              to = 33850, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T11_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05981, 
               t =25.2, S = 0, 
               mass = 0.00052) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# Trial 12----
#Chamber 1 4mp
ch1_N_smr_4mp <-t12|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1575, 
              to = 33500, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T12_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =24.8, S = 0, 
               mass = 0.00009) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 4mg
ch2_N_smr_4mg <-t12|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1575, 
              to = 33350, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T12_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05756, 
               t =24.8, S = 0, 
               mass = 0.00011)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 4fp
ch3_N_smr_4fp <-t12|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1575, 
              to = 33350, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T12_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05890, 
               t =24.8, S = 0, 
               mass = 0.00043) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 4fg

ch4_N_smr_4fg <-t12|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1575, 
              to = 33350, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T12_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05961, 
               t =24.8, S = 0, 
               mass = 0.00072) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 13----
#Chamber 1 12mp
ch1_N_smr_12mp <-t13|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1390, 
              to = 33055, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T13_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =24.7, S = 0, 
               mass = 0.00009) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 12mg
#empty bg data

# Chamber 3 12fg
ch3_N_smr_12fg <-t13|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1390, 
              to = 32850, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T13_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05896, 
               t =24.7, S = 0, 
               mass = 0.00037) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 12fb

ch4_N_smr_12fb <-t13|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1390, 
              to = 32850, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T13_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05989, 
               t =24.7, S = 0, 
               mass = 0.00044) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()
# Trial 14----
#chamber 1 12ml
ch1_N_smr_12ml <-t14|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1460, 
              to = 33512, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T14_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =24.6, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 12mb
# bg

# Chamber 3 12fl
ch3_N_smr_12fl <-t14|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1460, 
              to = 33400, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T14_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05901, 
               t =24.6, S = 0, 
               mass = 0.00032) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 12fp

ch4_N_smr_12fp <-t14|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1460, 
              to = 33400, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T14_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05996, 
               t =24.6, S = 0, 
               mass = 0.00037) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()
# Trial 15----
#Chamber 1 3mp
ch1_N_smr_3mp <-t15|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1400, 
              to = 33727, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T15_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05641, 
               t =24.4, S = 0, 
               mass = 0.00016) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 3fb
ch2_N_smr_3fb <-t15|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1400, 
              to = 33727, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T15_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05722, 
               t =24.4, S = 0,
               mass = 0.00045)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 3fl
ch3_N_smr_3fl <-t15|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1400, 
              to = 33727, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T15_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05861, 
               t =24.4, S = 0, 
               mass = 0.00072) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 3fg

ch4_N_smr_3fg <-t15|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1400, 
              to = 33727, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T15_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05940, 
               t =24.4, S = 0, 
               mass = 0.00093) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 16----
#Chamber 1 3mg
ch1_N_smr_3mg <-t16|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1560, 
              to = 33076, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T16_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =24.3, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 3ml
ch2_N_smr_3ml <-t16|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1560, 
              to = 33076, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T16_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05756, 
               t =24.3, S = 0, 
               mass = 0.00011)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 3fp
ch3_N_smr_3fp <-t16|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1560, 
              to = 33000, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T16_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05904, 
               t =24.3, S = 0, 
               mass = 0.00029) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 3mb bg


# Trial 17----

#Chamber 1 6mp
ch1_N_smr_6mp <-t17|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1621, 
              to = 31000, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T17_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =26, S = 0, 
               mass = 0.00009) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 6mg
ch2_N_smr_6mg <-t17|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1621, 
              to = 31000, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T17_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05761, 
               t =26, S = 0, 
               mass = 0.00006)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 6fb
ch3_N_smr_6fb <-t17|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1621, 
              to = 30850, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T17_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05893, 
               t =26, S = 0, 
               mass = 0.00040) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 6ml bg

# Trial 18----

#Chamber 1 6mb
ch1_N_smr_6mb <-t18|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1520, 
              to = 33065, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T18_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05649, 
               t =24.5, S = 0, 
               mass = 0.00008) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 6fp
ch2_N_smr_6fp <-t18|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1520, 
              to = 33065, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T18_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05739, 
               t =24.5, S = 0, 
               mass = 0.00028)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 6fg
ch3_N_smr_6fg <-t18|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1520, 
              to = 33000, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T18_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05896, 
               t =24.5, S = 0, 
               mass = 0.00037) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 6fl

ch4_N_smr_6fl <-t18|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1520, 
              to = 33000, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T18_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05979, 
               t =24.5, S = 0, 
               mass = 0.00054) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 19----
#Chamber 1 1mp
ch1_N_smr_1mp <-t19|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1443, 
              to = 28818, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T19_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05641, 
               t =25.2, S = 0, 
               mass = 0.000016) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 1mg
ch2_N_smr_1mg <-t19|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1443, 
              to = 28818, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T19_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05752, 
               t =25.2, S = 0, 
               mass = 0.00015)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 1fg
ch3_N_smr_1fg <-t19|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1443, 
              to = 28818, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T19_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05892, 
               t =25.2, S = 0, 
               mass = 0.00041) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 1fl

ch4_N_smr_1fl <-t19|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1443, 
              to = 28818, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T19_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05981, 
               t =25.2, S = 0, 
               mass = 0.00052) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()
# Trial 20----
#Chamber 1 1mb
ch1_N_smr_1mb <-t20|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1435, 
              to = 33200, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T20_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05646, 
               t =25.4, S = 0, 
               mass = 0.00011) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 1ml
ch2_N_smr_1ml <-t20|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1435, 
              to = 33200, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T20_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =25.4, S = 0, 
               mass = 0.00012)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 1fp
ch3_N_smr_1fp <-t20|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1435, 
              to = 33200, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T20_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05914, 
               t =25.4, S = 0, 
               mass = 0.00019) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 1fb

ch4_N_smr_1fb <-t20|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1435, 
              to = 33200, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T20_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.06005, 
               t =25.4, S = 0, 
               mass = 0.00028) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()
# Trial 21----

# Trial 22----
# Trial 23----
#Chamber 1 8mb
ch1_N_smr_8mb <-t23|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1390, 
              to = 30507, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T23_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05646, 
               t =25.1, S = 0, 
               mass = 0.00011) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 8mg
ch2_N_smr_8mg <-t23|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1390, 
              to = 30507, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T23_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =25.1, S = 0, 
               mass = 0.00012)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 8fb
ch3_N_smr_8fb <-t23|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1390, 
              to = 30507, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T23_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05899, 
               t =25.1, S = 0, 
               mass = 0.00034) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 8fg

ch4_N_smr_8fg <-t23|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1390, 
              to = 30507, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T23_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05950, 
               t =25.1, S = 0, 
               mass = 0.00083) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()
# Trial 24----
#Chamber 1 8ml
ch1_N_smr_8ml <-t24|>  
  inspect(time=2, oxygen =1) |>
  subset_data(from = 1473, 
              to = 33171, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T24_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05642, 
               t =25, S = 0, 
               mass = 0.00015) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 8mp
ch2_N_smr_8mp <-t24|>
  inspect(time=5, oxygen = 4) |>
  subset_data(from = 1473, 
              to = 33171, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T24_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05736, 
               t =25, S = 0, 
               mass = 0.00031)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 8fp
ch3_N_smr_8fp <-t24|>
  inspect(time= 8, oxygen = 7) |>
  subset_data(from = 1473, 
              to = 32900, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T24_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05884, 
               t =25, S = 0, 
               mass = 0.00049) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 8fl

ch4_N_smr_8fl <-t24|>
  inspect(time= 11, oxygen = 10) |> 
  subset_data(from = 1473, 
              to = 32900, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 120,    # 2 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_T24_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05959, 
               t =25, S = 0, 
               mass = 0.00074) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()







