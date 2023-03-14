#MMR for all individuals of intermitten-flow repsirometry - hypoxia
# function for mmr under normoxia

mmr_h_func <-function(data,start,end,oxygen,plot_width,id,from,to,from1, 
                      rate_width,bg,v,t,m, ...)
{rep_1 <- subset_data(data,
                      from = start,
                      to = end, 
                      by = "row") |> 
  inspect(time= 3, oxygen = oxygen) |> 
  plot(width = plot_width) 

id <- rep_1 |> 
  # subset first replicate
  subset_data(from = from, 
              to = to,  
              by = "row") |>                
  # subset again to apply a 'wait' period
  subset_data(from = from1, 
              by = "row") |>                
  # use auto_rate to get most linear regions
  auto_rate(width = rate_width) |>
  # adjust
  adjust_rate(by = bg, 
              method = "value") |>
  # convert
  convert_rate(oxy.unit = "%Air", 
               time.unit = "secs", 
               output.unit = "mg/h/g", 
               volume = v, 
               t =t, S = 0, 
               mass = m) |>            
  # select highest rate
  select_rate(method = "highest", 
              n = 1) |>                      
  summary(export = TRUE)
}

#needs to be fixed, wrong bg!! trial 1-4!!! now without bg!!!! and t10,13,14,17,21,22

# Trial 1----------------------------------------------------
#chamber 1 2ml
Hmmr_2ml <- mmr_h_func(t1,39479,39479 + 600,4,0.15,Hmmr_2ml, 
                       30,450,30,0.15,
                       0.05643,25.1,0.00014)
# Chamber 2 2mg 
Hmmr_2mg <- mmr_h_func(data = t1,start = 39809,end = 39809 + 450,oxygen = 22,plot_widt=0.15,
                       id= Hmmr_2mg, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05760,t=25.1,m=0.00007)


# Chamber 3 2fg 
Hmmr_2fg <- mmr_h_func(data = t1,start = 39659,end = 39659 + 600,oxygen = 40,plot_widt=0.2,
                       id= Hmmr_2fg, from= 30,to= 450,from1 =30,rate_width=0.2,
                       v=0.05908,t=25.1,m=0.00025)

# chamber 4 2fl 
Hmmr_2fl <- mmr_h_func(data = t1,start = 39329,end = 39329 + 600,oxygen = 58,plot_widt=0.2,
                       id= Hmmr_2fg, from= 60,to= 450,from1 =60,rate_width=0.2,
                       v=0.05982,t=25.2,m=0.00051)

# MMR Trial 2-----------------------------------------------
# Chamber 1 2mp
Hmmr_2mp <- mmr_h_func(data = t2,start = 40078,end = 40078 + 600,oxygen = 4,plot_widt=0.15,
                       id= Hmmr_2mp, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05644,t=25.1,m=0.00013)
# Chamber 2 2mb 
Hmmr_2mb <- mmr_h_func(data = t2,start = 40438,end = 40438 + 570,oxygen = 22,plot_widt=0.15,
                       id= Hmmr_2mb, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05758,t=25.1,m=0.00009)

# chamber 3 2fb 
Hmmr_2fb <- mmr_h_func(data = t2,start = 40198,end = 40198 + 600,oxygen = 40,plot_widt=0.2,
                       id= Hmmr_2fb, from= 30,to= 450,from1 =30,rate_width=0.2,
                       v=0.05889,t=25.1,m=0.00044)

# Chamber 4 2fp 
Hmmr_2fp <- mmr_h_func(data = t2,start = 40558,end = 40558 + 450,oxygen = 58,plot_widt=0.2,
                       id= Hmmr_2fp, from= 60,to= 450,from1 =60,rate_width=0.2,
                       v=0.05988,t=25.1,m=0.00045)

# MMR Trial 3--------------------------------------------------------

# MMR Trial 4--------------------------------------------------------

# MMR Trial 5----------------------------------------------------------------
# Chamber 1 7ml
Hmmr_7ml <- mmr_h_func(data = t5,start = 39154,end = 39154 + 870,oxygen = 4,plot_widt=0.15,
                       id= Hmmr_7ml, from= 30,to= 450,from1 =30,rate_width=0.15,bg =bg_t5_ch1,
                       v=0.05646,t=25,m=0.00011)

# Chamber 2 7Mb
Hmmr_7mb <- mmr_h_func(data = t5,start = 39214,end = 39214 + 810,oxygen = 22,plot_widt=0.15,
                       id= Hmmr_7mb, from= 30,to= 450,from1 =30,rate_width=0.15,bg= bg_t5_ch2,
                       v=0.05753,t=25,m=0.00014)


# Chamber 3 7fb
Hmmr_7fb <- mmr_h_func(data = t5,start = 39514,end = 39514 + 510,oxygen = 40,plot_widt=0.2,
                       id= Hmmr_7fb, from= 30,to= 450,from1 =30,rate_width=0.2, bg= bg_t5_ch3,
                       v=0.05912,t=25,m=0.00021)

# chamber 4 7fp
Hmmr_7fp <- mmr_h_func(data = t5,start = 39574,end = 39574 + 450,oxygen = 58,plot_widt= 0.2,
                       id= Hmmr_7fp, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg= bg_t5_ch4,
                       v= 0.05967,t= 25,m= 0.00066)

# MMR Trial 6----------------------------------------------------
# Chamber 1 7mp
Hmmr_7mp <- mmr_h_func(data = t6,start = 39505,end = 39505 +  930,oxygen = 4,plot_widt= 0.15,
                       id= Hmmr_7mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg = bg_t6_ch1,
                       v= 0.05640,t= 25.3,m= 0.00017)

# Chamber 2 7Mg
Hmmr_7mg <- mmr_h_func(data = t6,start = 39595,end = 39595 + 840,oxygen = 22,plot_widt= 0.15,
                       id= Hmmr_7mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg=bg_t6_ch2,
                       v= 0.05753,t= 25.3,m= 0.00014)
# Chamber 3 7FL
Hmmr_7fl <- mmr_h_func(data = t6,start = 39865,end = 39865 + 570,oxygen = 40,plot_widt= 0.2,
                       id= Hmmr_7fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg=bg_t6_ch3,
                       v= 0.05888,t= 25.3,m= 0.00045)

# chamber 4 7fg

Hmmr_7fg <- mmr_h_func(data = t6,start = 39955,end = 39955 + 600,oxygen = 58,plot_widt= 0.2,
                       id= Hmmr_7fg, from= 60,to= 300,from1 = 60,rate_width= 0.2,bg =bg_t6_ch4,
                       v= 0.05952,t= 25.3,m= 0.00081)


# MMR Trial 7  ----------------------------------------------------
# Chamber 1 5mg
Hmmr_5mg <- mmr_h_func(data = t7,start = 39620,end = 39620 + 900,oxygen = 4,plot_widt= 0.15,
                       id= Hmmr_5mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg= bg_t7_ch1,
                       v= 0.05648,t= 25.2,m= 0.00009)


# Chamber 2 5mp
Hmmr_5mp <- mmr_h_func(data = t7,start = 39710,end = 39710 + 810,oxygen = 22,plot_widt= 0.15,
                       id= Hmmr_5mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg=bg_t7_ch2,
                       v= 0.05755,t= 25.2,m= 0.00012)

# Chamber 3 5ml
Hmmr_5ml <- mmr_h_func(data = t7,start = 39980,end = 39980 + 540,oxygen = 40,plot_widt= 0.15,
                       id= Hmmr_5ml, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg=bg_t7_ch3,
                       v= 0.05921,t= 25.2,m= 0.00012)


# chamber 4 5fp
Hmmr_5fp <- mmr_h_func(data = t7,start = 40070,end = 40070 + 600,oxygen = 58,plot_widt= 0.2,
                       id= Hmmr_5fp, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg=bg_t7_ch4,
                       v= 0.05991,t= 25.2,m= 0.00042)

# MMR trial 8  -----------------------------------------------------
# Chamber 1 5mb
Hmmr_5mb <- mmr_h_func(data = t8,start = 39166,end = 39166 +  900,oxygen = 4,plot_widt= 0.15,
                       id= Hmmr_5mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg=bg_t8_ch1,
                       v= 0.05648,t= 25.1,m= 0.00009)

# Chamber 2 5fb
Hmmr_5fb <- mmr_h_func(data = t8,start = 39226,end = 39226 + 840,oxygen = 22,plot_widt= 0.2,
                       id= Hmmr_5fb, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t8_ch2,
                       v= 0.05735,t= 25.1,m= 0.00032)

# Chamber 3 5fl
Hmmr_5fl <- mmr_h_func(data = t8,start = 39526,end = 39526 + 540,oxygen = 40,plot_widt= 0.15,
                       id= Hmmr_5fl, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t8_ch3,
                       v= 0.05897,t= 25.1,m= 0.00036)

# chamber 4 5fg
Hmmr_5fg <- mmr_h_func(data = t8,start = 39586,end = 39586 + 480,oxygen = 58,plot_widt= 0.2,
                       id= Hmmr_5fg, from= 60,to= 450,from1 = 60,rate_width= 0.15,bg_t8_ch4,
                       v= 0.05993,t= 25.1,m= 0.00040)

# MMR trial 9  ----------------------------------------------------
# Chamber 1 9ml
Hmmr_9ml <- mmr_h_func(data = t9,start = 39769,end = 39769 + 900,oxygen = 4,plot_widt= 0.1,
                       id = Hmmr_9ml, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t9_ch1,
                       v= 0.05644,t= 25,m= 0.00013)

# Chamber 2 9mg
Hmmr_9mg <- mmr_h_func(data = t9,start = 39859,end = 39859 + 810,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_9mg, from= 30,to= 450,from1 = 30,rate_width= 0.15, bg_t9_ch2,
                       v= 0.05755,t= 25,m= 0.00012)
# Chamber 3 9Mp
Hmmr_9mp <- mmr_h_func(data = t9,start = 40099,end = 40099 + 570,oxygen = 40,plot_widt= 0.15,
                       id = Hmmr_9mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t9_ch3,
                       v= 0.05917,t= 25,m= 0.00016)


# chamber 4 9Fb
Hmmr_9fb <- mmr_h_func(data = t9,start = 40219,end = 40219 + 600,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_9fb, from= 60,to= 300,from1 = 60,rate_width= 0.2,bg_t9_ch4,
                       v= 0.05999,t= 25,m= 0.00034)

# MMR trial 10  ----------------------------------------------------
# Chamber 1 9Mb
Hmmr_9mb <- mmr_h_func(data = t10,start = 39201,end = 39201 +  780,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_9mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05645,t= 25.4,m= 0.00012)

# Chamber 2 9fl
Hmmr_9fl <- mmr_h_func(data = t10,start = 39321,end = 39321 + 660,oxygen = 22,plot_widt= 0.2,
                       id = Hmmr_9fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05725,t= 25.4,m= 0.00042)
# Chamber 3 9fp
Hmmr_9fp <- mmr_h_func(data = t10,start = 39561,end = 39561 + 420,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_9fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05876,t= 25.4,m= 0.00057)

# chamber 4 9fg background
#empty chamber since fish was dead, background was done on it 


# MMR trial 11 -----------------------------------------------------------------
# Chamber 1 4mb
Hmmr_4mb <- mmr_h_func(data = t11,start = 39968,end = 39968 + 780,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_4mb, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t11_ch1,
                       v= 0.05747,t= 25.3,m= 0.00010)

# Chamber 2 4ml
Hmmr_4ml <- mmr_h_func(data = t11,start = 40298,end = 40298 + 450,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_4ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t11_ch2,
                       v= 0.05645,t= 25.3,m= 0.00012)

# Chamber 3 4fl
Hmmr_4fl <- mmr_h_func(data = t11,start = 40058,end = 40058 + 690,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_4fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t11_ch3,
                       v= 0.05894,t= 25.3,m= 0.00039)

# chamber 4 4fb
# no hmmr, first obeservatoin of blood in head region

# MMR trial 12 -----------------------------------------------------------------
# Chamber 1 4mp
Hmmr_4mp <- mmr_h_func(data = t12,start = 39572,end = 39572 + 900,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_4mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t12_ch1,
                       v= 0.05648,t= 25.2,m= 0.00009)

# Chamber 2 4mg
Hmmr_4mg <- mmr_h_func(data = t12,start = 39662,end = 39662 + 810,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_4mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t12_ch2,
                       v= 0.05756,t= 25.2,m= 0.00011)

# Chamber 3 4fp
Hmmr_4fp <- mmr_h_func(data = t12,start = 39932,end = 39932 + 540,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_4fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t12_ch3,
                       v= 0.05890,t= 25.2,m= 0.00043)

# chamber 4 4fg
Hmmr_4fg <- mmr_h_func(data = t12,start = 40022,end = 40022 + 450,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_4fg, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg_t12_ch4,
                       v= 0.05961,t= 25.2,m= 0.00072)

# MMR trial 13 -----------------------------------------------------------------
# Chamber 1 12mp
Hmmr_12mp <- mmr_h_func(data = t13,start = 39444,end = 39444 + 810,oxygen = 4,plot_widt= 0.15,
                        id = Hmmr_12mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                        v= 0.05648,t= 25.1,m= 0.00009)
# Chamber 2 12mg bg


# Chamber 3 12fg
Hmmr_12fg <- mmr_h_func(data = t13,start = 39504,end = 39504 + 750,oxygen = 40,plot_widt= 0.2,
                        id = Hmmr_12fg, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                        v= 0.05896,t= 25.1,m= 0.00037)

# chamber 4 12fb
Hmmr_12fb <- mmr_h_func(data = t13,start = 39774,end = 39774 + 450,oxygen = 58,plot_widt= 0.2,
                        id = Hmmr_12fb, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                        v= 0.05989,t= 25.1,m= 0.00044)

# MMR trial 14-----------------------------------------------------------------
# Chamber 1 12Ml
Hmmr_12ml <- mmr_h_func(data = t14,start = 39631,end = 39631 + 840,oxygen = 4,plot_widt= 0.2,
                        id = Hmmr_12ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                        v= 0.05645,t= 24.8,m= 0.00012)

# Chamber 2 12mb bg


# Chamber 3 12fL
Hmmr_12fl <- mmr_h_func(data = t14,start = 39721,end = 39721 + 750,oxygen = 40,plot_widt= 0.2,
                        id = Hmmr_12fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                        v= 0.05901,t= 24.8,m= 0.00032)

# chamber 4 12Fp
Hmmr_12fp <- mmr_h_func(data = t14,start = 39991,end = 39991 + 450,oxygen = 58,plot_widt= 0.2,
                        id = Hmmr_12fp, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                        v= 0.05996,t= 24.8,m= 0.00037)

# MMR trial 15 -----------------------------------------------------------------
# Chamber 1 3mp
Hmmr_3mp <- mmr_h_func(data = t15,start = 39576,end =39576 +  1080,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_3mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t15_ch1,
                       v= 0.05641,t= 24.7,m= 0.00016)

# Chamber 2 3fb
Hmmr_3fb <- mmr_h_func(data = t15,start = 39726,end = 39726 + 930,oxygen = 22,plot_widt= 0.2,
                       id = Hmmr_3fb, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t15_ch2,
                       v= 0.05722,t= 24.7,m= 0.00045)

# Chamber 3 3fL
Hmmr_3fl <- mmr_h_func(data = t15,start = 39966,end = 39966 + 690,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_3fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t15_ch3,
                       v= 0.05861,t= 24.7,m= 0.00072)

# chamber 4 3fg
Hmmr_3fg <- mmr_h_func(data = t15,start = 40146,end = 40146 + 510,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_3fg, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg_t15_ch4,
                       v= 0.05940,t= 24.7,m= 0.00093)

# MMR trial 16 -----------------------------------------------------------------
# Chamber 1 3mg
Hmmr_3mg <- mmr_h_func(data = t16,start = 39044,end = 39044 +  1110,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_3mg, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t16_ch1,
                       v= 0.05645,t= 24.4,m= 0.00012)

# Chamber 2 3mL
Hmmr_3ml <- mmr_h_func(data = t16,start = 39164,end = 39164 + 990,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_3ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t16_ch2,
                       v= 0.05756,t= 24.4,m= 0.00011)

# Chamber 3 3fp
Hmmr_3fp <- mmr_h_func(data = t16,start = 39464,end = 39464 + 690,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_3fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t16_ch3,
                       v= 0.05904,t= 24.4,m= 0.00029)
# chamber 4 3mb bg


# MMR trial 17 -----------------------------------------------------------------
# Chamber 1 6mp
Hmmr_6mp <- mmr_h_func(data = t17,start = 37216,end = 37216 +  780,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_6mp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05648,t= 24.5,m= 0.00009)
# Chamber 2 6mg
# 9 min flush?
Hmmr_6mg <- mmr_h_func(data = t17,start = 37276,end = 37276 + 720,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_6mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05761,t= 24.5,m= 0.00006)

# Chamber 3 6fb
Hmmr_6fb <- mmr_h_func(data = t17,start = 37546,end = 37546 + 450,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_6fb, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05893,t= 24.5,m= 0.00040)

# chamber 4 6ml bg



# MMR trial 18 -----------------------------------------------------------------
# Chamber 1 6mb
Hmmr_6mb <- mmr_h_func(data = t18,start = 39274,end = 39274 + 900,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_6mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t18_ch1,
                       v= 0.05649,t= 25.8,m= 0.00008)

# Chamber 2 6fp
Hmmr_6fp <- mmr_h_func(data = t18,start = 39364,end = 39364 + 810,oxygen = 22,plot_widt= 0.2,
                       id = Hmmr_6fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t18_ch2,
                       v= 0.05739,t= 25.8,m= 0.00028)

# Chamber 3 6fg
Hmmr_6fg <- mmr_h_func(data = t18,start = 39635,end = 39635 + 540,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_6fg, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t18_ch3,
                       v= 0.05896,t= 25.8,m= 0.00037)

# chamber 4 6fl
Hmmr_6fl <- mmr_h_func(data = t18,start = 39724,end = 39724 + 450,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_6fl, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg_t18_ch4,
                       v= 0.05979,t= 25.8,m= 0.00054)

# MMR trial 19 -----------------------------------------------------------------
# Chamber 1 1mp
# athletic male
Hmmr_1mp <- mmr_h_func(data = t19,start = 35026,end = 35026 +  870,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_1mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t19_ch1,
                       v= 0.05641,t= 25.7,m= 0.00016)

# Chamber 2 1mg
Hmmr_1mg <- mmr_h_func(data = t19,start = 35116,end = 35116 + 780,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_1mg, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t19_ch2,
                       v= 0.05752,t= 25.7,m= 0.00015)

# Chamber 3 1fg
Hmmr_1fg <- mmr_h_func(data = t19,start = 35418,end = 35418 + 480,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_1fg, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t19_ch3,
                       v= 0.05892,t= 25.7,m= 0.00041)

# chamber 4 1fl
Hmmr_1fl <- mmr_h_func(data = t19,start = 35476,end = 35476 + 435,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_1fl, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg_t19_ch4,
                       v= 0.05981,t= 25.7,m= 0.00052)

# MMR trial 20 -----------------------------------------------------------------
# Chamber 1 1mb
Hmmr_1mb <- mmr_h_func(data = t20,start = 45099,end = 45099 +  870,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_1mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t20_ch1,
                       v= 0.05646,t= 25.4,m= 0.00011)

# Chamber 2 1ml
Hmmr_1ml <- mmr_h_func(data = t20,start = 45189,end = 45189 + 780,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_1ml, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t20_ch2,
                       v= 0.05755,t= 25.4,m= 0.00012)

# Chamber 3 1fp
Hmmr_1fp <- mmr_h_func(data = t20,start = 45489,end = 45489 + 480,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_1fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t20_ch3,
                       v= 0.05914,t= 25.4,m= 0.00019)

# chamber 4 1fb
Hmmr_1fb <- mmr_h_func(data = t20,start = 45549,end = 45549 + 420,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_1fb, from= 60,to= 510,from1 = 60,rate_width= 0.2,bg_t20_ch4,
                       v= 0.06005,t= 25.4,m= 0.00028)

# MMR trial 21------------------------------------------------------------------

# MMR trial 22 -----------------------------------------------------------------

# MMR trial 23 -----------------------------------------------------------------
# Chamber 1 8mb
Hmmr_8mb <- mmr_h_func(data = t23,start = 36836,end = 36836 + 840,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_8mb, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t23_ch1,
                       v= 0.05646,t= 25.2,m= 0.00011)
# Chamber 2 8mg
Hmmr_8mg <- mmr_h_func(data = t23,start = 36896,end = 36896 + 780,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_8mg, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t23_ch2,
                       v= 0.05755,t= 25.2,m= 0.00012)

# Chamber 3 8fb
Hmmr_8fb <- mmr_h_func(data = t23,start = 37166,end = 37166 + 510,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_8fb, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t23_ch3,
                       v= 0.05899,t= 25.2,m= 0.00034)

# chamber 4 8fg
Hmmr_8fg <- mmr_h_func(data = t23,start = 37256,end = 37256 + 420,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_8fg, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg_t23_ch4,
                       v= 0.05950,t= 25.2,m= 0.00083)

# MMR trial 24 -----------------------------------------------------------------
# Chamber 1 8ml
Hmmr_8ml <- mmr_h_func(data = t24,start = 39466,end = 39466 + 840,oxygen = 4,plot_widt= 0.15,
                       id = Hmmr_8ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t24_ch1,
                       v= 0.05642,t= 24.9,m= 0.00015)
# Chamber 2 8mp
Hmmr_8mp <- mmr_h_func(data = t24,start = 39556,end = 39556 + 750,oxygen = 22,plot_widt= 0.15,
                       id = Hmmr_8mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,bg_t24_ch2,
                       v= 0.05736,t= 24.9,m= 0.00031)

# Chamber 3 8fp
Hmmr_8fp <- mmr_h_func(data = t24,start = 39796,end = 39796 + 510,oxygen = 40,plot_widt= 0.2,
                       id = Hmmr_8fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,bg_t24_ch3,
                       v= 0.05884,t= 24.9,m= 0.00049)

# chamber 4 8fl
Hmmr_8fl <- mmr_h_func(data = t24,start = 39886,end = 39886 + 420,oxygen = 58,plot_widt= 0.2,
                       id = Hmmr_8fl, from= 60,to= 450,from1 = 60,rate_width= 0.2,bg_t24_ch4,
                       v= 0.05959,t= 24.9,m= 0.00074)











