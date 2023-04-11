library(respR)
library(readxl)
library(lubridate)

#raw file import + cleaning -> individual measuments ---------------------------------------------------------------

Raw_data <- read_xlsx("Respirometry_data/Respirometry_data.xlsx") # må fikses

# Trial 1
t1 <- import_file("Respirometry_data/Raw data/30_09_T1/2022-09-30_102340_30_09_T1.txt") 

    


# Trial 2

t2 <- import_file("Respirometry_data/Raw data/2022-10-01_101553_01_10_T2/2022-10-01_101553_01_10_T2.txt")|> 
  format_time(time = 1:2, format = "dmyHMS") |> 
    mutate(across(c('time_num'), round, 1))  # incase i want this, this works

# trial 3
t3 <- import_file("Respirometry_data/Raw data/2022-10-02_102759_02_10_T3/t3_allchamber.txt") 
t3_hypommr <- import_file("Respirometry_data/Raw data/2022-10-03_081328_02_10_T3_HMMR/2022-10-03_081328_02_10_T3_HMMR.txt")


# trial 4
t4 <- import_file("Respirometry_data/Raw data/2022-10-03_101859_03_10_T4/T4.txt")
  
# trial 5

t5 <- import_file("Respirometry_data/Raw data/2022-10-04_102546_04_10_T5/2022-10-04_102546_04_10_T5.txt") 

# trial 6

t6 <- import_file("Respirometry_data/Raw data/2022-10-05_102103_05_10_T6/2022-10-05_102103_05_10_T6.txt")

# trial 7

t7 <- import_file("Respirometry_data/Raw data/2022-10-06_101914_06_10_T7/2022-10-06_101914_06_10_T7.txt")

# trial 8
t8 <- import_file("Respirometry_data/Raw data/2022-10-07_102622_07_10_T8/2022-10-07_102622_07_10_T8.txt") 

# Trial 9
t9 <- import_file("Respirometry_data/Raw data/2022-10-08_101416_08_10_T9/2022-10-08_101416_08_10_T9.txt")

# Trial 10
t10 <- import_file("Respirometry_data/Raw data/2022-10-09_103212_09_10_T10/2022-10-09_103212_09_10_T10.txt")

# Trial 11
t11 <- import_file("Respirometry_data/Raw data/2022-10-10_100338_10_10_T11/2022-10-10_100338_10_10_T11.txt")

# Trial 12
t12 <- import_file("Respirometry_data/Raw data/2022-10-11_101650_11_10_T12/2022-10-11_101650_11_10_T12.txt")

# trial 13
t13 <- import_file("Respirometry_data/Raw data/2022-10-12_103806_12_10_T13/2022-10-12_103806_12_10_T13.txt")


# trial 14
t14 <- import_file("Respirometry_data/Raw data/2022-10-13_102251_13_10_T14/2022-10-13_102251_13_10_T14.txt")

# trial 15
t15 <- import_file("Respirometry_data/Raw data/2022-10-14_101541_14_10_T15/2022-10-14_101541_14_10_T15.txt")

# trial 16
t16 <- import_file("Respirometry_data/Raw data/2022-10-15_103724_15_10_T16/2022-10-15_103724_15_10_T16.txt")

# Trial 17
t17 <- import_file("Respirometry_data/Raw data/2022-10-16_114121_16_10_T17/2022-10-16_114121_16_10_T17.txt")

# Trial 18
t18 <- import_file("Respirometry_data/Raw data/2022-10-17_103745_17_10_T18/2022-10-17_103745_17_10_T18.txt")

# Trial 19
t19 <- import_file("Respirometry_data/Raw data/2022-10-18_125922_18_10_T19/2022-10-18_125922_18_10_T19.txt")

# Trial 20
t20 <- import_file("Respirometry_data/Raw data/2022-10-19_102436_19_10_T20/2022-10-19_102436_19_10_T20.txt")

#Trial 21
t21 <- import_file("Respirometry_data/Raw data/2022-10-20_133810_20_10_T21/2022-10-20_133810_20_10_T21.txt")

# Trial 22
t22 <- import_file("Respirometry_data/Raw data/2022-10-21_103904_21_10_T22/2022-10-21_103904_21_10_T22.txt") 

t22_hypo<- import_file("Respirometry_data/Raw data/2022-10-22_082320_Hypoxia_21_10_T22/2022-10-22_082320_Hypoxia_21_10_T22.txt")

# Trial 23
t23 <- import_file("Respirometry_data/Raw data/2022-10-22_120302_22_10_T23/2022-10-22_120302_22_10_T23.txt")

# Trial 24
t24 <- import_file("Respirometry_data/Raw data/2022-10-23_103422_23_10_T24/2022-10-23_103422_23_10_T24.txt")




