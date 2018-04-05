if(!require(reshape2)){
  install.packages("reshape2")
}
library(reshape2)
install.packages("tidyr")
install.packages("dplyr")
library(tidyr)
library(dplyr)
library(tidyr)
library(dplyr)
install.packages("pscl")
library(pscl)
if(!require(ggplot2)){
  install.packages("ggplot2")
}
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)
if(!require(minpack.lm)){
  install.packages("minpack.lm")
}
library(minpack.lm)
install.packages('picante')
library(picante)
if(!require(stargazer)){
  install.packages("stargazer")
}
library(stargazer)
install.packages("Hmisc")
library(Hmisc)

setwd("~/Desktop/thesis")
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

data$SRAtotal<-data$SRA1+data$SRA2+data$SRA3+data$SRA4+data$SRA5+data$SRA6+
  data$SRA7+data$SRA8+data$SRA9+data$SRA10
data$SRAmoney<-data$SRA2+data$SRA3+data$SRA4+data$SRA7
data$UG1 <- data$ult1/10
data$TG1 <- data$trust1/10
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
trustdata$trust2_1<-as.numeric(trustdata$trust2_1)
trustdata$trust2_2<-as.numeric(trustdata$trust2_2)
trustdata$trust2_3<-as.numeric(trustdata$trust2_3)
trustdata$trust2_4<-as.numeric(trustdata$trust2_4)
trustdata$trust2_5<-as.numeric(trustdata$trust2_5)
trustdata$trust2_6<-as.numeric(trustdata$trust2_6)
trustdata$trust2_7<-as.numeric(trustdata$trust2_7)
trustdata$trust2_8<-as.numeric(trustdata$trust2_8)
trustdata$trust2_9<-as.numeric(trustdata$trust2_9)
trustdata$trust2_10<-as.numeric(trustdata$trust2_10)

trustdata$t1<-(trustdata$trust2_1)/(trustdata$trust1_1)
trustdata$t2<-(trustdata$trust2_2)/(trustdata$trust1_2)
trustdata$t3<-(trustdata$trust2_3)/(trustdata$trust1_3)
trustdata$t4<-(trustdata$trust2_4)/(trustdata$trust1_4)
trustdata$t5<-(trustdata$trust2_5)/(trustdata$trust1_5)
trustdata$t6<-(trustdata$trust2_6)/(trustdata$trust1_6)
trustdata$t7<-(trustdata$trust2_7)/(trustdata$trust1_7)
trustdata$t8<-(trustdata$trust2_8)/(trustdata$trust1_8)
trustdata$t9<-(trustdata$trust2_9)/(trustdata$trust1_9)
trustdata$t10<-(trustdata$trust2_10)/(trustdata$trust1_10)

for (i in trustdata$ID){
  temp<-trustdata[trustdata$ID==i,]
  trustdata$avgreturn[trustdata$ID==i]<-(temp$t1+temp$t2+temp$t3+temp$t4+
                                           temp$t5+temp$t6+temp$t7+
                                           temp$t8+temp$t9+temp$t10)/10
}




trust<-trustdata
trust<-trust[,c("ID", "avgreturn")]


trustdata <- trustdata[,c("ID", "trust1_1", "trust2_1", "trust1_2", "trust2_2", "trust1_3", "trust2_3", 
                          "trust1_4", "trust2_4", "trust1_5", "trust2_5", "trust1_6", "trust2_6", 
                          "trust1_7", "trust2_7", "trust1_8", "trust2_8", "trust1_9", "trust2_9", 
                          "trust1_10", "trust2_10")]

names(trustdata)<-c("ID","t1.x", "t1.y","t2.x", "t2.y","t3.x", "t3.y",
                    "t4.x", "t4.y","t5.x", "t5.y","t6.x", "t6.y","t7.x", "t7.y",
                    "t8.x", "t8.y","t9.x", "t9.y","t10.x", "t10.y")

#TG2 long format

trustlong<- trustdata %>% 
  gather(v, value, t1.x:t10.y) %>% 
  separate(v, c("var", "col")) %>% 
  arrange(ID) %>% 
  spread(col, value)

#Loop to get slope of each row
trustlong$x<-as.numeric(trustlong$x)
trustlong$y<-as.numeric(trustlong$y)



#ggplot(data=trustlong, aes(x=as.factor(x), y=y)) + geom_violin()
#ggplot(data=trustlong, aes(x=as.factor(x), y=y)) + geom_point() + facet_wrap(~ID)
#ggsave("~/Desktop/thesis/paper/images/linearity.pdf", width=11, height=8.5)
trustlong$reciprocity<-0
i<-1
j<-10
while (j<3971)
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

#avg repayment rate

data<-merge(trust, data, by="ID")

#Remove entries where they accept and then reject -- doesn't make sense

i<-397
while (i>0){
  j<-42
  k<-43
  {while (k<53){
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
while (i<344){
  j<-42
  while (j<53){
    if (data[i,j] == 'Accept' & data[i,70]==0){
      data[i,70]<-j-42
      j<-53
    }
    else{j<-j+1}
  }
  i<-i+1
}
data$UG2<-data$UG2/10

#General Dictator game
data <- data[-c(4:11,13:20,64)]

data$p1 <- 1/2
data$p2 <- 1/3
data$p3 <- 2
data$p4 <- 1/2
data$p5 <- 3
data$p6 <- 1
data$p7 <- 2
data$p8 <- 4
data$p9 <- 1/4
data$m1 <- 15
data$m2 <- 10
data$m3 <- 15
data$m4 <- 12
data$m5 <- 10
data$m6 <- 15
data$m7 <- 12
data$m8 <- 10
data$m9 <- 10



data$gendict1<-as.numeric(data$gendict1)
data$gendict2<-as.numeric(data$gendict2)
data$gendict3<-as.numeric(data$gendict3)
data$gendict4<-as.numeric(data$gendict4)
data$gendict5<-as.numeric(data$gendict5)
data$gendict6<-as.numeric(data$gendict6)
data$gendict7<-as.numeric(data$gendict7)
data$gendict8<-as.numeric(data$gendict8)
data$gendict9<-as.numeric(data$gendict9)
data$gendict6[data$ID==281]<-15
data$gendict6[data$ID==65]<-15
data$gendict6[data$ID==96]<-15
data$gendict6[data$ID==108]<-15
data$gendict6[data$ID==154]<-15
data$gendict6[data$ID==358]<-15
data$gendict6[data$ID==16]<-12
data$gendict6[data$ID==81]<-13




data$pi_s1 <- data$m1-data$gendict1
data$pi_s2 <- data$m2-data$gendict2
data$pi_s3 <- data$m3-data$gendict3
data$pi_s4 <- data$m4-data$gendict4
data$pi_s5 <- data$m5-data$gendict5
data$pi_s6 <- data$m6-data$gendict6
data$pi_s7 <- data$m7-data$gendict7
data$pi_s8 <- data$m8-data$gendict8
data$pi_s9 <- data$m9-data$gendict9

data$Y1<-data$pi_s1
data$Y2<-data$pi_s2
data$Y3<-data$pi_s3
data$Y4<-data$pi_s4
data$Y5<-data$pi_s5
data$Y6<-data$pi_s6
data$Y7<-data$pi_s7
data$Y8<-data$pi_s8
data$Y9<-data$pi_s9
data$X1<-data$p1
data$X2<-data$p2
data$X3<-data$p3
data$X4<-data$p4
data$X5<-data$p5
data$X6<-data$p6
data$X7<-data$p7
data$X8<-data$p8
data$X9<-data$p9


gendictlong<-data[,c("ID", "X1", "Y1", "m1", "X2", "Y2", "m2","X3", "Y3", "m3", "X4", "Y4", "m4",
                     "X5", "Y5", "m5", "X6", "Y6", "m6", "X7", "Y7", "m7", "X8", "Y8", "m8", "X9", "Y9", "m9")]
names(gendictlong)<-c("ID", "g1.x", "g1.y","g1.m", "g2.x", "g2.y", "g2.m","g3.x", "g3.y","g3.m",
                      "g4.x", "g4.y", "g4.m","g5.x", "g5.y","g5.m", "g6.x", "g6.y","g6.m",
                      "g7.x", "g7.y", "g7.m","g8.x", "g8.y","g8.m", "g9.x", "g9.y","g9.m")
long<- gendictlong %>% 
  gather(v, value, g1.x:g9.m) %>% 
  separate(v, c("var", "col")) %>% 
  arrange(ID) %>% 
  spread(col, value)


for (i in long$ID){
  temp<-long[long$ID==i,]
  model<-nls(y~m*(A/((x^r)+A)), data=temp, start=c(A=1, r=-1), 
             algorithm="port",
             control=nls.control(warnOnly=TRUE),
             upper=c(A=Inf, r=0.9999), lower=c(A=-Inf,r=-Inf))
  long$A[long$ID==i]<-coef(model)[1]
  long$r[long$ID==i]<-coef(model)[2]
}

long<-long[,c("ID", "A", "r")]
long<-unique(long)
long$rho<-long$r/(long$r - 1)
long$alpha<-((long$A)^(1-long$rho))/(1+(long$A)^(1-long$rho))
long$sigma<-1/(long$rho - 1)
long$alpha[long$ID==96]<-0
long$alpha[long$ID==113]<-0
long$alpha[long$ID==281]<-0
long$alpha[long$ID==13]<-1
long$alpha[long$ID==87]<-1
long$alpha[long$ID==362]<-1

long<-long[,c("ID", "alpha", "rho", "sigma")]

data1<-merge(long, data, by="ID")
data<-data1[,c("ID", "ResponseId", "alpha", "rho", "sigma",  "TG2", "avgreturn", "UG1", "UG2", "TG1", "PGG",
               "SRA1", "SRA2","SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10",
               "SRAtotal", "SRAmoney")]



donations = read.csv("donations.csv", stringsAsFactors=FALSE)


donations <- donations[-c(11:18, 20:67)]

data <- merge( data,donations, by="ResponseId")
data<-data[,c("ID", "ResponseId", "GENDER", "CLASS_YR", "MAJOR", "alpha", "rho",
              "sigma", "TG2", "avgreturn", "UG1", "UG2", "TG1", "PGG", 
              "SRA1", "SRA2","SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10",
              "SRAtotal","SRAmoney", "current_donor_status",
              "DNR_GIVING", "DNR_TOTAL_YEARS", "first_gift", "last_gift", "last_gift_amount", "last_gift_for")]



# data$UG1<-data$UG1*100
# data$UG2<-data$UG2*100
# data$TG1<-data$TG1*100
# data$PGG<-data$PGG*100
# data$TG2<-data$TG2*100
# data$alpha1<-data$alpha*100
# data$avgreturn<-data$avgreturn*100
#####################
#Univariate Analysis#
#####################

#SRA
SRA<-ggplot(data=data, aes(data$SRAtotal))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  labs(x="Total Scores", y="Percent") +
  scale_x_continuous(breaks=seq(20,50,2)) + ggtitle("Panel I: Total SRA Scores")
ggsave("~/Desktop/thesis/paper/images/SRAimg.jpg", width=11, height=8.5)
summary(data$SRAmoney)
SRAmoney<-ggplot(data=data, aes(data$SRAmoney))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  labs(x="SRA Money Scores", y="Percent") +ggtitle("Panel J: Monetary SRA Scores")+
  
  ggsave("~/Desktop/thesis/paper/images/SRAmoney.jpg", width=11, height=8.5)
pdf("~/Desktop/thesis/paper/images/Figure3.pdf",width=11,height=8.5)
grid.arrange(SRA, SRAmoney, nrow=2)
dev.off()



#UG1
UG1<-ggplot(data=data, aes(data$UG1))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  ggtitle("Panel C: Ultimatum Game Proposers") +
  labs(x="Pass Rate", y="Percent") + ylim(c(0,45))+
  scale_x_continuous(breaks=seq(0,1,0.1))
ggsave("~/Desktop/thesis/output/UG1.pdf", width=11, height=8.5)


#UG2
UG2<-ggplot(data=data, aes(data$UG2))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") 
  ggtitle("Panel D: Ultimatum Game Responders")+
  labs(x="Minimum Contribution Accepted", y="Percent")+ylim(c(0,45))+
  scale_x_continuous(breaks=seq(0,1,0.1))

ggsave("~/Desktop/thesis/output/UG2.pdf", width=11, height=8.5)


#TG1

TG1<-ggplot(data=data, aes(data$TG1))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +ylim(c(0,45))+
  #  labs(title="Total SRA Scores") +
  labs(x="Pass Rate", y="Percent")+
  scale_x_continuous(breaks=seq(0,1,0.1)) +
  ggtitle("Panel E: Trust Game Proposers")

ggsave("~/Desktop/thesis/output/TG1.pdf", width=11, height=8.5)

#PGG
PGG<-ggplot(data=data, aes(data$PGG))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  labs(x="Pass Rate", y="Percent")+ylim(c(0,45))+
  scale_x_continuous(breaks=seq(0,1,0.1)) +
  ggtitle("Panel F: Public Goods Game")

ggsave("~/Desktop/thesis/output/PGG.pdf", width=11, height=8.5)

pdf("~/Desktop/thesis/paper/images/Figure2b.pdf",width=11,height=8.5)
grid.arrange(UG1, UG2, TG1, PGG, nrow=2)
dev.off()

#TG2 - reciprocity

TG2<-ggplot(data=data, aes(data$TG2)) + 
  geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=.05) +
  labs(x="Reciprocity", y="Percent") +
  ggtitle("Panel G: Reciprocity Levels") + 
  scale_x_continuous(breaks=seq(-0.5, 1, by=0.1)) + ylim(c(0,28))
ggsave("~/Desktop/thesis/paper/images/TG2.pdf", width=11, height=8.5)


TG<-ggplot(data=data, aes(data$avgreturn)) + 
  geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=0.05)+
  ylim(c(0,28))+labs(x="Repayment Rate", y="Percent") + ggtitle("Panel H: Average Repayment Rate") +
  scale_x_continuous(breaks=seq(0, 1, by=0.1))
ggsave("~/Desktop/thesis/paper/images/TG.pdf", width=11, height=8.5)
pdf("~/Desktop/thesis/paper/images/Figure2c.pdf",width=11,height=8.5)
grid.arrange(TG2, TG, nrow=2)
dev.off()




#donations dataset

data$donated<-1
data$donated[data$current_donor_status=="Never"]<-0
prop.table(table(data$donated))
donated<-ggplot(data=data, aes(data$donated))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  labs(x="Donated", y="Percent") + scale_x_continuous(breaks=seq(0,1,1)) + ylim(c(0,80))+
  ggtitle("Panel K: Donations")
ggsave("~/Desktop/thesis/paper/images/donated.pdf", width=11, height=8.5)


data$donations<-as.numeric(data$DNR_GIVING)
data$d<-data$donations
data$d[data$d>100]<-120
d1<-data[data$donations>100,]

summary(data$donation)
donations<-ggplot(data=data, aes(data$d))+geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=10)+
  labs(x="Donation Amount", y="Percent")+scale_x_continuous(breaks=seq(0,100,10))+
  ylim(c(0,60))+
  ggtitle("Panel L: Average Donation Amount")
ggsave("~/Desktop/thesis/paper/images/donations.pdf", width=11, height=8.5)


pdf("~/Desktop/thesis/paper/images/Figure4.pdf",width=11,height=8.5)
grid.arrange(donated, donations, nrow=2)
dev.off()

data2018<-data[data$CLASS_YR==2018,]
data2018$donations1[data2018$donations1>=500]<-NA
data2017<-data[data$CLASS_YR==2017,]
data2017$donations1[data2017$donations1>=500]<-NA
data2016<-data[data$CLASS_YR==2016,]
data2016$donations1[data2016$donations1>=400]<-NA
data2015<-data[data$CLASS_YR==2015,]
data2015$donations1[data2015$donations1>=300]<-NA
data2014<-data[data$CLASS_YR==2014,]
data2014$donations1[data2014$donations1>=400]<-NA
data2013<-data[data$CLASS_YR==2013,]
data2013$donations1[data2013$donations1>=2000]<-NA
# install.packages("ggplot2")
# library(ggplot2)
# donations2018<-ggplot(data2018, aes(data2018$d)) +geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=5)+
#   labs(x="Donation Amount", y="Percent")+scale_x_continuous(breaks=seq(0,35,5))+
#   ylim(c(0,100))+
#   ggtitle("2018 Donation Amounts")
# 
# donations2017<-ggplot(data2017, aes(data2017$d)) +geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=5)+
#   labs(x="Donation Amount", y="Percent")+scale_x_continuous(breaks=seq(0,40,5))+
#   ylim(c(0,80))+
#   ggtitle("2017 Donation Amounts")
# donations2016<-ggplot(data2016, aes(data2016$d)) +geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=5)+
#   labs(x="Donation Amount", y="Percent")+scale_x_continuous(breaks=seq(0,40,5))+
#   ylim(c(0,35))+
#   ggtitle("2016 Donation Amounts")
# 
# donations2015<-ggplot(data2015, aes(data2015$d)) +geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=5)+
#   labs(x="Donation Amount", y="Percent")+scale_x_continuous(breaks=seq(0,90,5))+
#   ylim(c(0,35))+
#   ggtitle("2015 Donation Amounts")
# 
# donations2014<-ggplot(data2014, aes(data2014$d)) +geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=5)+
#   labs(x="Donation Amount", y="Percent")+scale_x_continuous(breaks=seq(0,70,5))+
#   ylim(c(0,35))+
#   ggtitle("2014 Donation Amounts")

# data$donations2<-data$donations1
# data$donatoins2[data$donations1>1000]<-NA
# summary(data$donations[data$CLASS_YR==2018])
# summary(data$donations[data$CLASS_YR==2017])
# summary(data$donations[data$CLASS_YR==2016])
# summary(data$donations[data$CLASS_YR==2015])
# summary(data$donations[data$CLASS_YR==2014])
# summary(data$donations[data$CLASS_YR==2013])

summary(data2018$donations1)
summary(data2017$donations1)
summary(data2016$donations1)
summary(data2015$donations1)
summary(data2014$donations1)
summary(data2013$donations1)

summary(data2018$donated)
summary(data2017$donated)
summary(data2016$donated)
summary(data2015$donated)
summary(data2014$donated)
summary(data2013$donated)

df<-data.frame(classyr=c("2018", "2017", "2016", "2015", "2014", "2013"),
               avgdonations=c(2.779, 7.276, 11.99, 26.09, 44.02, 68.87),
               donated=c(0.2857, 0.6316, 0.7231, 0.6875, 0.7143, 0.9074))

avgdonation<-ggplot(df, aes(classyr, avgdonations)) + geom_bar(stat="identity") +
  #geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=5)+
  labs(x="Class Year", y="Average Donation Amount")+
  ggtitle("Panel N: Average Donation Amount by Class Year")

avgdonated<-ggplot(df, aes(classyr, donated)) + geom_bar(stat="identity") +
  #geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=5)+
  labs(x="Class Year", y="Percent Donated")+
  ggtitle("Panel M: Percent Donated by Class Year")

pdf("~/Desktop/thesis/paper/images/Figure6.pdf",width=11,height=8.5)
grid.arrange(avgdonated, avgdonation, nrow=2)
dev.off()
library(gridExtra)
# e<-data[data$donation>625,]
# prop.table(table(e$donation))
# summary(data$donation)

#GDG

alpha<-ggplot(data=data, aes(data$alpha)) + geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=0.05)+
  scale_x_continuous(breaks=seq(0, 1, by=0.1)) +
  #ylim(c(0,28))+
  labs(x="Alpha", y="Percent") +
  ggtitle("Panel A: Alpha")
ggsave("~/Desktop/thesis/paper/images/alpha.pdf", width=11, height=8.5)


#data$rho1[data$rho1>1]<-NA
data1<-data
data1$rho1<-data1$rho
data1$rho1[data1$rho1<(-1)]<-(-1.25)
#data2<-data[data$rho>1,]

rho<-ggplot(data=data1, aes(x=rho1)) + 
  geom_histogram(aes(x=rho1, y=100*(..count..)/sum(..count..)), binwidth=0.05)+
  #geom_histogram(aes(x=data1$rho1[data1$rho1==-1.25], y=100*(..count..)/sum(..count..)),binwidth=0.05)+
  scale_x_continuous(breaks=seq(-1, 1, by=0.1)) +
  labs(x="Rho", y="Percent") +
  ggtitle("Panel B: Rho")
ggsave("~/Desktop/thesis/paper/images/rho.pdf", width=11, height=8.5)


# data2<-data[data$rho<=1 & data$rho>=-1,]
# plot(data2$rho, data2$alpha)
# fig<-ggplot(data2, aes(x=rho, y=alpha)) +
#   geom_point(size=2) + labs(x="Rho", y="Alpha") +
#   ggtitle("Panel C: Scatterplot of CES Parameters")

# sigma<-ggplot(data=data, aes(x=data$sigma)) + 
#   geom_histogram(aes(x=data$sigma, y=100*(..count..)/sum(..count..)), binwidth=1)+
#   #geom_histogram(aes(x=data1$rho1[data1$rho1==-1.25], y=100*(..count..)/sum(..count..)),binwidth=0.05)+
#   scale_x_continuous(breaks=seq(-1, 1, by=0.1)) +
#   ylim(c(0,25))+
#   labs(x="Sigma", y="Percent") +
#   ggtitle("Panel C: Sigma")

pdf("~/Desktop/thesis/paper/images/Figure2a.pdf",width=11,height=8.5)
grid.arrange(alpha, rho, nrow=2)
dev.off()


#Spearmans p
dat<-data[,c("alpha", "UG1", "UG2", "TG1", "TG2", "PGG", "SRAtotal")]
library(xtable)
library(Hmisc)

corstars <-function(x, method=c("pearson", "spearman"), #removeTriangle=c("upper", "lower"),
                    result=c("none", "html", "latex")){
  #Compute correlation matrix
  require(Hmisc)
  x <- as.matrix(x)
  correlation_matrix<-rcorr(x, type=method[1])
  R <- correlation_matrix$r # Matrix of correlation coeficients
  p <- correlation_matrix$P # Matrix of p-value 
  
  ## Define notions for significance levels; spacing is important.
  #mystars <- ifelse(p < .0001, "****", ifelse(p < .001, "*** ", ifelse(p < .01, "**  ", ifelse(p < .05, "*   ", "    "))))
  mystars <- ifelse(p < .01, "***", ifelse(p < .05, "**", ifelse(p<.1, "*", " ")))
  
  ## trunctuate the correlation matrix to two decimal
  R <- format(round(cbind(rep(-1.11, ncol(x)), R), 2))[,-1]
  
  ## build a new matrix that includes the correlations with their apropriate stars
  Rnew <- matrix(paste(R, mystars, sep=""), ncol=ncol(x))
  diag(Rnew) <- paste(diag(R), " ", sep="")
  rownames(Rnew) <- colnames(x)
  colnames(Rnew) <- paste(colnames(x), "", sep="")
  
  #   ## remove upper triangle of correlation matrix
  #   if(removeTriangle[1]=="upper"){
  #     Rnew <- as.matrix(Rnew)
  #     Rnew[upper.tri(Rnew, diag = TRUE)] <- ""
  #     Rnew <- as.data.frame(Rnew)
  #   }
  #   
  #   ## remove lower triangle of correlation matrix
  #   else if(removeTriangle[1]=="lower"){
  #     Rnew <- as.matrix(Rnew)
  #     Rnew[lower.tri(Rnew, diag = TRUE)] <- ""
  #     Rnew <- as.data.frame(Rnew)
  #   }
  #   
  ## remove last column and return the correlation matrix
  Rnew<-as.matrix(Rnew)
  Rnew<-as.data.frame(Rnew)
  Rnew <- cbind(Rnew[1:length(Rnew)])
  if (result[1]=="none") return(Rnew)
  else{
    if(result[1]=="html") print(xtable(Rnew), type="html")
    else print(xtable(Rnew), type="latex") 
  }
} 

corstars(dat, method="pearson", result="latex")

dat1<-data[,c("alpha","rho", "UG1", "UG2", "TG1", "TG2", "PGG", "SRAtotal", "SRAmoney")]
corstars(dat1, method="pearson", result="latex")


# regression

data$donations1<-data$donations
data$donations<-log(data$donations)
data$donations[data$donations==-Inf]<-NA
summary(data$donations)
hist(data$donations)
hist(data$donations1)
data$yr2018<-0
data$yr2017<-0
data$yr2016<-0
data$yr2015<-0
data$yr2014<-0
data$yr2013<-0
data$yr2018[data$CLASS_YR==2018]<-1
data$yr2017[data$CLASS_YR==2017]<-1
data$yr2016[data$CLASS_YR==2016]<-1
data$yr2015[data$CLASS_YR==2015]<-1
data$yr2014[data$CLASS_YR==2014]<-1
data$yr2013[data$CLASS_YR==2013]<-1
model1<-lm(donations~alpha, data=data)
model2<-lm(donations~rho, data=data)
model3<-lm(donations~UG1, data=data)
model4<-lm(donations~UG2, data=data)
model5<-lm(donations~TG1, data=data)
model6<-lm(donations~TG2, data=data)
model7<-lm(donations~PGG, data=data)
model8<-lm(donations~alpha+rho+UG1+UG2+TG1+TG2+PGG, data=data)
model9<- lm(donations~SRAtotal, data=data)
model10<-lm(donations~SRAmoney, data=data)
model11 <- lm(donations ~ alpha +rho+ UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal, data=data)
model12 <- lm(donations ~ alpha +rho+ UG1 + UG2 + TG1 + TG2 + PGG + SRAmoney, data=data)

model1<-lm(donations~alpha+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model2<-lm(donations~rho+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model3<-lm(donations~UG1+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model4<-lm(donations~UG2+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model5<-lm(donations~TG1+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model6<-lm(donations~TG2+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model7<-lm(donations~PGG+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model8<-lm(donations~alpha+rho+UG1+UG2+TG1+TG2+PGG+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model9<- lm(donations~SRAtotal+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model10<-lm(donations~SRAmoney+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model11 <- lm(donations ~ alpha +rho+ UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
model12 <- lm(donations ~ alpha +rho+ UG1 + UG2 + TG1 + TG2 + PGG + SRAmoney+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)


stargazer(model1,type="latex",
          dep.var.labels=c("Donations"))
          

stargazer(model1, model2, model3, model4, model5, model6,model7,model8,model9, model10, model11,model12,type="latex",
          dep.var.labels=c("Donations"),
          covariate.labels=c("Alpha", "Rho","Ultimatum1", "Ultimatum2", "Trust1", 
                             "Trust2", "Cooperation", "SRAtotal", "SRAmoney",
                             "2017", "2016", "2015", "2014", "2013"))


m<-vglm(donations~alpha, data=data, tobit(lower=0, upper=50))
summary(m)

t<-censReg(donations1 ~ alpha+rho+UG1+UG2+TG1+TG2+PGG, data=data, left=0,right=50)

#t<-censReg(donations1 ~ SRAmoney, data=data, right=50)

summary(t)
t<-tobit(donations ~ rho, data=data, left=0, right=50)



install.packages("AER")
library(AER)
mse<-mean(t$df.residual^2)
summary(t)
fm <- t

fm0 <- update(fm, . ~ 1)

1 - as.vector(logLik(fm)/logLik(fm0))

stargazer(model8, model9, model10, model11, type="latex",
          dep.var.labels=c("Donations"),
          covariate.labels=c("Alpha", "UG1", "UG2", "TG1", 
                             "Reciprocity", "PGG", "SRAtotal", "SRAmoney"))

model12<-glm(donated~alpha+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model12)
model13<-glm(donated~rho+yr2017+yr2016+yr2015+yr2014+yr2013,data=data)
pR2(model13)
model14<-glm(donated~UG1+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model14)
model15<-glm(donated~UG2+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model15)
model16<-glm(donated~TG1+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model16)
model17<-glm(donated~TG2+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model17)
model18<-glm(donated~PGG+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model18)
model19<-glm(donated~alpha+rho+UG1+UG2+TG1+TG2+PGG+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model19)
model20<- glm(donated~SRAtotal+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model20)
model21<-glm(donated~SRAmoney+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model21)
model22 <- glm(donated ~ alpha +rho+ UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model22)
model23 <- glm(donated ~ alpha+rho + UG1 + UG2 + TG1 + TG2 + PGG + SRAmoney+yr2017+yr2016+yr2015+yr2014+yr2013, data=data)
pR2(model23)

summary(model19)

stargazer(model12, model13, model14, model15, model16, model17,model18,model19,model20,model21,model22,model23, type="latex",
          dep.var.labels=c("Donated"),
          covariate.labels=c("Alpha", "Rho","Ultimatum1", "Ultimatum2", "Trust1", 
                             "Trust2", "Cooperation","SRAtotal", "SRAmoney",
                             "2017", "2016", "2015", "2014", "2013"))



pR2(model22)

mse1 <- mean(model1$residuals^2)
mse2 <- mean(model2$residuals^2)
mse3 <- mean(model3$residuals^2)
mse4 <- mean(model4$residuals^2)
mse5 <- mean(model5$residuals^2)
mse6<-mean(model6$residuals^2)
mse7<-mean(model7$residuals^2)
mse8<-mean(model8$residuals^2)
mse9<-mean(model9$residuals^2)
mse10<-mean(model10$residuals^2)
mse11<-mean(model11$residuals^2)
mse12<-mean(model12$residuals^2)
mse13<-mean(model13$residuals^2)
mse14<-mean(model14$residuals^2)
mse15<-mean(model15$residuals^2)
mse16<-mean(model16$residuals^2)
mse17<-mean(model17$residuals^2)
mse18<-mean(model18$residuals^2)
mse19<-mean(model19$residuals^2)
mse20<-mean(model20$residuals^2)
mse21<-mean(model21$residuals^2)
mse22<-mean(model22$residuals^2)

#Best subset model selection with R
data1<-data[,c("donations", "alpha","rho", "sigma", "UG1", "UG2", "TG1", "TG2","avgreturn","PGG",
               "SRA1", "SRA2","SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10",
               "SRAtotal", "SRAmoney")]
data2<-data[,c("donations", "alpha","UG1", "UG2", "TG1", "TG2","avgreturn","PGG",
               "SRA1", "SRA2","SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10",
               "SRAtotal", "SRAmoney")]
data3<-data[,c("donations", "alpha","UG1", "UG2", "TG1", "TG2","avgreturn","PGG",
               "SRAtotal", "SRAmoney")]
data4<-data[,c("donated", "alpha","UG1", "UG2", "TG1", "TG2","avgreturn","PGG",
               "SRAtotal", "SRAmoney")]
data5<-data[,c("donated", "alpha","rho", "sigma", "UG1", "UG2", "TG1", "TG2","avgreturn","PGG",
               "SRA1", "SRA2","SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10",
               "SRAtotal", "SRAmoney")]
#continuous
regsubsets.out<-regsubsets(donations~alpha+rho+UG1+UG2+TG1+TG2+avgreturn+PGG+
                             SRA1+SRA2+SRA3+SRA4+SRA5+SRA6+SRA7+SRA8+SRA9+SRA10,#+
                             #SRAtotal+SRAmoney, 
                           data=data,
                           nbest=1,
                           nvmax=NULL,
                           force.in=NULL, force.out=NULL,
                           method="exhaustive")
summary.out<-summary(regsubsets.out)
as.data.frame(summary.out$outmat)
plot(regsubsets.out,scale="adjr2",main="Adjusted R2")
which.max(summary.out$adjr2)
summary.out$which[6,]
best.model<-lm(donations~rho+SRA3+SRA4+SRA5+SRA6+SRA10,data=data)
best.model<-vglm(donations~rho+SRA3+SRA4+SRA5+SRA6+SRA10,data=data,
                 tobit(Lower=0,Upper=50))
summary(best.model)

stargazer(best.model,type="latex",
          dep.var.labels=c("Donations"),
          covariate.labels=c("Rho", "SRA3", "SRA4", "SRA5", 
                             "SRA6", "SRA10"))



summary(best.model)

#logistic
install.packages("bestglm")
library(bestglm)
lbw.for.logistic<-within(data5, {
  y<-donated
  sigma<-NULL
  donated<-NULL
  SRAtotal<-NULL
  SRAmoney<-NULL
#   SRA1<-NULL
#   SRA2<-NULL
#   SRA3<-NULL
#   SRA4<-NULL
#   SRA5<-NULL
#   SRA6<-NULL
#   SRA7<-NULL
#   SRA8<-NULL
#   SRA9<-NULL
#   SRA10<-NULL
})
res.bestglm<-
  bestglm(Xy=lbw.for.logistic,
          family=gaussian,
          IC="AIC",
          method="exhaustive")
res.bestglm$BestModels

best.model.log1<-glm(donated~SRA3+SRA4+SRA8+SRA10,data=data)
best.model.log2<-glm(donated~SRA3+SRA4+SRA7+SRA8+SRA10,data=data)
best.model.log3<-glm(donated~alpha+SRA3+SRA4+SRA8+SRA10,data=data)
best.model.log4<-glm(donated~alpha+SRA3+SRA4+SRA7+SRA8+SRA10,data=data)
best.model.log5<-glm(donated~UG2+SRA3+SRA4+SRA8+SRA10,data=data)

summary(best.model.log)
library(pscl)
pR2(best.model.log5)

best.subset<-regsubsets(y~.,lbw.for.logistic)
best.subset.summary<-summary(best.subset)
best.subset.summary$outmat
best.subset.by.cp<-which.min(best.subset.summary$cp)
best.subset.by.cp


stargazer(best.model.log3, best.model.log4, best.model.log5, best.model.log1,
          best.model.log2, type="latex",
          dep.var.labels=c("Donated"),
          covariate.labels=c("alpha", "UG2", "SRA3", "SRA4", "SRA8", "SRA10"))
pR2(best.model.log2)



lbw.for.glm<-within(data1, {
  y<-donations
  sigma<-NULL
  donations<-NULL
  SRAtotal<-NULL
  SRAmoney<-NULL
  #   SRA1<-NULL
  #   SRA2<-NULL
  #   SRA3<-NULL
  #   SRA4<-NULL
  #   SRA5<-NULL
  #   SRA6<-NULL
  #   SRA7<-NULL
  #   SRA8<-NULL
  #   SRA9<-NULL
  #   SRA10<-NULL
})
summary(lbw.for.glm$y)
lbw.for.glm<-na.omit(lbw.for.glm)

res.best.glm<-
  bestglm(Xy=lbw.for.glm,
          family=gaussian,
          IC="AIC",
          method="exhaustive")
summary(lbw.for.glm$y)
res.best.glm$BestModels
best.model.lm1<-vglm(donations~rho,data=data, tobit(Lower=0,Upper=50))

summary(censReg(donations~rho, data=data, left=0, right=50))

best.model.lm1<-lm(donations~UG1+TG2+SRA3+SRA4+SRA5+SRA6, data=data)
best.model.lm2<-lm(donations~UG1+UG2+TG2+SRA3+SRA4+SRA5+SRA6, data=data)
best.model.lm3<-lm(donations~UG1+TG2+SRA1+SRA3+SRA4+SRA5+SRA6, data=data)
best.model.lm4<-lm(donations~UG1+TG2+PGG+SRA3+SRA4+SRA5+SRA6, data=data)
best.model.lm5<-lm(donations~UG1+TG1+TG2+PGG+SRA3+SRA4+SRA5+SRA6, data=data)

stargazer(best.model.lm2, best.model.lm4, best.model.lm5, best.model.lm1,
          best.model.lm3,type="latex",
          dep.var.labels=c("Log(Donations)"),
          covariate.labels=c("UG1","UG2", "TG1", "TG2","PGG", "SRA1", "SRA3", "SRA4", "SRA5", "SRA6"))




t<-tobit(donations~rho,data=data,left=0,right=50)
summary(t)
fm <- t

fm0 <- update(fm, . ~ 1)

1 - as.vector(logLik(fm)/logLik(fm0))



library(VGAM)
library(censReg)

summary(best.model.lm)
m<-lm(donations~rho,data=data)
stargazer(m, type="latex",
          dep.var.labels=c("Donations"),
          covariate.labels=c("Rho"))

summary(best.model.log)

library(leaps)
best.subset<-regsubsets(y~.,lbw.for.glm)
best.subset.summary<-summary(best.subset)
best.subset.summary$outmat
best.subset.by.cp<-which.min(best.subset.summary$cp)
best.subset.by.cp



# install.packages("glmulti")
# library(glmulti)
# install.packages("rJava")
# library(rJava)
# glmulti.lm.out<-glmulti(donations~alpha+rho+UG1+UG2+TG1+TG2+avgreturn+PGG+
#           SRA1+SRA2+SRA3+SRA4+SRA5+SRA6+SRA7+SRA8+SRA9+SRA10+
#           SRAtotal+SRAmoney,data=data,
#         level=1,
#         method="h",
#         crit="aic",
#         confsetsize=5,
#         plotty=F,report=F,
#         fitfunction="lm")




pairs(data1)
cor(data1)
install.packages("leaps")
library(leaps)
#best subset continuous

m<-vglm(donations~alpha+ UG1 + UG2 + TG1 + TG2 + PGG + SRAmoney,
        tobit(Lower=0, Upper=50),data=dat)

best.subset<-regsubsets(donations~., data1)
best.subset.summary<-summary(best.subset)
best.subset.summary$outmat
best.subset.by.adjr2<-which.max(best.subset.summary$adjr2)
best.subset.by.adjr2
best.subset.by.bic <- which.min(best.subset.summary$bic)
best.subset.by.bic
best.subset.by.cp <- which.min(best.subset.summary$cp)
best.subset.by.cp
#best subset binary
best.subset<-regsubsets(donated~., data5, nbest=1)
best.subset.summary<-summary(best.subset)
best.subset.summary$outmat
best.subset.by.adjr2<-which.max(best.subset.summary$adjr2)
best.subset.by.adjr2
best.subset.by.bic <- which.min(best.subset.summary$bic)
best.subset.by.bic
best.subset.by.cp <- which.min(best.subset.summary$cp)
best.subset.by.cp


#continuous forward/backwards/stepwise
#forward selection
#null=vglm(donations~1,data=data1,tobit(Lower=0, Upper=50))
#full=vglm(donations~alpha+rho+sigma+UG1+UG2+TG1+TG2+avgreturn+PGG+
            #SRA1+SRA2+SRA3+SRA4+SRA5+SRA6+SRA7+SRA8+SRA9+SRA10+
            #SRAtotal+SRAmoney,data=data1,tobit(Lower=0,Upper=50))
null=lm(donations~1, data=data1)
full=lm(donations~., data=data1)
step(null, scope=list(lower=null, upper=full), direction="forward")
#backwards selection
step(full, data=data2, direction="backward")
#stepwise regression
step(null, scop=list(upper=full), data=data2, direction="both")

#binary forward/backwards/stepwise
#forward selection
null=glm(donated~1, data=data5)
full=glm(donated~., data=data5)
step(null, scope=list(lower=null, upper=full), direction="forward")
#backwards selection
step(full, data=data5, direction="backward")
#stepwise regression
step(null, scope=list(upper=full), data=data5, direction="both")

dat<-data[,c("donated", "alpha", "rho", "UG1", "UG2",
             "TG1", "TG2", "avgreturn", "PGG", "SRA1", "SRA2",
             "SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10")]
null=glm(donated~1, data=dat)
null
full=glm(donated~., data=dat)
full
step(null,scope=list(upper=full),data=dat,
     direction="both")

dat<-data[,c("donations", "alpha", "rho", "UG1", "UG2",
             "TG1", "TG2", "avgreturn", "PGG", "SRA1", "SRA2",
             "SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10")]
null=lm(donations~1, data=dat)
null
full=vglm(donations~alpha+rho+UG1+UG2+TG1+TG2+avgreturn+PGG+
          SRA1+SRA2+SRA3+SRA4+SRA5+SRA6+SRA7+SRA8+SRA9+SRA10,
        data=dat, tobit(Lower=0, Upper=50))
full=lm(donations~.,data=dat)
full
step(null,scope=list(upper=full),data=dat,
     direction="both")


summary(vglm(donations~rho,data=data,
     tobit(Lower=0,Upper=50)))
summary(censReg(donations~rho, data=dat, left=0, right=50))

#ridge/lasso
install.packages("glmnet")
library(glmnet)
x<-model.matrix(donations~., data1)[,-1]
y<-data1$donations
cv.out<-cv.glmnet(x,y,alpha=1,type.measure="mse")
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_min)
coef(cv.out,s=lambda_1se)



dat<-data[,c("donated", "alpha", "rho", "UG1", "UG2",
             "TG1", "TG2", "avgreturn", "PGG", "SRA1", "SRA2",
             "SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10")]
dat$donated<-as.factor(dat$donated)
xfactors<-model.matrix(donated~alpha+rho+UG1+UG2+
                        TG2+TG2+avgreturn+PGG+SRA1+SRA2+SRA3+
                        SRA4+SRA5+SRA6+SRA7+SRA8+SRA9+SRA10, 
                      data=dat)[,-1]
x<-as.matrix(xfactors)
x<-model.matrix(donated~., data=dat)
y<-dat$donated
cv.out<-cv.glmnet(x,y,alpha=1, family="binomial", type.measure="mse")
#plot(cv.out)
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_1se)
coef(cv.out,s=lambda_min)

m<-glm(donated~alpha+UG1+UG2+TG1+TG2+PGG+SRAtotal,
       data=data)
stargazer(m, type="latex")
dat<-data[,c("donated", "alpha", "rho", "UG1", "UG2",
             "TG1", "TG2", "avgreturn", "PGG", "SRA1", "SRA2",
             "SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10")]
dat$donated<-as.factor(dat$donated)
dat[,"train"]<-ifelse(runif(nrow(dat))<0.8,1,0)
trainset<-dat[dat$train==1,]
testset<-dat[dat$train==0,]
trainColNum<-grep("train",names(trainset))
trainset<-trainset[,-trainColNum]
testset<-testset[,-trainColNum]
typeColNum<-grep("donated",names(dat))
glm_model<-glm(donated~.,data=trainset,family=binomial)
summary(glm_model)
glm_prob<-predict.glm(glm_model,testset[,-typeColNum],type="response")
#contrasts(dat$donated)
glm_predict<-rep("neg",nrow(testset))
glm_predict[glm_prob<.5]<-"pos"
table(pred=glm_predict,true=testset$donated)
mean(glm_predict==testset$donated)



x<-model.matrix(donated~.,trainset)
y<-trainset$donated
cv.out<-cv.glmnet(x,y,alpha=1,family="binomial",
                  type.measure="mse")
#plot(cv.out)
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_1se)
coef(cv.out,s=lambda_min)

set<-data[,c("donated", "alpha", "rho", "UG1", "UG2",
             "TG1", "TG2", "avgreturn", "PGG", "SRA1",
             "SRA2", "SRA3", "SRA4", "SRA5", "SRA6", 
             "SRA7", "SRA8", "SRA9", "SRA10")]
x<-model.matrix(donated~.,set)
y<-set$donated
cv.out<-cv.glmnet(x,y,alpha=1,family="binomial",
                  type.measure="mse")
#plot(cv.out)
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_1se)
coef(cv.out,s=lambda_min)
install.packages('lars')
library(lars)
install.packages('covTest')
library(covTest)
x<-model.matrix(donated~.,set)[,-1]
y<-set$donated
cv.out<-cv.glmnet(x,y,alpha=1,family="binomial",
                  type.measure="mse")
#plot(cv.out)
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_1se)
coef(cv.out,s=lambda_min)
m<-lars(x,y,type="lasso")
covTest(m,x,y)
summary(m)
summary.lars(m)


set<-data[,c("donations", "alpha", "rho", "UG1", "UG2",
             "TG1", "TG2", "avgreturn", "PGG", "SRA1",
             "SRA2", "SRA3", "SRA4", "SRA5", "SRA6", 
             "SRA7", "SRA8", "SRA9", "SRA10")]
x<-model.matrix(donations~.,set)
y<-set$donations
cv.out<-cv.glmnet(x,y,alpha=1,family="gaussian",
                  type.measure="mse")
#plot(cv.out)
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_1se)
coef(cv.out,s=lambda_min)




#get test data
x_test <- model.matrix(donated~.,testset)
#predict class, type=”class”
lasso_prob <- predict(cv.out,newx = x_test,s=lambda_min,type="response")
#translate probabilities to predictions
lasso_predict <- rep("neg",nrow(testset))
lasso_predict[lasso_prob>.5] <- "pos"
#confusion matrix
table(pred=lasso_predict,true=testset$donated)
mean(lasso_predict==testset$donated)





lasso<-glm(donated~SRA3+SRA4, data=data)

stargazer(lasso, type="latex",
          dep.var.labels=c("Donated"),
          covariate.labels=c("SRA3", "SRA4"))



dat<-data[,c("donations", "alpha", "rho", "UG1", "UG2",
             "TG1", "TG2", "avgreturn", "PGG", "SRA1", "SRA2",
             "SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10")]

xfactors<-model.matrix(donations~alpha+rho+UG1+UG2+
                         TG2+TG2+avgreturn+PGG+SRA1+SRA2+SRA3+
                         SRA4+SRA5+SRA6+SRA7+SRA8+SRA9+SRA10, 
                       data=dat)[,-1]
y<-dat$donations
x<-as.matrix(xfactors)
cv.out<-cv.glmnet(x,y,alpha=1, family="gaussian",type.measure="mse")
#plot(cv.out)
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_1se)
coef(cv.out,s=lambda_min)

install.packages("lars")
library(lars)
lasso<-lars(x,y,type="lasso")
summary(lasso)


plot(glmmod,xvar="lambda")
glmmod
cv.glmmod<-cv.glmnet(x,y,alpha=1)
plot(cv.glmmod)
(best.lambda<-cv.glmmod$lambda.min)




x<-model.matrix(donated~.,data4)[,-1]
y<-data4$donated
cv.out<-cv.glmnet(x,y,alpha=1,type.measure="mse")
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_min)

glmmod<-glmnet(x,y=as.factor(y),alpha=1,family="binomial")
plot(glmmod,xvar="lambda")
cv.glmmod<-cv.glmnet(x,y,alpha=1)
plot(cv.glmmod)
best.lambda<-cv.glmmod$lambda.min
coef(cv.glmmod,best.lambda)





#train/test - logistic
data$split<-0
data$split[data$CLASS_YR=='2017']<-1
data$split[data$CLASS_YR=='2018']<-5
train<-data[data$split==0,]
test<-data[data$split==1,]

model12<-glm(donated~alpha, data=train)
pR2(model12)
model13<-glm(donated~rho,data=train)
pR2(model13)
model14<-glm(donated~UG1, data=train)
pR2(model14)
model15<-glm(donated~UG2, data=train)
pR2(model15)
model16<-glm(donated~TG1, data=train)
pR2(model16)
model17<-glm(donated~TG2, data=train)
pR2(model17)
model18<-glm(donated~PGG, data=train)
pR2(model18)
model19<-glm(donated~alpha+rho+UG1+UG2+TG1+TG2+PGG, data=train)
pR2(model19)
model20<- glm(donated~SRAtotal, data=train)
pR2(model20)
model21<-glm(donated~SRAmoney, data=train)
pR2(model21)
model22 <- glm(donated ~ alpha +rho+ UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal, data=train)
pR2(model22)
model23 <- glm(donated ~ alpha+rho + UG1 + UG2 + TG1 + TG2 + PGG + SRAmoney, data=train)
pR2(model23)
library(stargazer)
stargazer(model12, model13, model14, model15, model16, model17,model18,model19,model20,model21,model22,model23, type="latex",
          dep.var.labels=c("Donated"),
          covariate.labels=c("Alpha", "Rho","Ultimatum1", "Ultimatum2", "Trust1", 
                             "Trust2", "Cooperation","SRAtotal", "SRAmoney"))
library(stargazer)



mean((test$donated - predict.lm(model23, test)) ^ 2)
#model with only SRAmoney is best


library(bestglm)
lbw.for.logistic<-within(train, {
  y<-donated
  ID<-NULL
  ResponseId<-NULL
  GENDER<-NULL
  CLASS_YR<-NULL
  MAJOR<-NULL
  current_donor_status<-NULL
  DNR_GIVING<-NULL
  DNR_TOTAL_YEARS<-NULL
  first_gift<-NULL
  last_gift<-NULL
  last_gift_amount<-NULL
  last_gift_for<-NULL
  donations<-NULL
  d<-NULL
  donations1<-NULL
  split<-NULL
  sigma<-NULL
  donated<-NULL
  SRAtotal<-NULL
  SRAmoney<-NULL
  donations2<-NULL
  donatoins2<-NULL
  #   SRA1<-NULL
  #   SRA2<-NULL
  #   SRA3<-NULL
  #   SRA4<-NULL
  #   SRA5<-NULL
  #   SRA6<-NULL
  #   SRA7<-NULL
  #   SRA8<-NULL
  #   SRA9<-NULL
  #   SRA10<-NULL
})
res.bestglm<-
  bestglm(Xy=lbw.for.logistic,
          family=gaussian,
          IC="AIC",
          method="exhaustive")
res.bestglm$BestModels

best.model.log1<-glm(donated~alpha+UG2+SRA3+SRA4,data=train)
best.model.log2<-glm(donated~alpha+SRA3+SRA4,data=train)
best.model.log3<-glm(donated~alpha+avgreturn+UG2+SRA3+SRA4,data=train)
best.model.log4<-glm(donated~alpha+avgreturn+SRA3+SRA4,data=train)
best.model.log5<-glm(donated~alpha+UG2+SRA3+SRA4+SRA10,data=train)

stargazer(best.model.log3, best.model.log4, best.model.log5, best.model.log1, best.model.log2,type="latex",
          dep.var.labels=c("Donated"),
          covariate.labels=c("Alpha",
                             "Average Return",
                             "Ultimatum2",
                             "SRA3", "SRA4", "SR10"))




summary(best.model.log)
mean((test$donated - predict.lm(best.model.log2, test)) ^ 2)
#model 4: alpha plus SRA items

library(glmnet)
x<-model.matrix(y~.,lbw.for.logistic)[,-1]
y<-lbw.for.logistic$y
cv.out<-cv.glmnet(x,y,alpha=1,type.measure="mse")
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_min)
coef(cv.out,s=lambda_1se)


lbw.for.logistic1<-within(test, {
  y<-donated
  ID<-NULL
  ResponseId<-NULL
  GENDER<-NULL
  CLASS_YR<-NULL
  MAJOR<-NULL
  current_donor_status<-NULL
  DNR_GIVING<-NULL
  DNR_TOTAL_YEARS<-NULL
  first_gift<-NULL
  last_gift<-NULL
  last_gift_amount<-NULL
  last_gift_for<-NULL
  donations<-NULL
  d<-NULL
  donations1<-NULL
  split<-NULL
  sigma<-NULL
  donated<-NULL
  SRAtotal<-NULL
  SRAmoney<-NULL
  donations2<-NULL
  donatoins2<-NULL
  #   SRA1<-NULL
  #   SRA2<-NULL
  #   SRA3<-NULL
  #   SRA4<-NULL
  #   SRA5<-NULL
  #   SRA6<-NULL
  #   SRA7<-NULL
  #   SRA8<-NULL
  #   SRA9<-NULL
  #   SRA10<-NULL
})
xtest<-model.matrix(y~.,lbw.for.logistic1)[,-1]
ytest<-test$donated
yhat<-predict(cv.out,s=lambda_min,newx=xtest)
mse<-mean((ytest-yhat)^2)
#0.3904766

m1<-lm(donated~alpha+UG2+SRA3+SRA4, data=data)

stargazer(m1,type="latex",
          dep.var.labels=c("Donated"),
          covariate.labels=c("Alpha",
                             "Ultimatum2",
                             "SRA3", "SRA4"))
library(lars)
m<-lars(x,y,type="lasso")
covTest(m,x,y)

library(covTest)
#train/test - linear
data$split<-0
data$split[data$CLASS_YR=='2017']<-1
data$split[data$CLASS_YR=='2018']<-5
train<-data[data$split==0,]
test<-data[data$split==1,]


model12<-lm(donations~alpha, data=train)
pR2(model12)
model13<-lm(donations~rho,data=train)
pR2(model13)
model14<-lm(donations~UG1, data=train)
pR2(model14)
model15<-lm(donations~UG2, data=train)
pR2(model15)
model16<-lm(donations~TG1, data=train)
pR2(model16)
model17<-lm(donations~TG2, data=train)
pR2(model17)
model18<-lm(donations~PGG, data=train)
pR2(model18)
model19<-lm(donations~alpha+rho+UG1+UG2+TG1+TG2+PGG, data=train)
pR2(model19)
model20<- lm(donations~SRAtotal, data=train)
pR2(model20)
model21<-lm(donations~SRAmoney, data=train)
pR2(model21)
model22 <- lm(donations ~ alpha +rho+ UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal, data=train)
pR2(model22)
model23 <- lm(donations ~ alpha+rho + UG1 + UG2 + TG1 + TG2 + PGG + SRAmoney, data=train)
pR2(model23)
mean((test$donated - predict.lm(model21, test)) ^ 2)
#model with all games + SRAmoney is best: 7.055587
stargazer(model12, model13, model14, model15, model16, model17,model18,model19,model20,model21,model22,model23, type="latex",
          dep.var.labels=c("Log(Donations)"),
          covariate.labels=c("Alpha", "Rho","Ultimatum1", "Ultimatum2", "Trust1", 
                             "Trust2", "Cooperation","SRAtotal", "SRAmoney"))


library(bestglm)
lbw.for.lm<-within(train, {
  y<-donations
  ID<-NULL
  ResponseId<-NULL
  GENDER<-NULL
  CLASS_YR<-NULL
  MAJOR<-NULL
  current_donor_status<-NULL
  DNR_GIVING<-NULL
  DNR_TOTAL_YEARS<-NULL
  first_gift<-NULL
  last_gift<-NULL
  last_gift_amount<-NULL
  last_gift_for<-NULL
  donations<-NULL
  d<-NULL
  donations1<-NULL
  split<-NULL
  sigma<-NULL
  donated<-NULL
  SRAtotal<-NULL
  SRAmoney<-NULL
donations2<-NULL
donatoins2<-NULL
  #   SRA1<-NULL
  #   SRA2<-NULL
  #   SRA3<-NULL
  #   SRA4<-NULL
  #   SRA5<-NULL
  #   SRA6<-NULL
  #   SRA7<-NULL
  #   SRA8<-NULL
  #   SRA9<-NULL
  #   SRA10<-NULL
})
lbw.for.lm<-na.omit(lbw.for.lm)
res.bestglm<-
  bestglm(Xy=lbw.for.lm,
          family=gaussian,
          IC="AIC",
          method="exhaustive")
res.bestglm$BestModels

best.model.lm1<-lm(donations~rho+TG2+PGG+SRA4+SRA5+SRA6,data=train)
best.model.lm2<-lm(donations~rho+TG2+UG1+PGG+SRA4+SRA5+SRA6,data=train)
best.model.lm3<-lm(donations~rho+TG2+PGG+SRA1+SRA4+SRA5+SRA6,data=train)
best.model.lm4<-lm(donations~rho+TG2+PGG+SRA2+SRA4+SRA5+SRA6,data=train)
best.model.lm5<-lm(donations~rho+TG2+UG1+PGG+SRA1+SRA4+SRA5+SRA6,data=train)


stargazer(best.model.lm5, best.model.lm2,best.model.lm3,best.model.lm4,best.model.lm1, type="latex",
          dep.var.labels=c("Log(Donations)"),
          covariate.labels=c("Rho","Trust2", "Ultimatum1", "PGG",
                             "SRA1", "SRA2", "SRA4", "SRA5", "SRA6"))




summary(best.model.log)
mean((test$donated - predict.lm(best.model.lm1, test)) ^ 2)

library(glmnet)
x<-model.matrix(y~.,lbw.for.lm)[,-1]
y<-lbw.for.lm$y
cv.out<-cv.glmnet(x,y,alpha=1,type.measure="mse")
lambda_min<-cv.out$lambda.min
lambda_1se<-cv.out$lambda.1se
coef(cv.out,s=lambda_min)
#coef(cv.out,s=lambda_1se)
mood<-lm(y~rho+avgreturn+PGG+SRA4+SRA5+SRA6, data=lbw.for.lm)
stargazer(mood, type="latex",
          dep.var.labels=c("Log(Donations)")),
          covariate.labels=c("Rho","Trust2", "Ultimatum1", 
                             "SRA1", "SRA2", "SRA4", "SRA5", "SRA6"))

lbw.for.lm1<-within(test, {
  y<-donations
  ID<-NULL
  ResponseId<-NULL
  GENDER<-NULL
  CLASS_YR<-NULL
  MAJOR<-NULL
  current_donor_status<-NULL
  DNR_GIVING<-NULL
  DNR_TOTAL_YEARS<-NULL
  first_gift<-NULL
  last_gift<-NULL
  last_gift_amount<-NULL
  last_gift_for<-NULL
  donations<-NULL
  d<-NULL
  donations1<-NULL
  split<-NULL
  sigma<-NULL
  donated<-NULL
  SRAtotal<-NULL
  SRAmoney<-NULL
  donations2<-NULL
  donatoins2<-NULL
  #   SRA1<-NULL
  #   SRA2<-NULL
  #   SRA3<-NULL
  #   SRA4<-NULL
  #   SRA5<-NULL
  #   SRA6<-NULL
  #   SRA7<-NULL
  #   SRA8<-NULL
  #   SRA9<-NULL
  #   SRA10<-NULL
})
lbw.for.lm1<-na.omit(lbw.for.lm1)
xtest<-model.matrix(y~.,lbw.for.lm1)[,-1]
ytest<-lbw.for.lm1$y
yhat<-predict(cv.out,s=lambda_min,newx=xtest)
mse<-mean((ytest-yhat)^2)


stargazer(lm(donations~SRA4+SRA6, data=data), type="latex",
          dep.var.labels=c("Log(Donations)"),
          covariate.labels=c("SRA4", "SRA6"))



m<-lars(x,y,type="lasso")
covTest(m,x,y)








#k-fold cross validation

yourData<-data[sample(nrow(data)),]
folds<-cut(seq(1,nrow(yourData)),breaks=5,labels=FALSE)
result<-list()
for(i in 1:5){
  testIndexes<-which(folds==i,arr.ind=TRUE)
  testData<-yourData[testIndexes,]
  trainData<-yourData[-testIndexes,]
  model<-lm(donations~alpha+UG1+UG2+TG1+TG2+PGG+SRAtotal,data=trainData)
  result[[i]]<-predict(model,testData)
}

install.packages("caret")
library(caret)
install.packages("klaR")
library(klaR)
train_control<-trainControl(method="cv",number=10)
model<-train(donations~.,data=data3,trControl=train_control)
summary(model)



install.packages("RCurl")
install.packages("prettyR")
require(RCurl)
require(prettyR)

url <- "https://raw.githubusercontent.com/gastonstat/CreditScoring/master/CleanCreditScoring.csv"
cs_data <- getURL(url)
cs_data <- read.csv(textConnection(cs_data))
describe(cs_data)

classes <- cs_data[, "Status"]
predictors <- cs_data[, -match(c("Status", "Seniority", "Time", "Age", "Expenses", 
                                 "Income", "Assets", "Debt", "Amount", "Price", "Finrat", "Savings"), colnames(cs_data))]











#tobit
install.packages("AER")
library(AER)
install.packages("censReg")
library(censReg)
modela<-tobit(donations ~ alpha + UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal, data=data, left=0, right=50)
modelb<-tobit(donations ~ alpha + UG1 + UG2 + TG1 + TG2 + PGG + SRAmoney, data=data, left=0)

stargazer(modela, type="latex",
          dep.var.labels=c("Donations"),
          covariate.labels=c("Alpha", "UG1", "UG2", "TG1", 
                             "Reciprocity", "PGG", "SRAtotal"))

stargazer(modelb, type="latex",
          dep.var.labels=c("Donations"),
          covariate.labels=c("Alpha", "UG1", "UG2", "TG1", 
                             "Reciprocity", "PGG", "SRAtotal"))



censReg(donations ~ alpha + UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal, data=data, left=0, right=50)

install.packages("VGAM")
library(VGAM)
dat<-data[,c("donations", "donated", "alpha","rho", "UG1", "UG2", "TG1", "TG2", "PGG", "SRAmoney", "SRAtotal")]
summary(m<-vglm(donations~alpha+ UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal,
                tobit(Lower=0, Upper=100),data=dat))



summary(m<-vglm(donations~alpha,
                tobit(Lower=0,Upper=50),data=dat))
summary(m<-vglm(donations~UG1,
                tobit(Lower=0,Upper=50),data=dat))
summary(m<-vglm(donations~UG2,
                tobit(Lower=0,Upper=50),data=dat))
summary(m<-vglm(donations~TG1,
                tobit(Lower=0,Upper=50),data=dat))
summary(m<-vglm(donations~TG2,
                tobit(Lower=0,Upper=50),data=dat))
summary(m<-vglm(donations~PGG,
                tobit(Lower=0,Upper=50),data=dat))
summary(m<-vglm(donations~SRAtotal,
                tobit(Lower=0,Upper=50),data=dat))
summary(m<-vglm(donations~alpha+ UG1 + UG2 + TG1 + TG2 + PGG + SRAtotal,
                tobit(Lower=0,Upper=50),data=dat))



m0<-update(m,.~1)
1-as.vector(logLik(m)/logLik(m0))



ctable<-coef(summary(m))
pvals<-2*pt(abs(ctable[,"z value"]),df.residual(m),lower.tail=FALSE)
cbind(ctable,pvals)

dat$yhat<-fitted(m)[,1]
dat$rr<-resid(m,type="response")
dat$rp<-resid(m,type="pearson")[,1]

par(mfcol=c(2,3))
with(dat, {
  plot(yhat, rr, main = "Fitted vs Residuals")
  qqnorm(rr)
  plot(yhat, rp, main = "Fitted vs Pearson Residuals")
  qqnorm(rp)
  plot(donations, rp, main = "Actual vs Pearson Residuals")
  plot(donations, yhat, main = "Actual vs Fitted")
})

(r<-with(dat,cor(yhat,donations)))
r^2

#caret - cross validation - doesn't work
dat<-data[,c("donated", "alpha","rho", "sigma", "UG1", "UG2", "TG1", "TG2","avgreturn","PGG",
              "SRA1", "SRA2","SRA3", "SRA4", "SRA5", "SRA6", "SRA7", "SRA8", "SRA9", "SRA10",
                    "SRAtotal", "SRAmoney")]
classes<-dat[,"donated"]
predictors<-dat[,c("alpha","UG1", "UG2", "TG1", "TG2", "PGG", "SRAtotal")]
train_set<-createDataPartition(classes, p=0.8,list=FALSE)
train_predictors<-predictors[train_set,]
train_classes<-classes[train_set]
test_predictors<-predictors[-train_set,]
test_classes<-classes[-train_set]

cv_splits<-createFolds(classes,k=10,returnTrain=TRUE)

cs_data_train<-dat[train_set,]
cs_data_test<-dat[-train_set,]
glmnet_grid <- expand.grid(alpha = c(0,  .1,  .2, .4, .6, .8, 1),
                           lambda = seq(.01, .2, length = 20))
glmnet_ctrl <- trainControl(method = "cv", number = 10)
glmnet_fit <- train(donated ~ ., data = cs_data_train,
                    method = "glmnet",
                    preProcess = c("center", "scale"),
                    tuneGrid = glmnet_grid,
                    trControl = glmnet_ctrl)

glmnet_fit
pred_classes <- predict(glmnet_fit, newdata = cs_data_test)
table(pred_classes)
pred_probs <- predict(glmnet_fit, newdata = cs_data_test, type = "prob")
head(pred_probs)






#match players to get winner
match <- data[,c("ResponseId", 
                 "public")]
popsize = 396
matches<-split(sample(match$ResponseId), rep(1:(popsize/2), each=2))
