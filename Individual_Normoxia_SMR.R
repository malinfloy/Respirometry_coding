# SMR for all individuals during normoxia conditions
x <- list()

# Trial 1 ----
# Chamber 1 - 2ml
Nsmr_2ml <- t1 |>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_2mg <- t1 |>
  inspect(time=3, oxygen = 22) |>
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
Nsmr_2fg <- t1 |>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_2fl <- t1 |>
  inspect(time= 3, oxygen = 58) |> 
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
    by = bg_ch4) |>
  
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
Nsmr_2mp <- t2 |>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_2mb <- t2 |>
  inspect(time= 3, oxygen = 22) |>
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
Nsmr_2fb <- t2 |>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_2fp <- t2 |>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_10mb <- t3 |>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 2253, 
              to = 33380, 
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
    volume = 0.05419,
    t = 25.2, S = 0,
    mass = 0.00014) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()  


# chamber 2 10mp
Nsmr_10mp <- t3 |>
  inspect(time=3, oxygen = 22) |>
  subset_data(from = 2253, 
              to = 33380, 
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
Nsmr_10mg <- t3 |>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 2103, 
              to = 33380,  
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

Nsmr_10fl <- t3 |>
  inspect(time= 3, oxygen = 58) |> 
  subset_data(from = 2103, 
              to = 33380,
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
Nsmr_10ml <- t4 |>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 3035,  # begynner 12 pga rar lesing samme skjer uansett tid??
              to = 33556, 
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
    t = 24.7, S = 0,
    mass = 0.00013) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()  


# chamber 2 10fp
Nsmr_10fp <- t4 |>
  inspect(time=3, oxygen = 22) |>
  subset_data(from = 3035, 
              to = 33556, 
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
    by = bg_ch2,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05447, 
               t =24.7, S = 0, 
               mass = 0.00043) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 10fg
Nsmr_10fg <- t4 |>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 1985, 
              to = 33556,  
              by = "row") |>
  
  #extract rates
  calc_rate.int(
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
               t =24.7, S = 0, 
               mass = 0.00038) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 10fb

Nsmr_10fb <- t4 |>
  inspect(time= 3, oxygen = 58) |> 
  subset_data(from = 1985, 
              to = 33556,
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
               t =24.7, S = 0, 
               mass = 0.00054) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 5----
# Chamber 1 - 7ml
Nsmr_7ml <- t5 |>  
  inspect(time= 3, oxygen =4) |>
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
Nsmr_7mb <- t5 |>
  inspect(time=3, oxygen = 22) |>
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
Nsmr_7fb <- t5 |>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_7fp <- t5 |>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_7mp <- t6 |>
  inspect(time= 3, oxygen = 4) |> 
  subset_data(from = 1416,
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
Nsmr_7mg <- t6 |>
  inspect(time=3, oxygen =4) |>
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
Nsmr_7fl <-t6 |>
  inspect(time=3, oxygen = 40) |> 
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

Nsmr_7fg <-t6 |>
  inspect(time=3, oxygen = 40) |> 
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
Nsmr_5mg <- t7 |>
  inspect(time= 3, oxygen = 4) |> 
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
Nsmr_5mp <- t7 |>
  inspect(time= 3, oxygen =4) |>
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
Nsmr_5ml <-t7 |>
  inspect(time= 3, oxygen = 40) |> 
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

Nsmr_5fp <-t7 |>
  inspect(time= 3, oxygen = 40) |> 
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
# closed pahse goes up - can't use
Nsmr_5mb <-t8|>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_5fb <-t8|>
  inspect(time= 3, oxygen = 22) |>
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
Nsmr_5fl <-t8|>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_5fg <-t8|>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_9ml <-t9|>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_9mg <-t9|>
  inspect(time= 3, oxygen = 22) |>
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
Nsmr_9mp <-t9|>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_9fb <-t9|>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_9mb <-t10|>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_9fl <-t10|>
  inspect(time= 3, oxygen = 22) |>
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
Nsmr_9fp <-t10|>
  inspect(time= 3, oxygen = 40) |>
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
Nsmr_4mb <-t11|>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_4ml <-t11|>
  inspect(time= 3, oxygen = 22) |>
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
Nsmr_4fl <-t11|>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_4fb <-t11|>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_4mp <-t12|>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_4mg <-t12|>
  inspect(time= 3, oxygen = 22) |>
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
Nsmr_4fp <-t12|>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_4fg <-t12|>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_12mp <-t13|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t13) |>
  
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
Nsmr_12fg <-t13|>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_12fb <-t13|>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_12ml <-t14|>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_12fl <-t14|>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_12fp <-t14|>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_3mp <-t15|>  
  inspect(time= 3, oxygen = 4) |>
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
Nsmr_3fb <-t15|>
  inspect(time= 3, oxygen = 22) |>
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
Nsmr_3fl <-t15|>
  inspect(time= 3, oxygen = 40) |>
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

Nsmr_3fg <-t15|>
  inspect(time= 3, oxygen = 58) |> 
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
Nsmr_3mg <-t16|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t16_ch1,
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
Nsmr_3ml <-t16|>
  inspect(time= 3, oxygen = 22) |>
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
    by = bg_t16_ch2,
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
Nsmr_3fp <-t16|>
  inspect(time= 3, oxygen = 40) |>
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
    by = bg_t16_ch3,
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
Nsmr_6mp <-t17|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t17) |>
  
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
Nsmr_6mg <-t17|>
  inspect(time= 3, oxygen = 22) |>
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
    by = bg_t17) |>
  
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
Nsmr_6fb <-t17|>
  inspect(time= 3, oxygen = 40) |>
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
    by = bg_t17) |>
  
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
Nsmr_6mb <-t18|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t18_ch1,
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
Nsmr_6fp <-t18|>
  inspect(time= 3, oxygen = 22) |>
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
    by = bg_t18_ch2,
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
Nsmr_6fg <-t18|>
  inspect(time= 3, oxygen = 40) |>
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
    by = bg_t18_ch3,
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

Nsmr_6fl <-t18|>
  inspect(time= 3, oxygen = 58) |> 
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
    by = bg_t18_ch4,
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
Nsmr_1mp <-t19|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t19_ch1,
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
Nsmr_1mg <-t19|>
  inspect(time= 3, oxygen = 22) |>
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
    by = bg_t19_ch2,
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
Nsmr_1fg <-t19|>
  inspect(time= 3, oxygen = 40) |>
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
    by = bg_t19_ch3,
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

Nsmr_1fl <-t19|>
  inspect(time= 3, oxygen = 58) |> 
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
    by = bg_t19_ch4,
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
Nsmr_1mb <-t20|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t20_ch1,
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
Nsmr_1ml <-t20|>
  inspect(time= 3, oxygen = 22) |>
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
    by = bg_t20_ch2,
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
Nsmr_1fp <-t20|>
  inspect(time= 3, oxygen = 40) |>
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
    by = bg_t20_ch3,
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

Nsmr_1fb <-t20|>
  inspect(time= 3, oxygen = 58) |> 
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
    by = bg_t20_ch4,
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
#Chamber 1 11mb
Nsmr_11mb <-t21|>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 994, 
              to = 27670, 
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
    by = bg_t21_ch1,
    method = "value") |>
  
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = 0.05425, 
               t =25.5, S = 0, 
               mass = 0.00008) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 11ml
Nsmr_11ml <-t21|>
  inspect(time= 3, oxygen = 22) |>
  subset_data(from = 994, 
              to = 27670, 
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
               t =25.5, S = 0, 
               mass = 0.00014)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 11fb
Nsmr_11fb <-t21|>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 994, 
              to = 27540, 
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
               t =25.5, S = 0, 
               mass = 0.00017) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 1fp died

# Trial 22----
#Chamber 1 11mp
Nsmr_11mp <-t22|>  
  inspect(time= 3, oxygen = 4) |>
  subset_data(from = 1433, 
              to = 33036, 
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
               t =24.6, S = 0, 
               mass = 0.00012) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# chamber 2 11mg
Nsmr_11mg <-t22|>
  inspect(time= 3, oxygen = 22) |>
  subset_data(from = 1433, 
              to = 33036, 
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
               t =24.6, S = 0, 
               mass = 0.00012)|>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  # defined that our SMR is the mean of the lowest 10th percentile of the rates from each replicate
  summary() |>
  mean()

# Chamber 3 11fl
Nsmr_11fl <-t22|>
  inspect(time= 3, oxygen = 40) |>
  subset_data(from = 1433, 
              to = 32920, 
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
               t =24.6, S = 0, 
               mass = 0.00058) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()


# chamber 4 11fg

Nsmr_11fg <-t22|>
  inspect(time= 3, oxygen = 58) |> 
  subset_data(from = 1433, 
              to = 32920, 
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
               t =24.6, S = 0, 
               mass = 0.00076) |>
  
  # Select rate
  select_rate(method = "lowest_percentile", n = 0.1) |>  
  summary() |>
  mean()

# Trial 23----
#Chamber 1 8mb
Nsmr_8mb <-t23|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t23_ch1,
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
Nsmr_8mg <-t23|>
  inspect(time= 3, oxygen = 22) |>
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
    by = bg_t23_ch2,
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
Nsmr_8fb <-t23|>
  inspect(time= 3, oxygen = 40) |>
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
    by = bg_t23_ch3,
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

Nsmr_8fg <-t23|>
  inspect(time= 3, oxygen = 58) |> 
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
    by = bg_t23_ch4,
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
Nsmr_8ml <-t24|>  
  inspect(time= 3, oxygen = 4) |>
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
    by = bg_t24_ch1,
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
Nsmr_8mp <-t24|>
  inspect(time= 3, oxygen = 22) |>
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
    by = bg_t24_ch2,
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
Nsmr_8fp <-t24|>
  inspect(time= 3, oxygen = 40) |>
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
    by = bg_t24_ch3,
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

Nsmr_8fl <-t24|>
  inspect(time= 3, oxygen = 58) |> 
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
    by = bg_t24_ch4,
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













