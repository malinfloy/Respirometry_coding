
#  Background data after Trials - flushing on for chamber 1 and 2 on. ----------------

bg_1 <- import_file("Respirometry data/Raw data/2022-10-24_102444__end_1/2022-10-24_102444__end_1.txt") |> 
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

bg_1$date_time_1 = dmy_hms(paste(bg_1$date, bg_1$time_ch1)) |> 
  round_date("sec")
bg_1$date_time_2 = dmy_hms(paste(bg_1$date, bg_1$time_ch2)) |> 
  round_date("sec")
bg_1$date_time_3 = dmy_hms(paste(bg_1$date, bg_1$time_ch3)) |> 
  round_date("sec")
bg_1$date_time_4 = dmy_hms(paste(bg_1$date, bg_1$time_ch4)) |>   
  round_date("sec")

bg_1<- select(bg_1,
                      "oxygen_ch1","date_time_1",
                      "oxygen_ch2", "date_time_2",
                      "oxygen_ch3", "date_time_3",
                      "oxygen_ch4", "date_time_4")
bg_1_cleaned$num_time_1 <- as.numeric(difftime(bg_1_cleaned[[2]], bg_1_cleaned[[1,2]], units = "secs"))
bg_1_cleaned$num_time_2 <- as.numeric(difftime(bg_1_cleaned[[4]], bg_1_cleaned[[1,4]], units = "secs"))
bg_1_cleaned$num_time_3 <- as.numeric(difftime(bg_1_cleaned[[6]], bg_1_cleaned[[1,6]], units = "secs"))
bg_1_cleaned$num_time_4 <- as.numeric(difftime(bg_1_cleaned[[8]], bg_1_cleaned[[1,8]], units = "secs"))







bgch4_pre <- bg_1_cleaned |> 
  subset_data(from = 1, to = 1800, by = "row") |>  # an hour of  at beginning
  inspect(time= 12, oxygen =7) |> 
  calc_rate.bg() # okay to have flushing here??

bgch4_post <- bg_1_cleaned |> 
  subset_data(from = 39930, to = 41730, by = "row") |>  # an hour of  at end
  inspect(time= 12, oxygen = 7) |> 
  calc_rate.bg()







#  Background data after Trials - flushing on for chamber 3 and 4 on. -------------------------------------------------
bg_2 <- import_file("Respirometry data/Raw data/2022-10-27_113153_bg_end2/2022-10-27_113153_bg_end2.txt") |> 
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

bg_2$date_time_1 = dmy_hms(paste(bg_2$date, bg_2$time_ch1)) |> 
  round_date("sec")
bg_2$date_time_2 = dmy_hms(paste(bg_2$date, bg_2$time_ch2)) |> 
  round_date("sec")
bg_2$date_time_3 = dmy_hms(paste(bg_2$date, bg_2$time_ch3)) |> 
  round_date("sec")
bg_2$date_time_4 = dmy_hms(paste(bg_2$date, bg_2$time_ch4)) |>   
  round_date("sec")

bg_2_cleaned <- select(bg_2,
                      "oxygen_ch1","date_time_1",
                      "oxygen_ch2", "date_time_2",
                      "oxygen_ch3", "date_time_3",
                      "oxygen_ch4", "date_time_4")
bg_2_cleaned$num_time_1 <- as.numeric(difftime(bg_2_cleaned[[2]], bg_2_cleaned[[1,2]], units = "secs"))
bg_2_cleaned$num_time_2 <- as.numeric(difftime(bg_2_cleaned[[4]], bg_2_cleaned[[1,4]], units = "secs"))
bg_2_cleaned$num_time_3 <- as.numeric(difftime(bg_2_cleaned[[6]], bg_2_cleaned[[1,6]], units = "secs"))
bg_2_cleaned$num_time_4 <- as.numeric(difftime(bg_2_cleaned[[8]], bg_2_cleaned[[1,8]], units = "secs"))




bgch4_pre <- bg_2_cleaned |> 
  subset_data(from = 1, to = 1800, by = "row") |>  # an hour of  at beginning
  inspect(time= 12, oxygen =7) |> 
  calc_rate.bg() # Flush is on need to fix

bgch4_post <- bg_2_cleaned |> 
  subset_data(from = 39930, to = 41730, by = "row") |>  # an hour of  at end
  inspect(time= 12, oxygen = 7) |> 
  calc_rate.bg()






#  Trial 5 -----------------------------------------------------------
bg_T5 <- import_file("Respirometry data/Raw data/2022-10-05_084323_Bg_T5/2022-10-05_084323_Bg_T5.txt")

bg_T5$date_time_1 = dmy_hms(paste(bg_T5$`Date [A Ch.1 Main]`, bg_T5$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T5$date_time_2 = dmy_hms(paste(bg_T5$`Date [A Ch.2 Main]`, bg_T5$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T5$date_time_3 = dmy_hms(paste(bg_T5$`Date [A Ch.3 Main]`, bg_T5$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T5$date_time_4 = dmy_hms(paste(bg_T5$`Date [A Ch.4 Main]`, bg_T5$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T5$num_time_ch1 <- as.numeric(difftime(bg_T5[[81]], bg_T5[[1,81]], units = "secs")) 
bg_T5$num_time_ch2 <- as.numeric(difftime(bg_T5[[82]], bg_T5[[1,82]], units = "secs"))  
bg_T5$num_time_ch3 <- as.numeric(difftime(bg_T5[[83]], bg_T5[[1,83]], units = "secs"))  
bg_T5$num_time_ch4 <- as.numeric(difftime(bg_T5[[84]], bg_T5[[1,84]], units = "secs"))

bg_T5 <- select(bg_T5,
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
             "date_time_4")

# Chamber 1
bg_T5_ch1 <- bg_T5 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T5_ch2 <- bg_T5 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T5_ch3 <- bg_T5 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T5_ch4 <- bg_T5 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg() 


#  Trial 6 -----------------------------------------------------------
bg_T6 <- import_file("Respirometry data/Raw data/2022-10-06_085243_bg_T6/2022-10-06_085243_bg_T6.txt")

bg_T6$date_time_1 = dmy_hms(paste(bg_T6$`Date [A Ch.1 Main]`, bg_T6$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T6$date_time_2 = dmy_hms(paste(bg_T6$`Date [A Ch.2 Main]`, bg_T6$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T6$date_time_3 = dmy_hms(paste(bg_T6$`Date [A Ch.3 Main]`, bg_T6$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T6$date_time_4 = dmy_hms(paste(bg_T6$`Date [A Ch.4 Main]`, bg_T6$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T6$num_time_ch1 <- as.numeric(difftime(bg_T6[[81]], bg_T6[[1,81]], units = "secs")) 
bg_T6$num_time_ch2 <- as.numeric(difftime(bg_T6[[82]], bg_T6[[1,82]], units = "secs"))  
bg_T6$num_time_ch3 <- as.numeric(difftime(bg_T6[[83]], bg_T6[[1,83]], units = "secs"))  
bg_T6$num_time_ch4 <- as.numeric(difftime(bg_T6[[84]], bg_T6[[1,84]], units = "secs"))

bg_T6 <- select(bg_T6,
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
                "date_time_4")

# Chamber 1
bg_T6_ch1 <- bg_T6 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T6_ch2 <- bg_T6 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T6_ch3 <- bg_T6 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T6_ch4 <- bg_T6 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

#  Trial 7 -----------------------------------------------------------
bg_T7 <- import_file("Respirometry data/Raw data/2022-10-07_085341_bg_T7/2022-10-07_085341_bg_T7.txt")

bg_T7$date_time_1 = dmy_hms(paste(bg_T7$`Date [A Ch.1 Main]`, bg_T7$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T7$date_time_2 = dmy_hms(paste(bg_T7$`Date [A Ch.2 Main]`, bg_T7$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T7$date_time_3 = dmy_hms(paste(bg_T7$`Date [A Ch.3 Main]`, bg_T7$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T7$date_time_4 = dmy_hms(paste(bg_T7$`Date [A Ch.4 Main]`, bg_T7$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T7$num_time_ch1 <- as.numeric(difftime(bg_T7[[81]], bg_T7[[1,81]], units = "secs")) 
bg_T7$num_time_ch2 <- as.numeric(difftime(bg_T7[[82]], bg_T7[[1,82]], units = "secs"))  
bg_T7$num_time_ch3 <- as.numeric(difftime(bg_T7[[83]], bg_T7[[1,83]], units = "secs"))  
bg_T7$num_time_ch4 <- as.numeric(difftime(bg_T7[[84]], bg_T7[[1,84]], units = "secs"))

bg_T7 <- select(bg_T7,
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
                "date_time_4")

# Chamber 1
bg_T7_ch1 <- bg_T7 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T7_ch2 <- bg_T7 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T7_ch3 <- bg_T7 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T7_ch4 <- bg_T7 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

#  Trial 8 -----------------------------------------------------------
bg_T8 <- import_file("Respirometry data/Raw data/2022-10-08_084625_bg_T8/2022-10-08_084625_bg_T8.txt")

bg_T8$date_time_1 = dmy_hms(paste(bg_T8$`Date [A Ch.1 Main]`, bg_T8$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T8$date_time_2 = dmy_hms(paste(bg_T8$`Date [A Ch.2 Main]`, bg_T8$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T8$date_time_3 = dmy_hms(paste(bg_T8$`Date [A Ch.3 Main]`, bg_T8$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T8$date_time_4 = dmy_hms(paste(bg_T8$`Date [A Ch.4 Main]`, bg_T8$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T8$num_time_ch1 <- as.numeric(difftime(bg_T8[[81]], bg_T8[[1,81]], units = "secs")) 
bg_T8$num_time_ch2 <- as.numeric(difftime(bg_T8[[82]], bg_T8[[1,82]], units = "secs"))  
bg_T8$num_time_ch3 <- as.numeric(difftime(bg_T8[[83]], bg_T8[[1,83]], units = "secs"))  
bg_T8$num_time_ch4 <- as.numeric(difftime(bg_T8[[84]], bg_T8[[1,84]], units = "secs"))

bg_T8 <- select(bg_T8,
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
                "date_time_4")

# Chamber 1
bg_T8_ch1 <- bg_T8 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T8_ch2 <- bg_T8 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T8_ch3 <- bg_T8 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T8_ch4 <- bg_T8 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

#  Trial 9 -----------------------------------------------------------
bg_T9 <- import_file("Respirometry data/Raw data/2022-10-09_085346_bg_T9/2022-10-09_085346_bg_T9.txt")

bg_T9$date_time_1 = dmy_hms(paste(bg_T9$`Date [A Ch.1 Main]`, bg_T9$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T9$date_time_2 = dmy_hms(paste(bg_T9$`Date [A Ch.2 Main]`, bg_T9$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T9$date_time_3 = dmy_hms(paste(bg_T9$`Date [A Ch.3 Main]`, bg_T9$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T9$date_time_4 = dmy_hms(paste(bg_T9$`Date [A Ch.4 Main]`, bg_T9$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T9$num_time_ch1 <- as.numeric(difftime(bg_T9[[81]], bg_T9[[1,81]], units = "secs")) 
bg_T9$num_time_ch2 <- as.numeric(difftime(bg_T9[[82]], bg_T9[[1,82]], units = "secs"))  
bg_T9$num_time_ch3 <- as.numeric(difftime(bg_T9[[83]], bg_T9[[1,83]], units = "secs"))  
bg_T9$num_time_ch4 <- as.numeric(difftime(bg_T9[[84]], bg_T9[[1,84]], units = "secs"))

bg_T9 <- select(bg_T9,
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
                "date_time_4")

# Chamber 1
bg_T9_ch1 <- bg_T9 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T9_ch2 <- bg_T9 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T9_ch3 <- bg_T9 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T9_ch4 <- bg_T9 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()


#  Trial 10-------------------------------- 
#  Trial 11 ----------------------------------------------------------
bg_T11 <- import_file("Respirometry data/Raw data/2022-10-11_084629_bg_T11/2022-10-11_084629_bg_T11.txt")

bg_T11$date_time_1 = dmy_hms(paste(bg_T11$`Date [A Ch.1 Main]`, bg_T11$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T11$date_time_2 = dmy_hms(paste(bg_T11$`Date [A Ch.2 Main]`, bg_T11$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T11$date_time_3 = dmy_hms(paste(bg_T11$`Date [A Ch.3 Main]`, bg_T11$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T11$date_time_4 = dmy_hms(paste(bg_T11$`Date [A Ch.4 Main]`, bg_T11$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T11$num_time_ch1 <- as.numeric(difftime(bg_T11[[81]], bg_T11[[1,81]], units = "secs")) 
bg_T11$num_time_ch2 <- as.numeric(difftime(bg_T11[[82]], bg_T11[[1,82]], units = "secs"))  
bg_T11$num_time_ch3 <- as.numeric(difftime(bg_T11[[83]], bg_T11[[1,83]], units = "secs"))  
bg_T11$num_time_ch4 <- as.numeric(difftime(bg_T11[[84]], bg_T11[[1,84]], units = "secs"))

bg_T11 <- select(bg_T11,
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
                "date_time_4")

# Chamber 1
bg_T11_ch1 <- bg_T11 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T11_ch2 <- bg_T11 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T11_ch3 <- bg_T11 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T11_ch4 <- bg_T11 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

#  Trial 12-----------------------------------------------------------
bg_T12 <- import_file("Respirometry data/Raw data/2022-10-12_085044_bg_T12/2022-10-12_085044_bg_T12.txt")

bg_T12$date_time_1 = dmy_hms(paste(bg_T12$`Date [A Ch.1 Main]`, bg_T12$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T12$date_time_2 = dmy_hms(paste(bg_T12$`Date [A Ch.2 Main]`, bg_T12$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T12$date_time_3 = dmy_hms(paste(bg_T12$`Date [A Ch.3 Main]`, bg_T12$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T12$date_time_4 = dmy_hms(paste(bg_T12$`Date [A Ch.4 Main]`, bg_T12$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T12$num_time_ch1 <- as.numeric(difftime(bg_T12[[81]], bg_T12[[1,81]], units = "secs")) 
bg_T12$num_time_ch2 <- as.numeric(difftime(bg_T12[[82]], bg_T12[[1,82]], units = "secs"))  
bg_T12$num_time_ch3 <- as.numeric(difftime(bg_T12[[83]], bg_T12[[1,83]], units = "secs"))  
bg_T12$num_time_ch4 <- as.numeric(difftime(bg_T12[[84]], bg_T12[[1,84]], units = "secs"))

bg_T12 <- select(bg_T12,
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
                 "date_time_4")

# Chamber 1
bg_T12_ch1 <- bg_T12 |> 
  subset_data(from = 10, to = 700, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T12_ch2 <- bg_T12 |> 
  subset_data(from = 10, to = 700, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T12_ch3 <- bg_T12 |> 
  subset_data(from = 10, to = 700, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T12_ch4 <- bg_T12 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

#  Trial 13 -------------------------------

# Chamber 2 was empty throughout the entire trial, used for background on the other chambers
bg_t13 <- subset_data(t13, from = 1377, to = 13377, by = "row") |> # 20 cycles in
  inspect(time = 5, oxygen = 4)
 
rates_T13 <- bg_t13 |> 
calc_rate.int( starts = 600, # 20 min window - 15 min measure, 5 min flush 
               wait = 90, # 3 min wait
               measure = 360, # 12 min measure after removing wait period
               by = "row")



#  Trial 14-------------------------------
#  Trial 15 ----------------------------------------------------------
bg_T15 <- import_file("Respirometry data/Raw data/2022-10-15_085411_Bg_T15/2022-10-15_085411_Bg_T15.txt")

bg_T15$date_time_1 = dmy_hms(paste(bg_T15$`Date [A Ch.1 Main]`, bg_T15$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T15$date_time_2 = dmy_hms(paste(bg_T15$`Date [A Ch.2 Main]`, bg_T15$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T15$date_time_3 = dmy_hms(paste(bg_T15$`Date [A Ch.3 Main]`, bg_T15$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T15$date_time_4 = dmy_hms(paste(bg_T15$`Date [A Ch.4 Main]`, bg_T15$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T15$num_time_ch1 <- as.numeric(difftime(bg_T15[[81]], bg_T15[[1,81]], units = "secs")) 
bg_T15$num_time_ch2 <- as.numeric(difftime(bg_T15[[82]], bg_T15[[1,82]], units = "secs"))  
bg_T15$num_time_ch3 <- as.numeric(difftime(bg_T15[[83]], bg_T15[[1,83]], units = "secs"))  
bg_T15$num_time_ch4 <- as.numeric(difftime(bg_T15[[84]], bg_T15[[1,84]], units = "secs"))

bg_T15 <- select(bg_T15,
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
                 "date_time_4")

# Chamber 1
bg_T15_ch1 <- bg_T15 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T15_ch2 <- bg_T15 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T15_ch3 <- bg_T15 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T15_ch4 <- bg_T15 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

#  Trial 16 ----------------------------------------------------------
bg_T16 <- import_file("Respirometry data/Raw data/2022-10-16_085906_Bg_15_10_T16/2022-10-16_085906_Bg_15_10_T16.txt")

bg_T16$date_time_1 = dmy_hms(paste(bg_T16$`Date [A Ch.1 Main]`, bg_T16$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T16$date_time_2 = dmy_hms(paste(bg_T16$`Date [A Ch.2 Main]`, bg_T16$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T16$date_time_3 = dmy_hms(paste(bg_T16$`Date [A Ch.3 Main]`, bg_T16$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T16$date_time_4 = dmy_hms(paste(bg_T16$`Date [A Ch.4 Main]`, bg_T16$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T16$num_time_ch1 <- as.numeric(difftime(bg_T16[[81]], bg_T16[[1,81]], units = "secs")) 
bg_T16$num_time_ch2 <- as.numeric(difftime(bg_T16[[82]], bg_T16[[1,82]], units = "secs"))  
bg_T16$num_time_ch3 <- as.numeric(difftime(bg_T16[[83]], bg_T16[[1,83]], units = "secs"))  
bg_T16$num_time_ch4 <- as.numeric(difftime(bg_T16[[84]], bg_T16[[1,84]], units = "secs"))

bg_T16 <- select(bg_T16,
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
                 "date_time_4")

# Chamber 1
bg_T16_ch1 <- bg_T16 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T16_ch2 <- bg_T16 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T16_ch3 <- bg_T16 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T16_ch4 <- bg_T16 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()


#  Trial 18 ----------------------------------------------------------
bg_T18 <- import_file("Respirometry data/Raw data/2022-10-18_090014_bg_T18/2022-10-18_090014_bg_T18.txt")
bg_T18$date_time_1 = dmy_hms(paste(bg_T18$`Date [A Ch.1 Main]`, bg_T18$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T18$date_time_2 = dmy_hms(paste(bg_T18$`Date [A Ch.2 Main]`, bg_T18$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T18$date_time_3 = dmy_hms(paste(bg_T18$`Date [A Ch.3 Main]`, bg_T18$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T18$date_time_4 = dmy_hms(paste(bg_T18$`Date [A Ch.4 Main]`, bg_T18$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T18$num_time_ch1 <- as.numeric(difftime(bg_T18[[81]], bg_T18[[1,81]], units = "secs")) 
bg_T18$num_time_ch2 <- as.numeric(difftime(bg_T18[[82]], bg_T18[[1,82]], units = "secs"))  
bg_T18$num_time_ch3 <- as.numeric(difftime(bg_T18[[83]], bg_T18[[1,83]], units = "secs"))  
bg_T18$num_time_ch4 <- as.numeric(difftime(bg_T18[[84]], bg_T18[[1,84]], units = "secs"))

bg_T18 <- select(bg_T18,
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
                 "date_time_4")

# Chamber 1
bg_T18_ch1 <- bg_T18 |> 
  subset_data(from = 10, to = 450, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T18_ch2 <- bg_T18 |> 
  subset_data(from = 10, to = 450, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T18_ch3 <- bg_T18 |> 
  subset_data(from = 10, to = 450, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T18_ch4 <- bg_T18 |> 
  subset_data(from = 10, to = 450, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

#  Trial 19 ----------------------------------------------------------
bg_T19 <- import_file("Respirometry data/Raw data/2022-10-19_085954_bg_T19/2022-10-19_085954_bg_T19.txt")
bg_T19$date_time_1 = dmy_hms(paste(bg_T19$`Date [A Ch.1 Main]`, bg_T19$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T19$date_time_2 = dmy_hms(paste(bg_T19$`Date [A Ch.2 Main]`, bg_T19$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T19$date_time_3 = dmy_hms(paste(bg_T19$`Date [A Ch.3 Main]`, bg_T19$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T19$date_time_4 = dmy_hms(paste(bg_T19$`Date [A Ch.4 Main]`, bg_T19$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T19$num_time_ch1 <- as.numeric(difftime(bg_T19[[81]], bg_T19[[1,81]], units = "secs")) 
bg_T19$num_time_ch2 <- as.numeric(difftime(bg_T19[[82]], bg_T19[[1,82]], units = "secs"))  
bg_T19$num_time_ch3 <- as.numeric(difftime(bg_T19[[83]], bg_T19[[1,83]], units = "secs"))  
bg_T19$num_time_ch4 <- as.numeric(difftime(bg_T19[[84]], bg_T19[[1,84]], units = "secs"))

bg_T19 <- select(bg_T19,
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
                 "date_time_4")

# Chamber 1
bg_T19_ch1 <- bg_T19 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T19_ch2 <- bg_T19 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T19_ch3 <- bg_T19 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T19_ch4 <- bg_T19 |> 
  subset_data(from = 10, to = 430, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()


#  Trial 20 ----------------------------------------------------------
bg_T20 <- import_file("Respirometry data/Raw data/2022-10-20_120357_bg_T20/2022-10-20_120357_bg_T20.txt")
bg_T20$date_time_1 = dmy_hms(paste(bg_T20$`Date [A Ch.1 Main]`, bg_T20$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T20$date_time_2 = dmy_hms(paste(bg_T20$`Date [A Ch.2 Main]`, bg_T20$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T20$date_time_3 = dmy_hms(paste(bg_T20$`Date [A Ch.3 Main]`, bg_T20$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T20$date_time_4 = dmy_hms(paste(bg_T20$`Date [A Ch.4 Main]`, bg_T20$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T20$num_time_ch1 <- as.numeric(difftime(bg_T20[[81]], bg_T20[[1,81]], units = "secs")) 
bg_T20$num_time_ch2 <- as.numeric(difftime(bg_T20[[82]], bg_T20[[1,82]], units = "secs"))  
bg_T20$num_time_ch3 <- as.numeric(difftime(bg_T20[[83]], bg_T20[[1,83]], units = "secs"))  
bg_T20$num_time_ch4 <- as.numeric(difftime(bg_T20[[84]], bg_T20[[1,84]], units = "secs"))

bg_T20 <- select(bg_T20,
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
                 "date_time_4")

# Chamber 1
bg_T20_ch1 <- bg_T20 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T20_ch2 <- bg_T20 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T20_ch3 <- bg_T20 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T20_ch4 <- bg_T20 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()


#  Trial 21 ----------------------------------------------------------
bg_T21 <- import_file("Respirometry data/Raw data/2022-10-21_090645_bg_T21/2022-10-21_090645_bg_T21.txt")
bg_T21$date_time_1 = dmy_hms(paste(bg_T21$`Date [A Ch.1 Main]`, bg_T21$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T21$date_time_2 = dmy_hms(paste(bg_T21$`Date [A Ch.2 Main]`, bg_T21$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T21$date_time_3 = dmy_hms(paste(bg_T21$`Date [A Ch.3 Main]`, bg_T21$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T21$date_time_4 = dmy_hms(paste(bg_T21$`Date [A Ch.4 Main]`, bg_T21$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T21$num_time_ch1 <- as.numeric(difftime(bg_T21[[81]], bg_T21[[1,81]], units = "secs")) 
bg_T21$num_time_ch2 <- as.numeric(difftime(bg_T21[[82]], bg_T21[[1,82]], units = "secs"))  
bg_T21$num_time_ch3 <- as.numeric(difftime(bg_T21[[83]], bg_T21[[1,83]], units = "secs"))  
bg_T21$num_time_ch4 <- as.numeric(difftime(bg_T21[[84]], bg_T21[[1,84]], units = "secs"))

bg_T21 <- select(bg_T21,
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
                 "date_time_4")

# Chamber 1
bg_T21_ch1 <- bg_T21 |> 
  subset_data(from = 10, to = 400, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T21_ch2 <- bg_T21 |> 
  subset_data(from = 10, to = 400, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T21_ch3 <- bg_T21 |> 
  subset_data(from = 10, to = 400, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T21_ch4 <- bg_T21 |> 
  subset_data(from = 10, to = 400, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()


#  Trial 22 ----------------------------------------------------------
bg_T22 <- import_file("Respirometry data/Raw data/2022-10-22_103315_bg_T22/2022-10-22_103315_bg_T22.txt")
bg_T22$date_time_1 = dmy_hms(paste(bg_T22$`Date [A Ch.1 Main]`, bg_T22$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T22$date_time_2 = dmy_hms(paste(bg_T22$`Date [A Ch.2 Main]`, bg_T22$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T22$date_time_3 = dmy_hms(paste(bg_T22$`Date [A Ch.3 Main]`, bg_T22$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T22$date_time_4 = dmy_hms(paste(bg_T22$`Date [A Ch.4 Main]`, bg_T22$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T22$num_time_ch1 <- as.numeric(difftime(bg_T22[[81]], bg_T22[[1,81]], units = "secs")) 
bg_T22$num_time_ch2 <- as.numeric(difftime(bg_T22[[82]], bg_T22[[1,82]], units = "secs"))  
bg_T22$num_time_ch3 <- as.numeric(difftime(bg_T22[[83]], bg_T22[[1,83]], units = "secs"))  
bg_T22$num_time_ch4 <- as.numeric(difftime(bg_T22[[84]], bg_T22[[1,84]], units = "secs"))

bg_T22 <- select(bg_T22,
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
                 "date_time_4")

# Chamber 1
bg_T22_ch1 <- bg_T22 |> 
  subset_data(from = 10, to = 530, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T22_ch2 <- bg_T22 |> 
  subset_data(from = 10, to = 530, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T22_ch3 <- bg_T22 |> 
  subset_data(from = 10, to = 530, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T22_ch4 <- bg_T22 |> 
  subset_data(from = 10, to = 530, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()


#  Trial 23 ----------------------------------------------------------
bg_T23 <- import_file("Respirometry data/Raw data/2022-10-23_090302_bg_T23/2022-10-23_090302_bg_T23.txt")
bg_T23$date_time_1 = dmy_hms(paste(bg_T23$`Date [A Ch.1 Main]`, bg_T23$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T23$date_time_2 = dmy_hms(paste(bg_T23$`Date [A Ch.2 Main]`, bg_T23$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T23$date_time_3 = dmy_hms(paste(bg_T23$`Date [A Ch.3 Main]`, bg_T23$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T23$date_time_4 = dmy_hms(paste(bg_T23$`Date [A Ch.4 Main]`, bg_T23$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T23$num_time_ch1 <- as.numeric(difftime(bg_T23[[81]], bg_T23[[1,81]], units = "secs")) 
bg_T23$num_time_ch2 <- as.numeric(difftime(bg_T23[[82]], bg_T23[[1,82]], units = "secs"))  
bg_T23$num_time_ch3 <- as.numeric(difftime(bg_T23[[83]], bg_T23[[1,83]], units = "secs"))  
bg_T23$num_time_ch4 <- as.numeric(difftime(bg_T23[[84]], bg_T23[[1,84]], units = "secs"))

bg_T23 <- select(bg_T23,
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
                 "date_time_4")

# Chamber 1
bg_T23_ch1 <- bg_T23 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T23_ch2 <- bg_T23 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T23_ch3 <- bg_T23 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T23_ch4 <- bg_T23 |> 
  subset_data(from = 10, to = 330, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()


#  Trial 24 ----------------------------------------------------------
bg_T24 <- import_file("Respirometry data/Raw data/2022-10-24_090256_bg_T24/2022-10-24_090256_bg_T24.txt")
bg_T24$date_time_1 = dmy_hms(paste(bg_T24$`Date [A Ch.1 Main]`, bg_T24$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
bg_T24$date_time_2 = dmy_hms(paste(bg_T24$`Date [A Ch.2 Main]`, bg_T24$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
bg_T24$date_time_3 = dmy_hms(paste(bg_T24$`Date [A Ch.3 Main]`, bg_T24$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
bg_T24$date_time_4 = dmy_hms(paste(bg_T24$`Date [A Ch.4 Main]`, bg_T24$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


bg_T24$num_time_ch1 <- as.numeric(difftime(bg_T24[[81]], bg_T24[[1,81]], units = "secs")) 
bg_T24$num_time_ch2 <- as.numeric(difftime(bg_T24[[82]], bg_T24[[1,82]], units = "secs"))  
bg_T24$num_time_ch3 <- as.numeric(difftime(bg_T24[[83]], bg_T24[[1,83]], units = "secs"))  
bg_T24$num_time_ch4 <- as.numeric(difftime(bg_T24[[84]], bg_T24[[1,84]], units = "secs"))

bg_T24 <- select(bg_T24,
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
                 "date_time_4")

# Chamber 1
bg_T24_ch1 <- bg_T24 |> 
  subset_data(from = 10, to = 500, by = "row") |> 
  inspect(time= 2, oxygen =1) |> 
  calc_rate.bg() 

# Chamber 2
bg_T24_ch2 <- bg_T24 |> 
  subset_data(from = 10, to = 500, by = "row") |> 
  inspect(time= 5, oxygen =4) |> 
  calc_rate.bg() 
# Chamber 3
bg_T24_ch3 <- bg_T24 |> 
  subset_data(from = 10, to = 500, by = "row") |> 
  inspect(time= 8, oxygen =7) |> 
  calc_rate.bg() 
#chamber 4
bg_T24_ch4 <- bg_T24 |> 
  subset_data(from = 10, to = 500, by = "row") |> 
  inspect(time= 11, oxygen =10) |> 
  calc_rate.bg()

