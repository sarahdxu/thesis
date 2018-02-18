if(!require(reshape2)){
  install.packages("reshape2")
}
library(reshape2)


setwd("~/Downloads")
#Import data
data = read.csv("thesis.csv", stringsAsFactors=FALSE)

#Only finished responses
data=data[data$Finished == "TRUE", ]
data$ID <- seq.int(nrow(data))

#Rename columns
names(data)[names(data)=='Q4_1'] <- 'gendict1'
names(data)[names(data)=='Q5_1'] <- 'gendict2'
names(data)[names(data)=='Q6_1'] <- 'gendict3'
names(data)[names(data)=='Q7_1'] <- 'gendict4'
names(data)[names(data)=='Q8_1'] <- 'gendict5'
names(data)[names(data)=='Q9_1'] <- 'gendict6'
names(data)[names(data)=='Q10_1'] <- 'gendict7'
names(data)[names(data)=='Q11_1'] <- 'gendict8'
names(data)[names(data)=='Q12_1'] <- 'gendict9'
names(data)[names(data)=='Q13'] <- 'trust1'
names(data)[names(data)=='Q14_1_1'] <- 'trust2_1'
names(data)[names(data)=='Q14_2_1'] <- 'trust2_2'
names(data)[names(data)=='Q14_3_1'] <- 'trust2_3'
names(data)[names(data)=='Q14_4_1'] <- 'trust2_4'
names(data)[names(data)=='Q14_5_1'] <- 'trust2_5'
names(data)[names(data)=='Q14_6_1'] <- 'trust2_6'
names(data)[names(data)=='Q14_7_1'] <- 'trust2_7'
names(data)[names(data)=='Q14_8_1'] <- 'trust2_8'
names(data)[names(data)=='Q14_9_1'] <- 'trust2_9'
names(data)[names(data)=='Q14_10_1'] <- 'trust2_10'
names(data)[names(data)=='Q15'] <- 'ult1'
names(data)[names(data)=='Q16_1'] <- 'ult2_0'
names(data)[names(data)=='Q16_2'] <- 'ult2_1'
names(data)[names(data)=='Q16_3'] <- 'ult2_2'
names(data)[names(data)=='Q16_4'] <- 'ult2_3'
names(data)[names(data)=='Q16_5'] <- 'ult2_4'
names(data)[names(data)=='Q16_6'] <- 'ult2_5'
names(data)[names(data)=='Q16_7'] <- 'ult2_6'
names(data)[names(data)=='Q16_8'] <- 'ult2_7'
names(data)[names(data)=='Q16_9'] <- 'ult2_8'
names(data)[names(data)=='Q16_10'] <- 'ult2_9'
names(data)[names(data)=='Q16_11'] <- 'ult2_10'
names(data)[names(data)=='Q17'] <- 'public'
names(data)[names(data)=='Q2_1'] <- 'SRA1'
names(data)[names(data)=='Q2_2'] <- 'SRA2'
names(data)[names(data)=='Q2_3'] <- 'SRA3'
names(data)[names(data)=='Q2_5'] <- 'SRA4'
names(data)[names(data)=='Q2_7'] <- 'SRA5'
names(data)[names(data)=='Q2_8'] <- 'SRA6'
names(data)[names(data)=='Q2_10'] <- 'SRA7'
names(data)[names(data)=='Q2_11'] <- 'SRA8'
names(data)[names(data)=='Q2_13'] <- 'SRA9'
names(data)[names(data)=='Q2_14'] <- 'SRA10'

#SRA scores to number values
data$SRA1[data$SRA1=="Never"] <- 1
data$SRA1[data$SRA1=="Once"] <- 2
data$SRA1[data$SRA1=="More than once"] <- 3
data$SRA1[data$SRA1=="Often"] <- 4
data$SRA1[data$SRA1=="Very often"] <- 5
data$SRA2[data$SRA2=="Never"] <- 1
data$SRA2[data$SRA2=="Once"] <- 2
data$SRA2[data$SRA2=="More than once"] <- 3
data$SRA2[data$SRA2=="Often"] <- 4
data$SRA2[data$SRA2=="Very often"] <- 5
data$SRA3[data$SRA3=="Never"] <- 1
data$SRA3[data$SRA3=="Once"] <- 2
data$SRA3[data$SRA3=="More than once"] <- 3
data$SRA3[data$SRA3=="Often"] <- 4
data$SRA3[data$SRA3=="Very often"] <- 5
data$SRA4[data$SRA4=="Never"] <- 1
data$SRA4[data$SRA4=="Once"] <- 2
data$SRA4[data$SRA4=="More than once"] <- 3
data$SRA4[data$SRA4=="Often"] <- 4
data$SRA4[data$SRA4=="Very often"] <- 5
data$SRA5[data$SRA5=="Never"] <- 1
data$SRA5[data$SRA5=="Once"] <- 2
data$SRA5[data$SRA5=="More than once"] <- 3
data$SRA5[data$SRA5=="Often"] <- 4
data$SRA5[data$SRA5=="Very often"] <- 5
data$SRA6[data$SRA6=="Never"] <- 1
data$SRA6[data$SRA6=="Once"] <- 2
data$SRA6[data$SRA6=="More than once"] <- 3
data$SRA6[data$SRA6=="Often"] <- 4
data$SRA6[data$SRA6=="Very often"] <- 5
data$SRA7[data$SRA7=="Never"] <- 1
data$SRA7[data$SRA7=="Once"] <- 2
data$SRA7[data$SRA7=="More than once"] <- 3
data$SRA7[data$SRA7=="Often"] <- 4
data$SRA7[data$SRA7=="Very often"] <- 5
data$SRA8[data$SRA8=="Never"] <- 1
data$SRA8[data$SRA8=="Once"] <- 2
data$SRA8[data$SRA8=="More than once"] <- 3
data$SRA8[data$SRA8=="Often"] <- 4
data$SRA8[data$SRA8=="Very often"] <- 5
data$SRA9[data$SRA9=="Never"] <- 1
data$SRA9[data$SRA9=="Once"] <- 2
data$SRA9[data$SRA9=="More than once"] <- 3
data$SRA9[data$SRA9=="Often"] <- 4
data$SRA9[data$SRA9=="Very often"] <- 5
data$SRA10[data$SRA10=="Never"] <- 1
data$SRA10[data$SRA10=="Once"] <- 2
data$SRA10[data$SRA10=="More than once"] <- 3
data$SRA10[data$SRA10=="Often"] <- 4
data$SRA10[data$SRA10=="Very often"] <- 5

data$SRA1<-as.numeric(data$SRA1)
data$SRA2<-as.numeric(data$SRA2)
data$SRA3<-as.numeric(data$SRA3)
data$SRA4<-as.numeric(data$SRA4)
data$SRA5<-as.numeric(data$SRA5)
data$SRA6<-as.numeric(data$SRA6)
data$SRA7<-as.numeric(data$SRA7)
data$SRA8<-as.numeric(data$SRA8)
data$SRA9<-as.numeric(data$SRA9)
data$SRA10<-as.numeric(data$SRA10)
data$ult1<-as.numeric(data$ult1)
data$trust1<-as.numeric(data$trust1)
data$public<-as.numeric(data$public)

data$SRA<-data$SRA1+data$SRA2+data$SRA3+data$SRA4+data$SRA5+data$SRA6+
  data$SRA7+data$SRA8+data$SRA9+data$SRA10
data$UG1 <- data$ult1/10
#figure out what to do for ult2
data$TG1 <- data$trust1/10
#slopes for TG2
data$PGG <- data$public/10


#represent TG2
trustdata <- data[, c("ID", "trust2_1",  "trust2_2", "trust2_3", "trust2_4", "trust2_5", "trust2_6",
                      "trust2_7", "trust2_8", "trust2_9", "trust2_10")]

trustdata$trust1_1 <- 3
trustdata$trust1_2 <- 6
trustdata$trust1_3 <- 9
trustdata$trust1_4 <- 12
trustdata$trust1_5 <- 15
trustdata$trust1_6 <- 18
trustdata$trust1_7 <- 21
trustdata$trust1_8 <- 24
trustdata$trust1_9 <- 27
trustdata$trust1_10 <- 30

trustdata <- trustdata[,c("ID", "trust1_1", "trust2_1", "trust1_2", "trust2_2", "trust1_3", "trust2_3", 
                          "trust1_4", "trust2_4", "trust1_5", "trust2_5", "trust1_6", "trust2_6", 
                          "trust1_7", "trust2_7", "trust1_8", "trust2_8", "trust1_9", "trust2_9", 
                          "trust1_10", "trust2_10")]

names(trustdata)<-c("ID","t1.x", "t1.y","t2.x", "t2.y","t3.x", "t3.y",
                    "t4.x", "t4.y","t5.x", "t5.y","t6.x", "t6.y","t7.x", "t7.y",
                    "t8.x", "t8.y","t9.x", "t9.y","t10.x", "t10.y")

#TG2 long format
library(tidyr)
library(dplyr)
trustlong<- trustdata %>% 
  gather(v, value, t1.x:t10.y) %>% 
  separate(v, c("var", "col")) %>% 
  arrange(ID) %>% 
  spread(col, value)
#Loop to get slope of each row
trustlong$x<-as.numeric(trustlong$x)
trustlong$y<-as.numeric(trustlong$y)
trustlong$reciprocity<-0
i<-1
j<-10
while (j<3961)
{
  temp = trustlong[i:j,]
  model = lm(temp$y~temp$x)
  trustlong$reciprocity[i:j]<-model$coefficients[2]
  i<- i+10
  j<- j+10
}
trustlong<-trustlong[,c("ID", "reciprocity")]
trustlong<-unique(trustlong)
#merge data and trust data
data <- merge( trustlong,data, by="ID")
colnames(data)[2]<-"TG2"

#Remove entries where they accept and then reject -- doesn't make sense
i<-396
while (i>0){
  j<-41
  k<-42
  {while (k<52){
    if (data[i, j]=='Accept' & data[i, k] == 'Reject'){
      data<-data[-i,]
    }
    j<-j+1
    k<-k+1
  }
  }
  i<-i-1
}

#UG2 as minimum pass rate player chooses to accept
i<-1
data$UG2<-0
while (i<343){
  j<-41
  while (j<52){
    if (data[i,j] == 'Accept' & data[i,68]==0){
      data[i,68]<-j-41
      j<-52
    }
    else{j<-j+1}
    
    
  }
  i<-i+1
}

#General Dictator game
#pi_s, pi_o, p, m
data$pgendict1 <- 0.5
data$pgendict2 <- 1/3
data$pgendict3 <- 2
data$pgendict4 <- 0.5
data$pgendict5 <- 3
data$pgendict6 <- 1
data$pgendict7 <- 2
data$pgendict8 <- 4
data$pgendict9 <- .25
data$mgendict1 <- 15
data$mgendict2 <- 10
data$mgendict3 <- 15
data$mgendict4 <- 12
data$mgendict5 <- 10
data$mgendict6 <- 15
data$mgendict7 <- 12
data$mgendict8 <- 10
data$mgendict9 <- 10
data$gendict1<-as.numeric(data$gendict1)
data$gendict2<-as.numeric(data$gendict2)
data$gendict3<-as.numeric(data$gendict3)
data$gendict4<-as.numeric(data$gendict4)
data$gendict5<-as.numeric(data$gendict5)
data$gendict6<-as.numeric(data$gendict6)
data$gendict7<-as.numeric(data$gendict7)
data$gendict8<-as.numeric(data$gendict8)
data$gendict9<-as.numeric(data$gendict9)
data$sgendict1 <- data$mgendict1-data$gendict1
data$sgendict2 <- data$mgendict2-data$gendict2
data$sgendict3 <- data$mgendict3-data$gendict3
data$sgendict4 <- data$mgendict4-data$gendict4
data$sgendict5 <- data$mgendict5-data$gendict5
data$sgendict6 <- data$mgendict6-data$gendict6
data$sgendict7 <- data$mgendict7-data$gendict7
data$sgendict8 <- data$mgendict8-data$gendict8
data$sgendict9 <- data$mgendict9-data$gendict9
data$ogendict1 <- data$gendict1/data$pgendict1
data$ogendict2 <- data$gendict2/data$pgendict2
data$ogendict3 <- data$gendict3/data$pgendict3
data$ogendict4 <- data$gendict4/data$pgendict4
data$ogendict5 <- data$gendict5/data$pgendict5
data$ogendict6 <- data$gendict6/data$pgendict6
data$ogendict7 <- data$gendict7/data$pgendict7
data$ogendict8 <- data$gendict8/data$pgendict8
data$ogendict9 <- data$gendict9/data$pgendict9


data <- data[-c(3:10, 15:19)]

#match players to get winner
match <- data[,c("ResponseId", 
                 "public")]
popsize = 396
matches<-split(sample(match$ResponseId), rep(1:(popsize/2), each=2))
