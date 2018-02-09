setwd("~/Downloads")
#Import data
data = read.csv("thesis_February 8, 2018_22.26.csv")
#Only finished responses
data=data[data$Finished == "TRUE", ]
#Cleaning
names(data)[names(data)=='Q4_1'] <- 'gendict1'
names(data)[names(data)=='Q5_1'] <- 'gendict2'
names(data)[names(data)=='Q6_1'] <- 'gendict3'
names(data)[names(data)=='Q7_1'] <- 'gendict4'
names(data)[names(data)=='Q8_1'] <- 'gendict5'
names(data)[names(data)=='Q9_1'] <- 'gendict6'
names(data)[names(data)=='Q10_1'] <- 'gendic7'
names(data)[names(data)=='Q11_1'] <- 'gendict8'
names(data)[names(data)=='Q12_1'] <- 'gendict9'
