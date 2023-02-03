
library(respR)
library(lubridate)
library(tidyverse)

# import of background rates-------

bg1 <- import_file("Respirometry data/Raw data/2022-10-27_113153_bg_end2/2022-10-27_113153_bg_end2.txt") |> 
  select( 
    date = "Date [A Ch.1 Main]",       
    time_ch1 = "Time [A Ch.1 Main]",
    oxygen_ch1= "Oxygen (%air sat.) [A Ch.1 Main]",  
    time_ch2 = "Time [A Ch.2 Main]", 
    oxygen_ch2 = "Oxygen (%air sat.) [A Ch.2 Main]", 
    time_ch3 = "Time [A Ch.3 Main]", 
    oxygen_ch3 = "Oxygen (%air sat.) [A Ch.3 Main]", 
    time_ch4 = "Time [A Ch.4 Main]", 
    oxygen_ch4 = "Oxygen (%air sat.) [A Ch.4 Main]")

bg1$date_time_1 = dmy_hms(paste(bg1$date, bg1$time_ch1)) |> 
      round_date("sec")
bg1$date_time_2 = dmy_hms(paste(bg1$date, bg1$time_ch2)) |> 
      round_date("sec")
bg1$date_time_3 = dmy_hms(paste(bg1$date, bg1$time_ch3)) |> 
      round_date("sec")
bg1$date_time_4 = dmy_hms(paste(bg1$date, bg1$time_ch4)) |>   
      round_date("sec")

bg1_cleaned <- select(bg1,
                       "oxygen_ch1","date_time_1",
                       "oxygen_ch2", "date_time_2",
                       "oxygen_ch3", "date_time_3",
                       "oxygen_ch4", "date_time_4")
bg1_cleaned$num_time_1 <- as.numeric(difftime(bg1_cleaned[[2]], bg1_cleaned[[1,2]], units = "secs"))
bg1_cleaned$num_time_2 <- as.numeric(difftime(bg1_cleaned[[4]], bg1_cleaned[[1,4]], units = "secs"))
bg1_cleaned$num_time_3 <- as.numeric(difftime(bg1_cleaned[[6]], bg1_cleaned[[1,6]], units = "secs"))
bg1_cleaned$num_time_4 <- as.numeric(difftime(bg1_cleaned[[8]], bg1_cleaned[[1,8]], units = "secs"))


bgch4_pre <- bg1_cleaned |> 
  subset_data(from = 1, to = 1800, by = "row") |>  # an hour of background at beginning
  inspect(time= 12, oxygen =7) |> 
    calc_rate.bg() # okay to have flushing here??

bgch4_post <- bg1_cleaned |> 
  subset_data(from = 39930, to = 41730, by = "row") |>  # an hour of background at end
  inspect(time= 12, oxygen = 7) |> 
  calc_rate.bg()  



#raw data import and cleaning---------------------------------------------------

data <- import_file("Respirometry data/Raw data/2022-10-01_101553_01_10_T2/2022-10-01_101553_01_10_T2.txt") |> 
  select( 
              
         time_ch1 = " dt (s) [A Ch.1 Main]",
         oxygen_ch1= "Oxygen (%air sat.) [A Ch.1 Main]",  
         time_ch2 = " dt (s) [A Ch.2 Main]", 
         oxygen_ch2 = "Oxygen (%air sat.) [A Ch.2 Main]", 
         time_ch3 = " dt (s) [A Ch.3 Main]", 
         oxygen_ch3 = "Oxygen (%air sat.) [A Ch.3 Main]", 
         time_ch4 = " dt (s) [A Ch.4 Main]", 
         oxygen_ch4 = "Oxygen (%air sat.) [A Ch.4 Main]") |> 
  mutate_at(vars(starts_with("time_")), funs(round(., 0))) # works fine, but dont get the clock time

  
data$date_time_1 = dmy_hms(paste(data$date, data$time_ch1)) |> 
  round_date("sec")
data$date_time_2 = dmy_hms(paste(data$date, data$time_ch2)) |> 
  round_date("sec")
data$date_time_3 = dmy_hms(paste(data$date, data$time_ch3)) |> 
  round_date("sec")
data$date_time_4 = dmy_hms(paste(data$date, data$time_ch4)) |> 
  round_date("sec")


data_cleaned <- select(data,
                       "oxygen_ch1","date_time_1",
                       "oxygen_ch2", "date_time_2",
                       "oxygen_ch3", "date_time_3",
                       "oxygen_ch4", "date_time_4")

data_cleaned$num_time_1 <- as.numeric(difftime(data_cleaned[[2]], data_cleaned[[1,2]], units = "secs"))
data_cleaned$num_time_2 <- as.numeric(difftime(data_cleaned[[4]], data_cleaned[[1,4]], units = "secs"))
data_cleaned$num_time_3 <- as.numeric(difftime(data_cleaned[[6]], data_cleaned[[1,6]], units = "secs"))
data_cleaned$num_time_4 <- as.numeric(difftime(data_cleaned[[8]], data_cleaned[[1,8]], units = "secs"))





inspect(data_cleaned, time = 9, oxyge = 1) # not evenly spaced

inspect(data_cleaned, time =9, oxygen = c(1,3,5,7))


#Calculate MMR------------------------------------------------------------------

# subset rep 1 the MMR period for chamber 4

# 1 row = 2 seconds, so 5 min flush is 150 rows
#testing this on female in ch4 - started at 1041, pumps on at 11:02-11:07

ch4_rep_1 <- subset_data(data_cleaned,
                         from = 754,
                         to = 754 + 780 - 150, # 780 rows is the from mmr_start time to pumps off
                         by =  "row") |> 
  inspect(time = 12, oxygen = 7) |>       # to only inspect ch4
  plot(width= 0.2) # Remember to check is 0.2 is right or not

# extract rates -> 3 ways -------------------------------------------------

# by calc-rate - extract rate from a single specific region

ch4_mmr <- calc_rate(ch4_rep_1,
                     from = 30, # 1 minutes of wait
                     to = 510, # 15 minutes later, measure phase
                     by = "row") |> 
  summary()
# rate here is -0.01677


# by auto_rate method - extract rates of specific time/row width
# it calculates every rate of this width- order by highest value

ch4_mmr2 <- ch4_rep_1 |> 
  subset_data(from = 60, by = "row") |> 
  auto_rate(method = "highest",
            width = 120,          # why 120?? need to read about this!
            by = "row") |> 
  summary()

# by auto_rate  linear method
#default opinions find linear regions of data

ch4_mmr3 <- ch4_rep_1 |> 
  subset_data(from = 60, by = "row") |>
  auto_rate(width = 0.2)|> 
  summary() 
  
plot(ch4_mmr3, pos = 5) #something is wrong here, looks like flush is in here?

# Adjusting the rates - by background rates--------------------------------------------

ch4_mmr_adj <- adjust_rate(ch4_mmr3,    # via mmr3, but ch4_mmr gave lowest rate output. 
                           by = bgch4_pre,
                           by2 = bgch4_post,
                           method = "linear")  # whole lot of warnings -needs fixing
summary(ch4_mmr_adj)


# Convert the rates to units--------------------------------------------------------------

ch4_mmr_adj_conv <- convert_rate(ch4_mmr_adj,
                                 oxy.unit = "mg/L", # oxygen units  of raw data
                                 time.unit = "secs", # time units of the original raw data
                                 output.unit = "mg/h/g", #desired output unit
                                 volume = 0.06033, # effective volume of chamber with tubing in L
                                 mass = 0.00045 #mass in kg
                                 )
summary(ch4_mmr_adj_conv)


# Select final reportable MMR form the multiple rates when using linear method

ch4_MMR <- select_rate(ch4_mmr_adj_conv,
                       method = "highest",
                       n = 1)

ch4_MMR_results = summary(ch4_MMR, export = TRUE)  
 # altfor høye tall -7.96






# SMR analysis on ch4 as well----------------------------------------------------

#subset data

ch4_insp <- data_cleaned |> 
  select(num_time_4, oxygen_ch4) |> 
  subset_data(from = 1534, # after first flush 11:07
              to = 33719, #to 5 am
              by="row") |> 
  inspect()  
  
#extract rates
ch4_ar.int <- calc_rate.int(ch4_insp,
                            starts = 600, # 20 min measure + 5 min flush
                            wait = 60, # 2 min wait phase # can do 5 min
                            measure = 300, # 20 min measure # 15 min
                            method = "lowest",
                            width = 150, # extract lowest rate from a 5-min duration
                            by = "row") |> 
  summary() #Why both positive and negative rates?


              

#Adjust the rates

ch4_ar.int_adj <- adjust_rate(ch4_)















