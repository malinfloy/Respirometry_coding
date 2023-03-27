# function for background done after trial------
bg_cal <- function(data,start, end, oxygen)
{data |> 
    subset_data(from = start, to = end, by = "row") |> 
    inspect(time= 3, oxygen = oxygen) |> 
    calc_rate.bg()}

#  Background data after trials - flushing on for chamber 1 and 2 on. ----------------

bg_1 <- import_file("Respirometry_data/Raw data/2022-10-24_102444_background_end_1/2022-10-24_102444_background_end_1.txt")

bg_ch1 <- bg_1|> 
  inspect(time = 3, oxygen = 4) |> 
  calc_rate.bg()

bg_ch2 <- bg_1|> 
  inspect(time = 3, oxygen = 22) |> 
  calc_rate.bg()

#  Background data after trials - flushing on for chamber 3 and 4 on. -------------------------------------------------
bg_2 <- import_file("Respirometry_data/Raw data/2022-10-27_113153_bg_end2/2022-10-27_113153_bg_end2.txt") 

bg_ch3 <- bg_2|> 
  inspect(time = 3, oxygen = 40) |> 
  calc_rate.bg()

bg_ch4 <- bg_2|> 
  inspect(time = 3, oxygen = 58) |> 
  calc_rate.bg()


#  trial 5 -----------------------------------------------------------
bg_t5 <- import_file("Respirometry_data/Raw data/2022-10-05_084323_Bg_t5/2022-10-05_084323_Bg_t5.txt")

#chamber 1
bg_t5_ch1 <- bg_cal(bg_t5, 10, 330, 4)

# Chamber 2
bg_t5_ch2 <- bg_cal(bg_t5, 10,330,22)

# Chamber 3
bg_t5_ch3 <- bg_cal(bg_t5,10,330,40) 

#chamber 4
bg_t5_ch4 <- bg_cal(bg_t5,10,330,58)


#  trial 6 -----------------------------------------------------------
bg_t6 <- import_file("Respirometry_data/Raw data/2022-10-06_085243_bg_t6/2022-10-06_085243_bg_t6.txt")


# Chamber 1
bg_t6_ch1 <- bg_cal(bg_t6,10,330,4) 

# Chamber 2
bg_t6_ch2 <- bg_cal(bg_t6, 10,330,22)

# Chamber 3
bg_t6_ch3 <- bg_cal(bg_t6,10,330,40) 

#chamber 4
bg_t6_ch4 <- bg_cal(bg_t6,10,330,58)


#  trial 7 -----------------------------------------------------------
bg_t7 <- import_file("Respirometry_data/Raw data/2022-10-07_085341_bg_t7/2022-10-07_085341_bg_t7.txt")

# Chamber 1
bg_t7_ch1 <- bg_cal(bg_t7,10,330,4) 

# Chamber 2
bg_t7_ch2 <- bg_cal(bg_t7, 10,330,22)

# Chamber 3
bg_t7_ch3 <- bg_cal(bg_t7,10,330,40) 

#chamber 4
bg_t7_ch4 <- bg_cal(bg_t7,10,330,58)


#  trial 8 -----------------------------------------------------------
bg_t8 <- import_file("Respirometry_data/Raw data/2022-10-08_084625_bg_t8/2022-10-08_084625_bg_t8.txt")

# Chamber 1
bg_t8_ch1 <- bg_cal(bg_t8,10,330,4) 

# Chamber 2
bg_t8_ch2 <- bg_cal(bg_t8, 10,330,22)

# Chamber 3
bg_t8_ch3 <- bg_cal(bg_t8,10,330,40) 

#chamber 4
bg_t8_ch4 <- bg_cal(bg_t8,10,330,58)


#  trial 9 -----------------------------------------------------------
bg_t9 <- import_file("Respirometry_data/Raw data/2022-10-09_085346_bg_t9/2022-10-09_085346_bg_t9.txt")

# Chamber 1
bg_t9_ch1 <- bg_cal(bg_t9,10,430,4) 

# Chamber 2
bg_t9_ch2 <- bg_cal(bg_t9, 10,430,22)

# Chamber 3
bg_t9_ch3 <- bg_cal(bg_t9,10,430,40) 

#chamber 4
bg_t9_ch4 <- bg_cal(bg_t9,10,430,58)


#  trial 10-------------------------------- 
bg_t10 <- t10 |> 
  inspect(time = 3, oxygen = 58) |> 
  calc_rate.bg()

#  trial 11 ----------------------------------------------------------
bg_t11 <- import_file("Respirometry_data/Raw data/2022-10-11_084629_bg_t11/2022-10-11_084629_bg_t11.txt")

# Chamber 1
bg_t11_ch1 <- bg_cal(bg_t11,10,430,4) 

# Chamber 2
bg_t11_ch2 <- bg_cal(bg_t11, 10,430,22)

# Chamber 3
bg_t11_ch3 <- bg_cal(bg_t11,10,430,40) 

#chamber 4
bg_t11_ch4 <- bg_cal(bg_t11,10,430,58)


#  trial 12-----------------------------------------------------------
bg_t12 <- import_file("Respirometry_data/Raw data/2022-10-12_085044_bg_t12/2022-10-12_085044_bg_t12.txt")

# Chamber 1
bg_t12_ch1 <- bg_cal(bg_t12,10,700,4) 

# Chamber 2
bg_t12_ch2 <- bg_cal(bg_t12, 10,700,22)

# Chamber 3
bg_t12_ch3 <- bg_cal(bg_t12,10,700,40) 

#chamber 4
bg_t12_ch4 <- bg_cal(bg_t12,10,430,58)


#  trial 13 -------------------------------
# chamber 2 empty
bg_t13 <- t13 |> 
  inspect(time = 3, oxygen = 22) |> 
  calc_rate.bg()

#  trial 14-------------------------------
bg_t14 <- t14 |> 
  inspect(time = 3, oxygen = 22) |> 
  calc_rate.bg()

#  trial 15 ----------------------------------------------------------
bg_t15 <- import_file("Respirometry_data/Raw data/2022-10-15_085411_Bg_t15/2022-10-15_085411_Bg_t15.txt")

# Chamber 1
bg_t15_ch1 <- bg_cal(bg_t15,10,430,4) 

# Chamber 2
bg_t15_ch2 <- bg_cal(bg_t15, 10,430,22)

# Chamber 3
bg_t15_ch3 <- bg_cal(bg_t15,10,430,40) 

#chamber 4
bg_t15_ch4 <- bg_cal(bg_t15,10,430,58)

#  trial 16 ----------------------------------------------------------
bg_t16 <- import_file("Respirometry_data/Raw data/2022-10-16_085906_Bg_15_10_t16/2022-10-16_085906_Bg_15_10_t16.txt")

# Chamber 1
bg_t16_ch1 <- bg_cal(bg_t16,10,430,4) 

# Chamber 2
bg_t16_ch2 <- bg_cal(bg_t16, 10,430,22)

# Chamber 3
bg_t16_ch3 <- bg_cal(bg_t16,10,430,40) 

#chamber 4
bg_t16_ch4 <- bg_cal(bg_t16,10,430,58)

#  trial 17 ----
bg_t17 <- t17 |> 
  inspect(time = 3, oxygen = 58) |> 
  calc_rate.bg()

#  trial 18 ----------------------------------------------------------
bg_t18 <- import_file("Respirometry_data/Raw data/2022-10-18_090014_bg_t18/2022-10-18_090014_bg_t18.txt")

# Chamber 1
bg_t18_ch1 <- bg_cal(bg_t18,10,450,4) 

# Chamber 2
bg_t18_ch2 <- bg_cal(bg_t18, 10,450,22)

# Chamber 3
bg_t18_ch3 <- bg_cal(bg_t18,10,450,40) 

#chamber 4
bg_t18_ch4 <- bg_cal(bg_t18,10,450,58)


#  trial 19 ----------------------------------------------------------
bg_t19 <- import_file("Respirometry_data/Raw data/2022-10-19_085954_bg_t19/2022-10-19_085954_bg_t19.txt")
# Chamber 1
bg_t19_ch1 <- bg_cal(bg_t19,10,430,4) 

# Chamber 2
bg_t19_ch2 <- bg_cal(bg_t19, 10,430,22)

# Chamber 3
bg_t19_ch3 <- bg_cal(bg_t19,10,430,40) 

#chamber 4
bg_t19_ch4 <- bg_cal(bg_t19,10,430,58)


#  trial 20 ----------------------------------------------------------
bg_t20 <- import_file("Respirometry_data/Raw data/2022-10-20_120357_bg_t20/2022-10-20_120357_bg_t20.txt")

# Chamber 1
bg_t20_ch1 <- bg_cal(bg_t20,10,330,4) 

# Chamber 2
bg_t20_ch2 <- bg_cal(bg_t20, 10,330,22)

# Chamber 3
bg_t20_ch3 <- bg_cal(bg_t20,10,330,40) 

#chamber 4
bg_t20_ch4 <- bg_cal(bg_t20,10,330,58)


#  trial 21 ----------------------------------------------------------
bg_t21 <- import_file("Respirometry_data/Raw data/2022-10-21_090645_bg_t21/2022-10-21_090645_bg_t21.txt")

# Chamber 1
bg_t21_ch1 <- bg_cal(bg_t21,10,400,4) 

# Chamber 2
bg_t21_ch2 <- bg_cal(bg_t21, 10,400,22)

# Chamber 3
bg_t21_ch3 <- bg_cal(bg_t21,10,400,40) 

#chamber 4
bg_t21_ch4 <- bg_cal(bg_t21,10,400,58)


#  trial 22 ----------------------------------------------------------
bg_t22 <- import_file("Respirometry_data/Raw data/2022-10-22_103315_bg_t22/2022-10-22_103315_bg_t22.txt")

# Chamber 1
bg_t22_ch1 <- bg_cal(bg_t22,10,530,4) 

# Chamber 2
bg_t22_ch2 <- bg_cal(bg_t22, 10,530,22)

# Chamber 3
bg_t22_ch3 <- bg_cal(bg_t22,10,530,40) 

#chamber 4
bg_t22_ch4 <- bg_cal(bg_t22,10,530,58)


#  trial 23 ----------------------------------------------------------
bg_t23 <- import_file("Respirometry_data/Raw data/2022-10-23_090302_bg_t23/2022-10-23_090302_bg_t23.txt")
# Chamber 1
bg_t23_ch1 <- bg_cal(bg_t23,10,330,4) 

# Chamber 2
bg_t23_ch2 <- bg_cal(bg_t23, 10,330,22)

# Chamber 3
bg_t23_ch3 <- bg_cal(bg_t23,10,330,40) 

#chamber 4
bg_t23_ch4 <- bg_cal(bg_t15,10,430,58)


#  trial 24 ----------------------------------------------------------
bg_t24 <- import_file("Respirometry_data/Raw data/2022-10-24_090256_bg_t24/2022-10-24_090256_bg_t24.txt")

# Chamber 1
bg_t24_ch1 <- bg_cal(bg_t24,10,500,4) 

# Chamber 2
bg_t24_ch2 <- bg_cal(bg_t24, 10,500,22)

# Chamber 3
bg_t24_ch3 <- bg_cal(bg_t24,10,500,40) 

#chamber 4
bg_t24_ch4 <- bg_cal(bg_t24,10,500,58)

