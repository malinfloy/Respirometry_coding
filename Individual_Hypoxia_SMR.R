# SMR for all individuals during hypoxia conditions


# Trial 1 ----
# Chamber 1 - 2ml
Hsmr_2ml <- t1 |>  
  inspect(time = 3, oxygen = 4) |>
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
    by = bg_ch1) |>
  
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
Hsmr_2mg <- t1 |>
  inspect(time = 3, oxygen = 22) |>
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
    by = bg_ch2) |>
  
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
Hsmr_2fg <- t1 |>
  inspect(time = 3, oxygen = 40) |>
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
    by = bg_ch3) |>
  
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

Hsmr_2fl <- t1 |>
  inspect(time = 3, oxygen = 58) |> 
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
    by = bg_ch4,
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
Hsmr_2mp <- t2 |>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 38384, 
              to = 39582, 
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
    by = bg_ch1) |>
  
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
Hsmr_2mb <- t2 |>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 37784, 
              to = 39582, 
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
    by = bg_ch2) |>
  
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
Hsmr_2fb <- t2 |>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37336,  
              to = 39582, 
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
    by = bg_ch3) |>
  
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

Hsmr_2fp <- t2 |>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37336,  
              to = 39582, 
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
    by = bg_ch4) |>
  
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
# Chamber 1 - 10mb
Hsmr_10mb <- t3 |>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 38250, 
              to = 38847, 
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_ch1,
    method = "value") |>
  
  # convert
  convert_rate(
    oxy.unit = "%Air",
    time.unit = "secs",
    output.unit = "mg/h/g",
    volume = 0.05419,
    t = 25.2, S = 0,
    mass = 0.00014) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()  


# chamber 2 10mp
Hsmr_10mp <- t3 |>
  inspect(time=3, oxygen = 22) |>
  subset_data(from = 38250, 
              to = 38847, 
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
    by = bg_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05473, 
               t =25.2, S = 0, 
               mass = 0.00017) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 10mg
Hsmr_10mg <- t3 |>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 37650, 
              to = 38982,  
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
    by = bg_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05581, 
               t =25.2, S = 0, 
               mass = 0.00016) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 10fl

Hsmr_10fl <- t3 |>
  inspect(time= 3, oxygen = 58) |> 
  subset_data(from = 37650, 
              to = 38982,
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
    by = bg_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05672, 
               t =25.2, S = 0, 
               mass = 0.00055) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 4----
# Chamber 1 - 10mb
Hsmr_10ml <- t4 |>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 38356,  
              to = 39552, 
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
    by = bg_ch1,
    method = "value") |>
  
  # convert
  convert_rate(
    oxy.unit = "%Air",
    time.unit = "secs",
    output.unit = "mg/h/g",
    volume = 0.05420,
    t = 25.1, S = 0,
    mass = 0.00013) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()  


# chamber 2 10fp
Hsmr_10fp <- t4 |>
  inspect(time=3, oxygen = 22) |>
  subset_data(from = 38356,  
              to = 39552, 
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
    by = bg_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05447, 
               t =25.1, S = 0, 
               mass = 0.00043) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 10fg
Hsmr_10fg <- t4 |>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 38356,  
              to = 39552,  
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
    by = bg_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05559, 
               t =25.1, S = 0, 
               mass = 0.00038) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 10fb

Hsmr_10fb <- t4 |>
  inspect(time= 3, oxygen = 58) |> 
  subset_data(from = 38356,  
              to = 39552,
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
    by = bg_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05673, 
               t =25.1, S = 0, 
               mass = 0.00054) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 5----
# Chamber 1 - 7ml
Hsmr_7ml <- t5 |>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36882, 
              to = 38674, 
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t5_ch1,
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
Hsmr_7mb <- t5 |>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 36882, 
              to = 38674, 
              by = "row") |>
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t5_ch2,
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
Hsmr_7fb <- t5 |>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37025, 
              to = 38674, 
              by = "row") |>
  
  #extract rates
  calc_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t5_ch3,
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

Hsmr_7fp <- t5 |>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37025, 
              to = 38674, 
              by = "row") |>
  
  #extract rates
  auto_rate.int(
    starts = 900,  # 10 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 420, # 7 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t5_ch4,
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
Hsmr_7mp <- t6 |>
  inspect(time = 3, oxygen = 4) |> 
  subset_data(from = 36657, 
              to = 39004, 
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
    by = bg_t6_ch1,
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
Hsmr_7mg <- t6 |>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 37421, 
              to = 38604, 
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
    by = bg_t6_ch2,
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
Hsmr_7fl <-t6 |>
  inspect(time = 3, oxygen = 40) |> 
  subset_data(from = 36970, 
              to = 39004, 
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
    by = bg_t6_ch3,
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

Hsmr_7fg <-t6 |>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 36970, 
              to = 39004, 
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
    by = bg_t6_ch4,
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
Hsmr_5mg <- t7 |>
  inspect(time = 3, oxygen = 4) |> 
  subset_data(from = 37320, 
              to = 39100, 
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
    by = bg_t7_ch1,
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
Hsmr_5mp <- t7 |>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 37320, 
              to = 39100, 
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
    by = bg_t7_ch2,
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
Hsmr_5ml <-t7 |>
  inspect(time = 3, oxygen = 40) |> 
  subset_data(from = 37920, 
              to = 39100, 
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
    by = bg_t7_ch3,
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

Hsmr_5fp <-t7 |>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37320, 
              to = 39100, 
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
    by = bg_t7_ch4,
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
Hsmr_5mb <-t8|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36506, 
              to = 38506, 
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
    by = bg_t8_ch1,
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
Hsmr_5fb <-t8|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 36506, 
              to = 39106, 
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
    by = bg_t8_ch2,
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
Hsmr_5fl <-t8|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 36506, 
              to = 39106,  
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
    by = bg_t8_ch3,
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

Hsmr_5fg <-t8|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 36506, 
              to = 39106, 
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
    by = bg_t8_ch4,
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
Hsmr_9ml <-t9|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 38025, 
              to = 39200, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 2 min
    measure = 540, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t9_ch1,
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
Hsmr_9mg <-t9|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 37415, 
              to = 39200, 
              by = "row") |>
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 4 min
    measure = 600, # 10 min
    method = "lowest",
    width = 180,   # extract lowest rate from a 3-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t9_ch2,
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
Hsmr_9mp <-t9|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37415, 
              to = 39200, 
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
    by = bg_t9_ch3,
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

Hsmr_9fb <-t9|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37415, 
              to = 39200, 
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
    by = bg_t9_ch4,
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
Hsmr_9mb <-t10|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36567, 
              to = 37901, 
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
    by = bg_t10) |>
  
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
Hsmr_9fl <-t10|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 36567, 
              to = 38781, 
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
    by = bg_t10) |>
  
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
Hsmr_9fp <-t10|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 36567, 
              to = 38781, 
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
    by = bg_t10) |>
  
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
Hsmr_4mb <-t11|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 37480, 
              to = 38608, 
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
    by = bg_t11_ch1,
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
Hsmr_4ml <-t11|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 38080, 
              to = 39208, 
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
    by = bg_t11_ch2,
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
Hsmr_4fl <-t11|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37480, 
              to = 39608, 
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
    by = bg_t11_ch3,
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

Hsmr_4fb <-t11|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37480, 
              to = 39608, 
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
    by = bg_t11_ch4,
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
Hsmr_4mp <-t12|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36976, 
              to = 39365, 
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
    by = bg_t12_ch1,
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
Hsmr_4mg <-t12|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 36976, 
              to = 39365, 
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t12_ch2,
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
Hsmr_4fp <-t12|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37128, 
              to = 39365, 
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
    by = bg_t12_ch3,
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

Hsmr_4fg <-t12|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37128, 
              to = 39365, 
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
    by = bg_t12_ch4,
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
Hsmr_12mp <-t13|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36785, 
              to = 38574, 
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t13,
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
Hsmr_12fg <-t13|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 36935, 
              to = 39174, 
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
    by = bg_t13) |>
  
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

Hsmr_12fb <-t13|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 36935, 
              to = 39174, 
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
    by = bg_t13) |>
  
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
Hsmr_12ml <-t14|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36841, 
              to = 39096, 
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t14) |>
  
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
Hsmr_12fl <-t14|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 36996, 
              to = 39096, 
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
    by = bg_t14) |>
  
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

Hsmr_12fp <-t14|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 36996, 
              to = 39096, 
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
    by = bg_t14) |>
  
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
Hsmr_3mp <-t15|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 37394, 
              to = 38588, #39188
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t15_ch1,
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
Hsmr_3fb <-t15|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 37394, 
              to = 39188, 
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
    by = bg_t15_ch2,
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
Hsmr_3fl <-t15|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37394, 
              to = 39188, 
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
    by = bg_t15_ch3,
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

Hsmr_3fg <-t15|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37394, 
              to = 39188, 
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
    by = bg_t15_ch4,
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
Hsmr_3mg <-t16|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36945, 
              to = 38445, 
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
    by = bg_t16_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05645, 
               t =24.2, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 3ml
Hsmr_3ml <-t16|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 36945, 
              to = 38445, 
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
    by = bg_t16_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05756, 
               t =24.2, S = 0, 
               mass = 0.00011)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 3fp
Hsmr_3fp <-t16|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 36646, 
              to = 38445, 
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
    by = bg_t16_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05904, 
               t =24.2, S = 0, 
               mass = 0.00029) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 3mb bg


# Trial 17----

#Chamber 1 6mp
Hsmr_6mp <-t17|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 34638, 
              to = 36858, 
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
    by = bg_t17) |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05648, 
               t =24.3, S = 0, 
               mass = 0.00009) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 6mg
Hsmr_6mg <-t17|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 34638, 
              to = 35808, 
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
    by = bg_t17) |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05761, 
               t =24.3, S = 0, 
               mass = 0.00006)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 6fb
Hsmr_6fb <-t17|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 34907, 
              to = 36587, 
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
    by = bg_t17) |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05893, 
               t =24.3, S = 0, 
               mass = 0.00040) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 6ml bg

# Trial 18----

#Chamber 1 6mb
Hsmr_6mb <-t18|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36905, 
              to = 38655, 
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t18_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05649, 
               t =25.9, S = 0, 
               mass = 0.00008) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 6fp
Hsmr_6fp <-t18|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 36905, 
              to = 38655, 
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
    by = bg_t18_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05739, 
               t =25.9, S = 0, 
               mass = 0.00028)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 6fg
Hsmr_6fg <-t18|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37056, 
              to = 38807, 
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
    by = bg_t18_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05896, 
               t =25.9, S = 0, 
               mass = 0.00037) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 6fl

Hsmr_6fl <-t18|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37056, 
              to = 38807, 
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
    by = bg_t18_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05979, 
               t =25.9, S = 0, 
               mass = 0.00054) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 19----
#Chamber 1 1mp
Hsmr_1mp <-t19|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 33228, 
              to = 34427, 
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
    by = bg_t19_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05641, 
               t =25.9, S = 0, 
               mass = 0.000016) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 1mg
Hsmr_1mg <-t19|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 33228, 
              to = 34427, 
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
    by = bg_t19_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05752, 
               t =25.9, S = 0, 
               mass = 0.00015)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 1fg
Hsmr_1fg <-t19|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 32478, 
              to = 34638, 
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
    by = bg_t19_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05892, 
               t =25.9, S = 0, 
               mass = 0.00041) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 1fl

Hsmr_1fl <-t19|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 32478, 
              to = 34638, 
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
    by = bg_t19_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05981, 
               t =25.9, S = 0, 
               mass = 0.00052) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 20----
#Chamber 1 1mb
Hsmr_1mb <-t20|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 42220, 
              to = 44600, 
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
    by = bg_t20_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05646, 
               t =25.7, S = 0, 
               mass = 0.00011) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 1ml
Hsmr_1ml <-t20|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 42220, 
              to = 44600, 
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
    by = bg_t20_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05755, 
               t =25.7, S = 0, 
               mass = 0.00012)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 1fp
Hsmr_1fp <-t20|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 42369, 
              to = 44600, 
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
    by = bg_t20_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05914, 
               t =25.7, S = 0, 
               mass = 0.00019) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 1fb

Hsmr_1fb <-t20|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 42369, 
              to = 44600, 
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
    by = bg_t20_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.06005, 
               t =25.7, S = 0, 
               mass = 0.00028) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()
# Trial 21----
#Chamber 1 11mb
Hsmr_11mb <-t21|>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 31558, 
              to = 33656, 
              by = "row") |>
  
  
  #extract rates
  calc_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 180,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t21_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05425, 
               t =25.6, S = 0, 
               mass = 0.00008) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 11ml
Hsmr_11ml <-t21|>
  inspect(time= 3, oxygen = 22) |>
  subset_data(from = 31558, 
              to = 33656, 
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
    by = bg_t21_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05476, 
               t =25.6, S = 0, 
               mass = 0.00014)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 11fb
Hsmr_11fb <-t21|>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 31558, 
              to = 33656, 
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
    by = bg_t21_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05880, 
               t =25.6, S = 0, 
               mass = 0.00017) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 1fp died

# Trial 22----
#Chamber 1 11mp
Hsmr_11mp <-t22_hypo|>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 312, 
              to = 2105, 
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
    by = bg_t22_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05421, 
               t =25.2, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 11mg
Hsmr_11mg <-t22_hypo|>
  inspect(time= 3, oxygen = 22) |>
  subset_data(from = 312, 
              to = 2105, 
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
    by = bg_t22_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05478, 
               t =25.2, S = 0, 
               mass = 0.00012)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 11fl
Hsmr_11fl <-t22_hypo|>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 312, 
              to = 2105, 
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
    by = bg_t22_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05539, 
               t =25.2, S = 0, 
               mass = 0.00058) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 11fg

Hsmr_11fg <-t22_hypo|>
  inspect(time= 3, oxygen = 58) |> 
  subset_data(from = 312, 
              to = 2105, 
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
    by = bg_t22_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05651, 
               t =25.2, S = 0, 
               mass = 0.00076) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# Trial 23----
#Chamber 1 8mb
Hsmr_8mb <-t23|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 34979, 
              to = 36080, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t23_ch1,
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

# chamber 2 8mg
Hsmr_8mg <-t23|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 34379, 
              to = 36080, 
              by = "row") |>
  
  
  #extract rates
  auto_rate.int(
    starts = 1200,  # 15 min measure + 5 min flush
    wait = 240,    # 3 min
    measure = 600, # 10 min
    method = "lowest",
    width = 300,   # extract lowest rate from a 5-min duration
    by = "time") |>
  
  #Adjust the rates
  adjust_rate(
    by = bg_t23_ch2,
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

# Chamber 3 8fb
Hsmr_8fb <-t23|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 33779, 
              to = 36459, 
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
    by = bg_t23_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05899, 
               t =25.4, S = 0, 
               mass = 0.00034) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 8fg

Hsmr_8fg <-t23|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 33779, 
              to = 36459, 
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
    by = bg_t23_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05950, 
               t =25.4, S = 0, 
               mass = 0.00083) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 24----
#Chamber 1 8ml
Hsmr_8ml <-t24|>  
  inspect(time = 3, oxygen = 4) |>
  subset_data(from = 36858, 
              to = 39228, 
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
    by = bg_t24_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05642, 
               t =24.8, S = 0, 
               mass = 0.00015) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 8mp
Hsmr_8mp <-t24|>
  inspect(time = 3, oxygen = 22) |>
  subset_data(from = 36858, 
              to = 39228, 
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
    by = bg_t24_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05736, 
               t =24.8, S = 0, 
               mass = 0.00031)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 8fp
Hsmr_8fp <-t24|>
  inspect(time = 3, oxygen = 40) |>
  subset_data(from = 37007, 
              to = 39228, 
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
    by = bg_t24_ch3,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05884, 
               t =24.8, S = 0, 
               mass = 0.00049) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 8fl

Hsmr_8fl <-t24|>
  inspect(time = 3, oxygen = 58) |> 
  subset_data(from = 37007, 
              to = 39228, 
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
    by = bg_t24_ch4,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05959, 
               t =24.8, S = 0, 
               mass = 0.00074) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()







