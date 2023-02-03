library(respR)
library(readxl)
library(lubridate)

#raw file import + cleaning -> individual measuments ---------------------------------------------------------------

Raw_resp <- read_xlsx("Respirometry data\\Respirometry_data.xlsx") # må fikses


# Trial 1 ---------------------------------------------------------------------------------------------------
trial1 <- import_file("Respirometry data/Raw data/30_09_T1/2022-09-30_102340_30_09_T1.txt")

trial1$date_time_1 = dmy_hms(paste(trial1$`Date [A Ch.1 Main]`, trial1$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial1$date_time_2 = dmy_hms(paste(trial1$`Date [A Ch.2 Main]`, trial1$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial1$date_time_3 = dmy_hms(paste(trial1$`Date [A Ch.3 Main]`, trial1$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial1$date_time_4 = dmy_hms(paste(trial1$`Date [A Ch.4 Main]`, trial1$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial1$num_time_ch1 <- as.numeric(difftime(trial1[[81]], trial1[[1,81]], units = "secs")) 
trial1$num_time_ch2 <- as.numeric(difftime(trial1[[82]], trial1[[1,82]], units = "secs"))  
trial1$num_time_ch3 <- as.numeric(difftime(trial1[[83]], trial1[[1,83]], units = "secs"))  
trial1$num_time_ch4 <- as.numeric(difftime(trial1[[84]], trial1[[1,84]], units = "secs"))

t1 <- select(trial1,
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

# Trial 2 ----------------------------------------------------------------------------------------------------

trial2 <- import_file("Respirometry data/Raw data/2022-10-01_101553_01_10_T2/2022-10-01_101553_01_10_T2.txt")

trial2$date_time_1 = dmy_hms(paste(trial2$`Date [A Ch.1 Main]`, trial2$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial2$date_time_2 = dmy_hms(paste(trial2$`Date [A Ch.2 Main]`, trial2$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial2$date_time_3 = dmy_hms(paste(trial2$`Date [A Ch.3 Main]`, trial2$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial2$date_time_4 = dmy_hms(paste(trial2$`Date [A Ch.4 Main]`, trial2$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial2$num_time_ch1 <- as.numeric(difftime(trial2[[81]], trial2[[1,81]], units = "secs")) 
trial2$num_time_ch2 <- as.numeric(difftime(trial2[[82]], trial2[[1,82]], units = "secs"))  
trial2$num_time_ch3 <- as.numeric(difftime(trial2[[83]], trial2[[1,83]], units = "secs"))  
trial2$num_time_ch4 <- as.numeric(difftime(trial2[[84]], trial2[[1,84]], units = "secs"))

t2 <- select(trial2,
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
  
inspect(time = 2, oxyge = c(1,3,5,7))  # can I do this? inspect with only one time???

# trial 3 -----------------------------------------------------------------------------------------------------
trial3 <- import_file() # må ta inn alle 4 kanaler enkle

# trial 4 -----------------------------------------------------------------------------------------------------
trial4 <- # to filer enf ra 9-14 og 14-dagen etterpå
  
# trial 5 -------------------------------------------------------------------------------------------------------

trial5 <- import_file("Respirometry data/Raw data/2022-10-04_102546_04_10_T5/2022-10-04_102546_04_10_T5.txt")

trial5$date_time_1 = dmy_hms(paste(trial5$`Date [A Ch.1 Main]`, trial5$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial5$date_time_2 = dmy_hms(paste(trial5$`Date [A Ch.2 Main]`, trial5$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial5$date_time_3 = dmy_hms(paste(trial5$`Date [A Ch.3 Main]`, trial5$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial5$date_time_4 = dmy_hms(paste(trial5$`Date [A Ch.4 Main]`, trial5$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial5$num_time_ch1 <- as.numeric(difftime(trial5[[81]], trial5[[1,81]], units = "secs")) 
trial5$num_time_ch2 <- as.numeric(difftime(trial5[[82]], trial5[[1,82]], units = "secs"))  
trial5$num_time_ch3 <- as.numeric(difftime(trial5[[83]], trial5[[1,83]], units = "secs"))  
trial5$num_time_ch4 <- as.numeric(difftime(trial5[[84]], trial5[[1,84]], units = "secs"))

t5 <- select(trial5,
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


# trial 6 ----------------------------------------------------------------------------------------------------------

trial6 <- import_file("Respirometry data/Raw data/2022-10-05_102103_05_10_T6/2022-10-05_102103_05_10_T6.txt")

trial6$date_time_1 = dmy_hms(paste(trial6$`Date [A Ch.1 Main]`, trial6$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial6$date_time_2 = dmy_hms(paste(trial6$`Date [A Ch.2 Main]`, trial6$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial6$date_time_3 = dmy_hms(paste(trial6$`Date [A Ch.3 Main]`, trial6$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial6$date_time_4 = dmy_hms(paste(trial6$`Date [A Ch.4 Main]`, trial6$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial6$num_time_ch1 <- as.numeric(difftime(trial6[[81]], trial6[[1,81]], units = "secs")) 
trial6$num_time_ch2 <- as.numeric(difftime(trial6[[82]], trial6[[1,82]], units = "secs"))  
trial6$num_time_ch3 <- as.numeric(difftime(trial6[[83]], trial6[[1,83]], units = "secs"))  
trial6$num_time_ch4 <- as.numeric(difftime(trial6[[84]], trial6[[1,84]], units = "secs"))

t6 <- select(trial6,
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

# trial 7 -----------------------------------------------------------------------------------------------------

trial7 <- import_file("Respirometry data/Raw data/2022-10-06_101914_06_10_T7/2022-10-06_101914_06_10_T7.txt")

trial7$date_time_1 = dmy_hms(paste(trial7$`Date [A Ch.1 Main]`, trial7$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial7$date_time_2 = dmy_hms(paste(trial7$`Date [A Ch.2 Main]`, trial7$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial7$date_time_3 = dmy_hms(paste(trial7$`Date [A Ch.3 Main]`, trial7$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial7$date_time_4 = dmy_hms(paste(trial7$`Date [A Ch.4 Main]`, trial7$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial7$num_time_ch1 <- as.numeric(difftime(trial7[[81]], trial7[[1,81]], units = "secs")) 
trial7$num_time_ch2 <- as.numeric(difftime(trial7[[82]], trial7[[1,82]], units = "secs"))  
trial7$num_time_ch3 <- as.numeric(difftime(trial7[[83]], trial7[[1,83]], units = "secs"))  
trial7$num_time_ch4 <- as.numeric(difftime(trial7[[84]], trial7[[1,84]], units = "secs"))

t7 <- select(trial7,
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

# trial 8 --------------------------------------------------------------------------------------------------------------
trial8 <- import_file("Respirometry data/Raw data/2022-10-07_102622_07_10_T8/2022-10-07_102622_07_10_T8.txt") 

trial8$date_time_1 = dmy_hms(paste(trial8$`Date [A Ch.1 Main]`, trial8$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial8$date_time_2 = dmy_hms(paste(trial8$`Date [A Ch.2 Main]`, trial8$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial8$date_time_3 = dmy_hms(paste(trial8$`Date [A Ch.3 Main]`, trial8$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial8$date_time_4 = dmy_hms(paste(trial8$`Date [A Ch.4 Main]`, trial8$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial8$num_time_ch1 <- as.numeric(difftime(trial8[[81]], trial8[[1,81]], units = "secs")) 
trial8$num_time_ch2 <- as.numeric(difftime(trial8[[82]], trial8[[1,82]], units = "secs"))  
trial8$num_time_ch3 <- as.numeric(difftime(trial8[[83]], trial8[[1,83]], units = "secs"))  
trial8$num_time_ch4 <- as.numeric(difftime(trial8[[84]], trial8[[1,84]], units = "secs"))

t8 <- select(trial8,
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

# Trial 9 ----------------------------------------------------------------------------------------------------------------
trial9 <- import_file("Respirometry data/Raw data/2022-10-08_101416_08_10_T9/2022-10-08_101416_08_10_T9.txt")

trial9$date_time_1 = dmy_hms(paste(trial9$`Date [A Ch.1 Main]`, trial9$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial9$date_time_2 = dmy_hms(paste(trial9$`Date [A Ch.2 Main]`, trial9$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial9$date_time_3 = dmy_hms(paste(trial9$`Date [A Ch.3 Main]`, trial9$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial9$date_time_4 = dmy_hms(paste(trial9$`Date [A Ch.4 Main]`, trial9$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial9$num_time_ch1 <- as.numeric(difftime(trial9[[81]], trial9[[1,81]], units = "secs")) 
trial9$num_time_ch2 <- as.numeric(difftime(trial9[[82]], trial9[[1,82]], units = "secs"))  
trial9$num_time_ch3 <- as.numeric(difftime(trial9[[83]], trial9[[1,83]], units = "secs"))  
trial9$num_time_ch4 <- as.numeric(difftime(trial9[[84]], trial9[[1,84]], units = "secs"))

t9 <- select(trial9,
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

# Trial 10 -----------------------------------------------------------------------------------------------------------------
trial10 <- import_file("Respirometry data/Raw data/2022-10-09_103212_09_10_T10/2022-10-09_103212_09_10_T10.txt")

trial10$date_time_1 = dmy_hms(paste(trial10$`Date [A Ch.1 Main]`, trial10$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial10$date_time_2 = dmy_hms(paste(trial10$`Date [A Ch.2 Main]`, trial10$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial10$date_time_3 = dmy_hms(paste(trial10$`Date [A Ch.3 Main]`, trial10$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial10$date_time_4 = dmy_hms(paste(trial10$`Date [A Ch.4 Main]`, trial10$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial10$num_time_ch1 <- as.numeric(difftime(trial10[[81]], trial10[[1,81]], units = "secs")) 
trial10$num_time_ch2 <- as.numeric(difftime(trial10[[82]], trial10[[1,82]], units = "secs"))  
trial10$num_time_ch3 <- as.numeric(difftime(trial10[[83]], trial10[[1,83]], units = "secs"))  
trial10$num_time_ch4 <- as.numeric(difftime(trial10[[84]], trial10[[1,84]], units = "secs"))

t10 <- select(trial10,
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

# Trial 11 ---------------------------------------------------------------------------------------------------------------
trial11 <- import_file("Respirometry data/Raw data/2022-10-10_100338_10_10_T11/2022-10-10_100338_10_10_T11.txt")

trial11$date_time_1 = dmy_hms(paste(trial11$`Date [A Ch.1 Main]`, trial11$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial11$date_time_2 = dmy_hms(paste(trial11$`Date [A Ch.2 Main]`, trial11$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial11$date_time_3 = dmy_hms(paste(trial11$`Date [A Ch.3 Main]`, trial11$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial11$date_time_4 = dmy_hms(paste(trial11$`Date [A Ch.4 Main]`, trial11$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial11$num_time_ch1 <- as.numeric(difftime(trial11[[81]], trial11[[1,81]], units = "secs")) 
trial11$num_time_ch2 <- as.numeric(difftime(trial11[[82]], trial11[[1,82]], units = "secs"))  
trial11$num_time_ch3 <- as.numeric(difftime(trial11[[83]], trial11[[1,83]], units = "secs"))  
trial11$num_time_ch4 <- as.numeric(difftime(trial11[[84]], trial11[[1,84]], units = "secs"))

t11 <- select(trial11,
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

# Trial 12 -----------------------------------------------------------------------------------------------------------
trial12 <- import_file("Respirometry data/Raw data/2022-10-11_101650_11_10_T12/2022-10-11_101650_11_10_T12.txt")

trial12$date_time_1 = dmy_hms(paste(trial12$`Date [A Ch.1 Main]`, trial12$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial12$date_time_2 = dmy_hms(paste(trial12$`Date [A Ch.2 Main]`, trial12$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial12$date_time_3 = dmy_hms(paste(trial12$`Date [A Ch.3 Main]`, trial12$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial12$date_time_4 = dmy_hms(paste(trial12$`Date [A Ch.4 Main]`, trial12$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial12$num_time_ch1 <- as.numeric(difftime(trial12[[81]], trial12[[1,81]], units = "secs")) 
trial12$num_time_ch2 <- as.numeric(difftime(trial12[[82]], trial12[[1,82]], units = "secs"))  
trial12$num_time_ch3 <- as.numeric(difftime(trial12[[83]], trial12[[1,83]], units = "secs"))  
trial12$num_time_ch4 <- as.numeric(difftime(trial12[[84]], trial12[[1,84]], units = "secs"))

t12 <- select(trial12,
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

# trial 13 -------------------------------------------------------------------------------------------------------------
trial13 <- import_file("Respirometry data/Raw data/2022-10-12_103806_12_10_T13/2022-10-12_103806_12_10_T13.txt")

trial13$date_time_1 = dmy_hms(paste(trial13$`Date [A Ch.1 Main]`, trial13$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial13$date_time_2 = dmy_hms(paste(trial13$`Date [A Ch.2 Main]`, trial13$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial13$date_time_3 = dmy_hms(paste(trial13$`Date [A Ch.3 Main]`, trial13$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial13$date_time_4 = dmy_hms(paste(trial13$`Date [A Ch.4 Main]`, trial13$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial13$num_time_ch1 <- as.numeric(difftime(trial13[[81]], trial13[[1,81]], units = "secs")) 
trial13$num_time_ch2 <- as.numeric(difftime(trial13[[82]], trial13[[1,82]], units = "secs"))  
trial13$num_time_ch3 <- as.numeric(difftime(trial13[[83]], trial13[[1,83]], units = "secs"))  
trial13$num_time_ch4 <- as.numeric(difftime(trial13[[84]], trial13[[1,84]], units = "secs"))

t13 <- select(trial13,
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

# trial 14 ------------------------------------------------------------------------------------------------------------
trial14 <- import_file("Respirometry data/Raw data/2022-10-13_102251_13_10_T14/2022-10-13_102251_13_10_T14.txt")

trial14$date_time_1 = dmy_hms(paste(trial14$`Date [A Ch.1 Main]`, trial14$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial14$date_time_2 = dmy_hms(paste(trial14$`Date [A Ch.2 Main]`, trial14$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial14$date_time_3 = dmy_hms(paste(trial14$`Date [A Ch.3 Main]`, trial14$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial14$date_time_4 = dmy_hms(paste(trial14$`Date [A Ch.4 Main]`, trial14$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial14$num_time_ch1 <- as.numeric(difftime(trial14[[81]], trial14[[1,81]], units = "secs")) 
trial14$num_time_ch2 <- as.numeric(difftime(trial14[[82]], trial14[[1,82]], units = "secs"))  
trial14$num_time_ch3 <- as.numeric(difftime(trial14[[83]], trial14[[1,83]], units = "secs"))  
trial14$num_time_ch4 <- as.numeric(difftime(trial14[[84]], trial14[[1,84]], units = "secs"))

t14 <- select(trial14,
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

# trial 15 -----------------------------------------------------------------------------------------------------------
trial15 <- import_file("Respirometry data/Raw data/2022-10-14_101541_14_10_T15/2022-10-14_101541_14_10_T15.txt")

trial15$date_time_1 = dmy_hms(paste(trial15$`Date [A Ch.1 Main]`, trial15$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial15$date_time_2 = dmy_hms(paste(trial15$`Date [A Ch.2 Main]`, trial15$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial15$date_time_3 = dmy_hms(paste(trial15$`Date [A Ch.3 Main]`, trial15$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial15$date_time_4 = dmy_hms(paste(trial15$`Date [A Ch.4 Main]`, trial15$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial15$num_time_ch1 <- as.numeric(difftime(trial15[[81]], trial15[[1,81]], units = "secs")) 
trial15$num_time_ch2 <- as.numeric(difftime(trial15[[82]], trial15[[1,82]], units = "secs"))  
trial15$num_time_ch3 <- as.numeric(difftime(trial15[[83]], trial15[[1,83]], units = "secs"))  
trial15$num_time_ch4 <- as.numeric(difftime(trial15[[84]], trial15[[1,84]], units = "secs"))

t15 <- select(trial15,
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

# trial 16 ---------------------------------------------------------------------------------------------------------------
trial16 <- import_file("Respirometry data/Raw data/2022-10-15_103724_15_10_T16/2022-10-15_103724_15_10_T16.txt")

trial16$date_time_1 = dmy_hms(paste(trial16$`Date [A Ch.1 Main]`, trial16$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial16$date_time_2 = dmy_hms(paste(trial16$`Date [A Ch.2 Main]`, trial16$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial16$date_time_3 = dmy_hms(paste(trial16$`Date [A Ch.3 Main]`, trial16$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial16$date_time_4 = dmy_hms(paste(trial16$`Date [A Ch.4 Main]`, trial16$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial16$num_time_ch1 <- as.numeric(difftime(trial16[[81]], trial16[[1,81]], units = "secs")) 
trial16$num_time_ch2 <- as.numeric(difftime(trial16[[82]], trial16[[1,82]], units = "secs"))  
trial16$num_time_ch3 <- as.numeric(difftime(trial16[[83]], trial16[[1,83]], units = "secs"))  
trial16$num_time_ch4 <- as.numeric(difftime(trial16[[84]], trial16[[1,84]], units = "secs"))

t16 <- select(trial16,
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

# Trial 17 --------------------------------------------------------------------------------------------------------------
trial17 <- import_file("Respirometry data/Raw data/2022-10-16_114121_16_10_T17/2022-10-16_114121_16_10_T17.txt")

trial17$date_time_1 = dmy_hms(paste(trial17$`Date [A Ch.1 Main]`, trial17$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial17$date_time_2 = dmy_hms(paste(trial17$`Date [A Ch.2 Main]`, trial17$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial17$date_time_3 = dmy_hms(paste(trial17$`Date [A Ch.3 Main]`, trial17$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial17$date_time_4 = dmy_hms(paste(trial17$`Date [A Ch.4 Main]`, trial17$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial17$num_time_ch1 <- as.numeric(difftime(trial17[[81]], trial17[[1,81]], units = "secs")) 
trial17$num_time_ch2 <- as.numeric(difftime(trial17[[82]], trial17[[1,82]], units = "secs"))  
trial17$num_time_ch3 <- as.numeric(difftime(trial17[[83]], trial17[[1,83]], units = "secs"))  
trial17$num_time_ch4 <- as.numeric(difftime(trial17[[84]], trial17[[1,84]], units = "secs"))

t17 <- select(trial17,
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

# Trial 18 ------------------------------------------------------------------------------------------------------------
trial18 <- import_file("Respirometry data/Raw data/2022-10-17_103745_17_10_T18/2022-10-17_103745_17_10_T18.txt")

trial18$date_time_1 = dmy_hms(paste(trial18$`Date [A Ch.1 Main]`, trial18$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial18$date_time_2 = dmy_hms(paste(trial18$`Date [A Ch.2 Main]`, trial18$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial18$date_time_3 = dmy_hms(paste(trial18$`Date [A Ch.3 Main]`, trial18$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial18$date_time_4 = dmy_hms(paste(trial18$`Date [A Ch.4 Main]`, trial18$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial18$num_time_ch1 <- as.numeric(difftime(trial18[[81]], trial18[[1,81]], units = "secs")) 
trial18$num_time_ch2 <- as.numeric(difftime(trial18[[82]], trial18[[1,82]], units = "secs"))  
trial18$num_time_ch3 <- as.numeric(difftime(trial18[[83]], trial18[[1,83]], units = "secs"))  
trial18$num_time_ch4 <- as.numeric(difftime(trial18[[84]], trial18[[1,84]], units = "secs"))

t18 <- select(trial18,
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

# Trial 19 --------------------------------------------------------------------------------------------------------------------
trial19 <- import_file("Respirometry data/Raw data/2022-10-18_125922_18_10_T19/2022-10-18_125922_18_10_T19.txt")

trial19$date_time_1 = dmy_hms(paste(trial19$`Date [A Ch.1 Main]`, trial19$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial19$date_time_2 = dmy_hms(paste(trial19$`Date [A Ch.2 Main]`, trial19$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial19$date_time_3 = dmy_hms(paste(trial19$`Date [A Ch.3 Main]`, trial19$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial19$date_time_4 = dmy_hms(paste(trial19$`Date [A Ch.4 Main]`, trial19$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial19$num_time_ch1 <- as.numeric(difftime(trial19[[81]], trial19[[1,81]], units = "secs")) 
trial19$num_time_ch2 <- as.numeric(difftime(trial19[[82]], trial19[[1,82]], units = "secs"))  
trial19$num_time_ch3 <- as.numeric(difftime(trial19[[83]], trial19[[1,83]], units = "secs"))  
trial19$num_time_ch4 <- as.numeric(difftime(trial19[[84]], trial19[[1,84]], units = "secs"))

t19 <- select(trial19,
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

# Trial 20 ------------------------------------------------------------------------------------------------------------
trial20 <- import_file("Respirometry data/Raw data/2022-10-19_102436_19_10_T20/2022-10-19_102436_19_10_T20.txt")

trial20$date_time_1 = dmy_hms(paste(trial20$`Date [A Ch.1 Main]`, trial20$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial20$date_time_2 = dmy_hms(paste(trial20$`Date [A Ch.2 Main]`, trial20$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial20$date_time_3 = dmy_hms(paste(trial20$`Date [A Ch.3 Main]`, trial20$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial20$date_time_4 = dmy_hms(paste(trial20$`Date [A Ch.4 Main]`, trial20$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial20$num_time_ch1 <- as.numeric(difftime(trial20[[81]], trial20[[1,81]], units = "secs")) 
trial20$num_time_ch2 <- as.numeric(difftime(trial20[[82]], trial20[[1,82]], units = "secs"))  
trial20$num_time_ch3 <- as.numeric(difftime(trial20[[83]], trial20[[1,83]], units = "secs"))  
trial20$num_time_ch4 <- as.numeric(difftime(trial20[[84]], trial20[[1,84]], units = "secs"))

t20 <- select(trial20,
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


#Trial 21 ----------------------------------------------------------------------------------------------------------------------------------.
trial21 <- import_file # 2 filer, den første inneholder kun litt av MMR normoxia

# Trial 22 ------------------------------------------------------------------------------------------------------------------------------------
trial22 <- import_file() # to filer her også

# Trial 23 -----------------------------------------------------------------------------------------------------------------
trial23 <- import_file("Respirometry data/Raw data/2022-10-22_120302_22_10_T23/2022-10-22_120302_22_10_T23.txt")

trial23$date_time_1 = dmy_hms(paste(trial23$`Date [A Ch.1 Main]`, trial23$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial23$date_time_2 = dmy_hms(paste(trial23$`Date [A Ch.2 Main]`, trial23$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial23$date_time_3 = dmy_hms(paste(trial23$`Date [A Ch.3 Main]`, trial23$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial23$date_time_4 = dmy_hms(paste(trial23$`Date [A Ch.4 Main]`, trial23$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial23$num_time_ch1 <- as.numeric(difftime(trial23[[81]], trial23[[1,81]], units = "secs")) 
trial23$num_time_ch2 <- as.numeric(difftime(trial23[[82]], trial23[[1,82]], units = "secs"))  
trial23$num_time_ch3 <- as.numeric(difftime(trial23[[83]], trial23[[1,83]], units = "secs"))  
trial23$num_time_ch4 <- as.numeric(difftime(trial23[[84]], trial23[[1,84]], units = "secs"))

t23 <- select(trial23,
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

# Trial 24--------------------------------------------------------------------------------------------------------
trial24 <- import_file("Respirometry data/Raw data/2022-10-23_103422_23_10_T24/2022-10-23_103422_23_10_T24.txt")

trial24$date_time_1 = dmy_hms(paste(trial24$`Date [A Ch.1 Main]`, trial24$`Time [A Ch.1 Main]`)) |>   
  round_date("sec")
trial24$date_time_2 = dmy_hms(paste(trial24$`Date [A Ch.2 Main]`, trial24$`Time [A Ch.2 Main]`)) |> 
  round_date("sec")
trial24$date_time_3 = dmy_hms(paste(trial24$`Date [A Ch.3 Main]`, trial24$`Time [A Ch.3 Main]`)) |> 
  round_date("sec")
trial24$date_time_4 = dmy_hms(paste(trial24$`Date [A Ch.4 Main]`, trial24$`Time [A Ch.4 Main]`)) |> 
  round_date("sec")


trial24$num_time_ch1 <- as.numeric(difftime(trial24[[81]], trial24[[1,81]], units = "secs")) 
trial24$num_time_ch2 <- as.numeric(difftime(trial24[[82]], trial24[[1,82]], units = "secs"))  
trial24$num_time_ch3 <- as.numeric(difftime(trial24[[83]], trial24[[1,83]], units = "secs"))  
trial24$num_time_ch4 <- as.numeric(difftime(trial24[[84]], trial24[[1,84]], units = "secs"))

t24 <- select(trial24,
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



