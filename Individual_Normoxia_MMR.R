#MMR for all individuals of intermitten-flow repsirometry - Normoxia
# function for mmr under normoxia

mmr_n_func <-function(data,start,end,oxygen,plot_width,id,from,to,from1, 
                      rate_width,v,t,m, ...)
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


# Trial 1----------------------------------------------------
#needs to be fixed, wrong bg!! trial 1-4!!!
#chamber 1 2ml
Nmmr_2ml <- mmr_n_func(t1,520,1390,4,0.15,nmmr_2ml, 
                                30,450,30,0.15,
                            0.05643,25.6,0.00014)
# Chamber 2 2mg 
Nmmr_2mg <- mmr_n_func(data = t1,start = 640,end = 1450,oxygen = 22,plot_widt=0.15,
                       id= nmmr_2mg, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05760,t=25.6,m=0.00007)

 
# Chamber 3 2fg 
Nmmr_2fg <- mmr_n_func(data = t1,start = 880,end = 1450,oxygen = 40,plot_widt=0.2,
                       id= nmmr_2fg, from= 30,to= 450,from1 =30,rate_width=0.2,
                       v=0.05908,t=25.6,m=0.00025)

# chamber 4 2fl 
Nmmr_2fl <- mmr_n_func(data = t1,start = 1000,end = 1450,oxygen = 58,plot_widt=0.2,
                       id= nmmr_2fg, from= 60,to= 450,from1 =60,rate_width=0.2,
                       v=0.05982,t=25.6,m=0.00051)
 
# MMR Trial 2-----------------------------------------------
# Chamber 1 2mp
Nmmr_2mp <- mmr_n_func(data = t2,start = 425,end = 1375,oxygen = 4,plot_widt=0.15,
                       id= nmmr_2mp, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05644,t=25,m=0.00013)
# Chamber 2 2mb 
Nmmr_2mb <- mmr_n_func(data = t2,start = 574,end = 1384,oxygen = 22,plot_widt=0.15,
                       id= nmmr_2mb, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05758,t=25,m=0.00009)

# chamber 3 2fb 
Nmmr_2fb <- mmr_n_func(data = t2,start = 934,end = 1234,oxygen = 40,plot_widt=0.2,
                       id= nmmr_2fb, from= 30,to= 450,from1 =30,rate_width=0.2,
                       v=0.05889,t=25,m=0.00044)

# Chamber 4 2fp 
Nmmr_2fp <- mmr_n_func(data = t2,start = 755,end = 1385,oxygen = 58,plot_widt=0.2,
                       id= nmmr_2fp, from= 60,to= 450,from1 =60,rate_width=0.2,
                       v=0.05988,t=25,m=0.00045)

# MMR Trial 3--------------------------------------------------------

# MMR Trial 4--------------------------------------------------------

# MMR Trial 5----------------------------------------------------------------
# Chamber 1 7ml
Nmmr_7ml <- mmr_n_func(data = t5,start = 397,end = 1327,oxygen = 4,plot_widt=0.15,
                       id= nmmr_7ml, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05646,t=24.9,m=0.00011)

# Chamber 2 7Mb
Nmmr_7mb <- mmr_n_func(data = t5,start = 787,end = 1327,oxygen = 22,plot_widt=0.15,
                       id= nmmr_7mb, from= 30,to= 450,from1 =30,rate_width=0.15,
                       v=0.05753,t=24.9,m=0.00014)


# Chamber 3 7fb
Nmmr_7fb <- mmr_n_func(data = t5,start = 517,end = 1327,oxygen = 40,plot_widt=0.2,
                       id= nmmr_7fb, from= 30,to= 450,from1 =30,rate_width=0.2,
                       v=0.05912,t=24.9,m=0.00021)

# chamber 4 7fp
Nmmr_7fp <- mmr_n_func(data = t5,start = 847,end = 1327,oxygen = 58,plot_widt= 0.2,
                       id= nmmr_7fp, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05967,t= 24.9,m= 0.00066)

# MMR Trial 6----------------------------------------------------
# Chamber 1 7mp
Nmmr_7mp <- mmr_n_func(data = t6,start = 358,end = 358 +  1050 - 150,oxygen = 4,plot_widt= 0.15,
                       id= nmmr_7mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05640,t= 25.9,m= 0.00017)

# Chamber 2 7Mg
Nmmr_7mg <- mmr_n_func(data = t6,start = 688,end = 688 + 720 - 150,oxygen = 22,plot_widt= 0.15,
                       id= nmmr_7mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05753,t= 25.9,m= 0.00014)
# Chamber 3 7FL
Nmmr_7fl <- mmr_n_func(data = t6,start = 448,end = 448 + 960 - 150,oxygen = 40,plot_widt= 0.2,
                       id= nmmr_7fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05888,t= 25.9,m= 0.00045)

# chamber 4 7fg

Nmmr_7fg <- mmr_n_func(data = t6,start = 808,end = 808 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id= nmmr_7fg, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05952,t= 25.9,m= 0.00081)


# MMR Trial 7  ----------------------------------------------------
# Chamber 1 5mg
Nmmr_5mg <- mmr_n_func(data = t7,start = 294,end = 294 +  1020 - 150,oxygen = 4,plot_widt= 0.15,
                       id= nmmr_5mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05648,t= 24.7,m= 0.00009)


# Chamber 2 5mp
Nmmr_5mp <- mmr_n_func(data = t7,start = 384,end = 384 + 930 - 150,oxygen = 22,plot_widt= 0.15,
                       id= nmmr_5mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05755,t= 24.7,m= 0.00012)
              
# Chamber 3 5ml
Nmmr_5ml <- mmr_n_func(data = t7,start = 624,end = 624 + 690 - 150,oxygen = 40,plot_widt= 0.15,
                       id= nmmr_5ml, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05921,t= 24.7,m= 0.00012)


# chamber 4 5fp
Nmmr_5fp <- mmr_n_func(data = t7,start = 714,end = 714 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id= nmmr_5fp, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05991,t= 24.7,m= 0.00042)

# MMR trial 8  -----------------------------------------------------
# Chamber 1 5mb
Nmmr_5mb <- mmr_n_func(data = t8,start = 350,end = 350 +  1050 - 150,oxygen = 4,plot_widt= 0.15,
                       id= nmmr_5mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05648,t= 24.7,m= 0.00009)
              
# Chamber 2 5fb
Nmmr_5fb <- mmr_n_func(data = t8,start = 440,end = 440 + 960 - 150,oxygen = 22,plot_widt= 0.2,
                       id= nmmr_5fb, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05735,t= 24.7,m= 0.00032)

# Chamber 3 5fl
Nmmr_5fl <- mmr_n_func(data = t8,start = 710,end = 710 + 690 - 150,oxygen = 40,plot_widt= 0.15,
                       id= nmmr_5fl, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05897,t= 24.7,m= 0.00036)

# chamber 4 5fg
Nmmr_5fg <- mmr_n_func(data = t8,start = 770,end = 770 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id= nmmr_5fg, from= 60,to= 450,from1 = 60,rate_width= 0.15,
                       v= 0.05993,t= 24.7,m= 0.00040)

# MMR trial 9  ----------------------------------------------------
# Chamber 1 9ml
Nmmr_9ml <- mmr_n_func(data = t9,start = 383,end = 383 +  1020 - 150,oxygen = 4,plot_widt= 0.1,
                       id = nmmr_9ml, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05644,t= 24.8,m= 0.00013)
                
# Chamber 2 9mg
Nmmr_9mg <- mmr_n_func(data = t9,start = 443,end = 443 + 960 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_9mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05755,t= 24.8,m= 0.00012)
# Chamber 3 9Mp
Nmmr_9mp <- mmr_n_func(data = t9,start = 713,end = 713 + 690 - 150,oxygen = 40,plot_widt= 0.15,
                       id = nmmr_9mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05917,t= 24.8,m= 0.00016)
              

# chamber 4 9Fb
Nmmr_9fb <- mmr_n_func(data = t9,start = 803,end = 803 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_9fb, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05999,t= 24.8,m= 0.00034)
               
# MMR trial 10  ----------------------------------------------------
# Chamber 1 9Mb
Nmmr_9mb <- mmr_n_func(data = t10,start = 505,end = 505 +  960 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_9mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05645,t= 25.2,m= 0.00012)

# Chamber 2 9fl
Nmmr_9fl <- mmr_n_func(data = t10,start = 595,end = 595 + 870 - 150,oxygen = 22,plot_widt= 0.2,
                       id = nmmr_9fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05725,t= 25.2,m= 0.00042)
# Chamber 3 9fp
Nmmr_9fp <- mmr_n_func(data = t10,start = 865,end = 865 + 600 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_9fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05876,t= 25.2,m= 0.00057)

# chamber 4 9fg background
#empty chamber since fish was dead, background was done on it 


# MMR trial 11 -----------------------------------------------------------------
# Chamber 1 4mb
Nmmr_4mb <- mmr_n_func(data = t11,start = 461,end = 461 +  1020 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_4mb, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05747,t= 25.2,m= 0.00010)

# Chamber 2 4ml
Nmmr_4ml <- mmr_n_func(data = t11,start = 791,end = 791 + 690 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_4ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05645,t= 25.2,m= 0.00012)

# Chamber 3 4fl
Nmmr_4fl <- mmr_n_func(data = t11,start = 521,end = 521 + 960 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_4fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05894,t= 25.2,m= 0.00039)

# chamber 4 4fb
Nmmr_4fb <- mmr_n_func(data = t11,start = 881,end = 881 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_4fb, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05981,t= 25.2,m= 0.00052)

# MMR trial 12 -----------------------------------------------------------------
# Chamber 1 4mp
Nmmr_4mp <- mmr_n_func(data = t12,start = 545,end = 545 +  1020 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_4mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05648,t= 24.8,m= 0.00009)

# Chamber 2 4mg
Nmmr_4mg <- mmr_n_func(data = t12,start = 905,end = 905 + 660 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_4mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05756,t= 24.8,m= 0.00011)

# Chamber 3 4fp
Nmmr_4fp <- mmr_n_func(data = t12,start = 635,end = 635 + 930 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_4fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05890,t= 24.8,m= 0.00043)

# chamber 4 4fg
Nmmr_4fg <- mmr_n_func(data = t12,start = 965,end = 965 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_4fg, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05961,t= 24.8,m= 0.00072)

# MMR trial 13 -----------------------------------------------------------------
# Chamber 1 12mp
Nmmr_12mp <- mmr_n_func(data = t13,start = 478,end = 478 +  900 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_12mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05648,t= 24.7,m= 0.00009)
# Chamber 2 12mg bg


# Chamber 3 12fg
Nmmr_12fg <- mmr_n_func(data = t13,start = 418,end = 418 + 660 - 150,oxygen = 40,plot_widt= 0.2,
                        id = nmmr_12fg, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                        v= 0.05896,t= 24.7,m= 0.00037)

# chamber 4 12fb
Nmmr_12fb <- mmr_n_func(data = t13,start = 777,end = 777 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                        id = nmmr_12fb, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                        v= 0.05989,t= 24.7,m= 0.00044)

# MMR trial 14-----------------------------------------------------------------
# Chamber 1 12Ml
Nmmr_12ml <- mmr_n_func(data = t14,start = 485,end = 485 + 960 - 150,oxygen = 4,plot_widt= 0.2,
                        id = nmmr_12ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                        v= 0.05645,t= 24.6,m= 0.00012)

# Chamber 2 12mb bg


# Chamber 3 12fL
Nmmr_12fl <- mmr_n_func(data = t14,start = 545,end = 545 + 900 - 150,oxygen = 40,plot_widt= 0.2,
                        id = nmmr_12fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                        v= 0.05901,t= 24.6,m= 0.00032)

# chamber 4 12Fp
Nmmr_12fp <- mmr_n_func(data = t14,start = 845,end = 845 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                        id = nmmr_12fp, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                        v= 0.05996,t= 24.6,m= 0.00037)

# MMR trial 15 -----------------------------------------------------------------
# Chamber 1 3mp
Nmmr_3mp <- mmr_n_func(data = t15,start = 370,end = 370 +  1020 - 150,oxygen = 4,plot_widt= 0.15,
                        id = nmmr_3mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                        v= 0.05641,t= 24.4,m= 0.00016)
               
# Chamber 2 3fb
Nmmr_3fb <- mmr_n_func(data = t15,start = 430,end = 430 + 960 - 150,oxygen = 22,plot_widt= 0.2,
                       id = nmmr_3fb, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05722,t= 24.4,m= 0.00045)

# Chamber 3 3fL
Nmmr_3fl <- mmr_n_func(data = t15,start = 740,end = 740 + 650 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_3fl, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05861,t= 24.4,m= 0.00072)

# chamber 4 3fg
Nmmr_3fg <- mmr_n_func(data = t15,start = 790,end = 790 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_3fg, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05940,t= 24.4,m= 0.00093)

# MMR trial 16 -----------------------------------------------------------------
# Chamber 1 3mg
Nmmr_3mg <- mmr_n_func(data = t16,start = 558,end = 558 +  990 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_3mg, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05645,t= 24.3,m= 0.00012)

# Chamber 2 3mL
Nmmr_3ml <- mmr_n_func(data = t16,start = 948,end = 948 + 600 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_3ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05756,t= 24.3,m= 0.00011)

# Chamber 3 3fp
Nmmr_3fp <- mmr_n_func(data = t16,start = 738,end = 738 + 810 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_3fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05904,t= 24.3,m= 0.00029)
# chamber 4 3mb bg


# MMR trial 17 -----------------------------------------------------------------
# Chamber 1 6mp
# 8 min flush????
Nmmr_6mp <- mmr_n_func(data = t17,start = 1130,end = 1130 +  600 - 240,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_6mp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05648,t= 26,m= 0.00009)
# Chamber 2 6mg
# 9 min flush?
Nmmr_6mg <- mmr_n_func(data = t17,start = 770,end = 770 + 990 - 270,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_6mg, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05761,t= 26,m= 0.00006)
              
# Chamber 3 6fb
Nmmr_6fb <- mmr_n_func(data = t17,start = 590,end = 590 + 1170 - 270,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_6fb, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05893,t= 26,m= 0.00040)

# chamber 4 6ml bg



# MMR trial 18 -----------------------------------------------------------------
# Chamber 1 6mb
Nmmr_6mb <- mmr_n_func(data = t18,start = 518,end = 518 + 990 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_6mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05649,t= 24.5,m= 0.00008)

# Chamber 2 6fp
Nmmr_6fp <- mmr_n_func(data = t18,start = 908,end = 908 + 600 - 150,oxygen = 22,plot_widt= 0.2,
                       id = nmmr_6fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05739,t= 24.5,m= 0.00028)

# Chamber 3 6fg
Nmmr_6fg <- mmr_n_func(data = t18,start = 458,end = 458 + 1050 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_6fg, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05896,t= 24.5,m= 0.00037)

# chamber 4 6fl
Nmmr_6fl <- mmr_n_func(data = t18,start = 788,end = 788 + 720 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_6fl, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05979,t= 24.5,m= 0.00054)

# MMR trial 19 -----------------------------------------------------------------
# Chamber 1 1mp
  # athletic male
Nmmr_1mp <- mmr_n_func(data = t19,start = 379,end = 379 +  1050 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_1mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05641,t= 25.2,m= 0.00016)
                 
# Chamber 2 1mg
Nmmr_1mg <- mmr_n_func(data = t19,start = 739,end = 739 + 690 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_1mg, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05752,t= 25.2,m= 0.00015)

# Chamber 3 1fg
Nmmr_1fg <- mmr_n_func(data = t19,start = 439,end = 439 + 990 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_1fg, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05892,t= 25.2,m= 0.00041)

# chamber 4 1fl
Nmmr_1fl <- mmr_n_func(data = t19,start = 830,end = 830 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_1fl, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05981,t= 25.2,m= 0.00052)

# MMR trial 20 -----------------------------------------------------------------
# Chamber 1 1mb
Nmmr_1mb <- mmr_n_func(data = t20,start = 403,end = 403 +  1020 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_1mb, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05646,t= 25.4,m= 0.00011)

# Chamber 2 1ml
Nmmr_1ml <- mmr_n_func(data = t20,start = 763,end = 763 + 660 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_1ml, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05755,t= 25.4,m= 0.00012)

# Chamber 3 1fp
Nmmr_1fp <- mmr_n_func(data = t20,start = 493,end = 493 + 930 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_1fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05914,t= 25.4,m= 0.00019)

# chamber 4 1fb
Nmmr_1fb <- mmr_n_func(data = t20,start = 823,end = 823 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_1fb, from= 60,to= 510,from1 = 60,rate_width= 0.2,
                       v= 0.06005,t= 25.4,m= 0.00028)

# MMR trial 21------------------------------------------------------------------

# MMR trial 22 -----------------------------------------------------------------

# MMR trial 23 -----------------------------------------------------------------
# Chamber 1 8mb
Nmmr_8mb <- mmr_n_func(data = t23,start = 360,end = 360 +  1020 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_8mb, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05646,t= 25.1,m= 0.00011)
# Chamber 2 8mg
Nmmr_8mg <- mmr_n_func(data = t23,start = 690,end = 690 + 690 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_8mg, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05755,t= 25.1,m= 0.00012)

# Chamber 3 8fb
Nmmr_8fb <- mmr_n_func(data = t23,start = 450,end = 450 + 930 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_8fb, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05899,t= 25.1,m= 0.00034)

# chamber 4 8fg
Nmmr_8fg <- mmr_n_func(data = t23,start = 780,end = 780 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_8fg, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05950,t= 25.1,m= 0.00083)

# MMR trial 24 -----------------------------------------------------------------
# Chamber 1 8ml
Nmmr_8ml <- mmr_n_func(data = t24,start = 440,end = 440 +  1020 - 150,oxygen = 4,plot_widt= 0.15,
                       id = nmmr_8ml, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05642,t= 25,m= 0.00015)
# Chamber 2 8mp
Nmmr_8mp <- mmr_n_func(data = t24,start = 770,end = 770 + 690 - 150,oxygen = 22,plot_widt= 0.15,
                       id = nmmr_8mp, from= 30,to= 450,from1 = 30,rate_width= 0.15,
                       v= 0.05736,t= 25,m= 0.00031)

# Chamber 3 8fp
Nmmr_8fp <- mmr_n_func(data = t24,start = 500,end = 500 + 960 - 150,oxygen = 40,plot_widt= 0.2,
                       id = nmmr_8fp, from= 30,to= 450,from1 = 30,rate_width= 0.2,
                       v= 0.05884,t= 25,m= 0.00049)

# chamber 4 8fl
Nmmr_8fl <- mmr_n_func(data = t24,start = 860,end = 860 + 600 - 150,oxygen = 58,plot_widt= 0.2,
                       id = nmmr_8fl, from= 60,to= 450,from1 = 60,rate_width= 0.2,
                       v= 0.05959,t= 25,m= 0.00074)











