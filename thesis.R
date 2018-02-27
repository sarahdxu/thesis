if(!require(reshape2)){
  install.packages("reshape2")
}
library(reshape2)
library(tidyr)
library(dplyr)
if(!require(ggplot2)){
  install.packages("ggplot2")
}
library(ggplot2)
library(gridExtra)
if(!require(minpack.lm)){
  install.packages("minpack.lm")
}
library(minpack.lm)


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

data$SRA<-data$SRA1+data$SRA2+data$SRA3+data$SRA4+data$SRA5+data$SRA6+
  data$SRA7+data$SRA8+data$SRA9+data$SRA10
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

#Remove entries where they accept and then reject -- doesn't make sense

i<-397
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
while (i<344){
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
data$UG2<-data$UG2/10

#General Dictator game
data <- data[-c(3:10, 15:19)]

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






data$pi_s1 <- data$m1-data$gendict1
data$pi_s2 <- data$m2-data$gendict2
data$pi_s3 <- data$m3-data$gendict3
data$pi_s4 <- data$m4-data$gendict4
data$pi_s5 <- data$m5-data$gendict5
data$pi_s6 <- data$m6-data$gendict6
data$pi_s7 <- data$m7-data$gendict7
data$pi_s8 <- data$m8-data$gendict8
data$pi_s9 <- data$m9-data$gendict9
data$pi_o1 <- data$gendict1/data$p1
data$pi_o2 <- data$gendict2/data$p2
data$pi_o3 <- data$gendict3/data$p3
data$pi_o4 <- data$gendict4/data$p4
data$pi_o5 <- data$gendict5/data$p5
data$pi_o6 <- data$gendict6/data$p6
data$pi_o7 <- data$gendict7/data$p7
data$pi_o8 <- data$gendict8/data$p8
data$pi_o9 <- data$gendict9/data$p9

data$Y1<-data$pi_s1/data$m1
data$Y2<-data$pi_s2/data$m2
data$Y3<-data$pi_s3/data$m3
data$Y4<-data$pi_s4/data$m4
data$Y5<-data$pi_s5/data$m5
data$Y6<-data$pi_s6/data$m6
data$Y7<-data$pi_s7/data$m7
data$Y8<-data$pi_s8/data$m8
data$Y9<-data$pi_s9/data$m9

data$X1<-data$p1
data$X2<-data$p2
data$X3<-data$p3
data$X4<-data$p4
data$X5<-data$p5
data$X6<-data$p6
data$X7<-data$p7
data$X8<-data$p8
data$X9<-data$p9



gendictlong<-data[,c("ID", "X1", "Y1", "X2", "Y2", "X3", "Y3", "X4", "Y4",
                     "X5", "Y5", "X6", "Y6", "X7", "Y7", "X8","Y8","X9", "Y9")]
names(gendictlong)<-c("ID", "g1.x", "g1.y", "g2.x", "g2.y", "g3.x", "g3.y", "g4.x", "g4.y", 
                      "g5.x", "g5.y", "g6.x", "g6.y", "g7.x", "g7.y", "g8.x", "g8.y", 
                      "g9.x", "g9.y")
long<- gendictlong %>% 
  gather(v, value, g1.x:g9.y) %>% 
  separate(v, c("var", "col")) %>% 
  arrange(ID) %>% 
  spread(col, value)



long<-long[long$y>=0,]


temp<-long[long$ID==96,]
nls(y~A/(x^r+A), data=temp, start=list(A=1, r=1), control=nls.control(warnOnly=TRUE))
r<-coef(nls(y~A/(x^r+A), data=temp, start=list(A=1, r=1)))[2]


long1<-long[long$ID!=96 & long$ID!=113 & long$ID!=281,]
long2<-long[long$ID==96 | long$ID==113 | long$ID==281,]
for (i in long1$ID){
  temp<-long[long$ID==i,]
  long$A[long$ID==i]<-coef(nls(y~A/(x^r+A), data=temp, 
                               control = nls.control(warnOnly=TRUE),
                               start=list(A=1, r=1)))[1]
  long$r[long$ID==i]<-coef(nls(y~A/(x^r+A), data=temp, 
                               control=nls.control(warnOnly=TRUE),
                               start=list(A=1, r=1)))[2]
}

for (i in long2$ID){
  temp<-long[long$ID==i,]
  long$A[long$ID==i]<-coef(nls(y~A/(x^r+A), data=temp, 
                               control = nls.control(warnOnly=TRUE),
                               start=list(A=5, r=0)))[1]
  long$r[long$ID==i]<-coef(nls(y~A/(x^r+A), data=temp, 
                               control=nls.control(warnOnly=TRUE),
                               start=list(A=5, r=0)))[2]
}

long$rho<-long$r/(long$r-1)
long$alpha<-(long$A^(1-long$rho))/(1+long$A^(1-long$rho))

summary(long$alpha)


long4<-long[long$ID==42 | long$ID==49 | long$ID==94 | 
              long$ID==160 | long$ID==271 | long$ID==328 | long$ID==333,]
long5<-long[long$ID==64 | long$ID==65 | long$ID==98 | long$ID==121 | 
              long$ID==115 | long$ID==172 | long$ID==190 |long$ID==216 |
              long$ID==242 | long$ID==323 |  long$ID==395,]

long2<-long[long$ID==84 | long$ID==122 | long$ID==282 | long$ID==369,]
long3<-long[long$ID==96 | long$ID==113 | long$ID==281,]
long1<-long[long$ID!=42 & long$ID!=49 & long$ID!=64 & long$ID!=65 &
              long$ID!=84 & long$ID!=94 & long$ID!=96 & long$ID!=98 & long$ID!=113 &
              long$ID!=115 & long$ID!=121 & long$ID!=122 & long$ID!=160 &
              long$ID!=172 & long$ID!=190 & long$ID!=216 & long$ID!=242 &
              long$ID!=271 & long$ID!=281 & long$ID!=282 & long$ID!=323 &
              long$ID!=328 & long$ID!=333 & long$ID!=369 & long$ID!=395,]

for (i in long1$ID){
  temp<-long[long$ID==i,]
  long$alphahat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
             data=temp,
             control=nls.control(maxiter=200,warnOnly=TRUE),
             start=list(alpha=0,rho=-5)))[1]
  long$rhohat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                      data=temp,
                                      control=nls.control(maxiter=200,warnOnly=TRUE),
                                      start=list(alpha=0,rho=-5)))[2]
}

for (i in long2$ID){
  temp<-long[long$ID==i,]
  long$alphahat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                        data=temp,
                                        control=nls.control(maxiter=200,warnOnly=TRUE),
                                        start=list(alpha=0,rho=-10)))[1]
  long$rhohat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                      data=temp,
                                      control=nls.control(maxiter=200,warnOnly=TRUE),
                                      start=list(alpha=0,rho=-10)))[2]
}
for (i in long3$ID){
  temp<-long[long$ID==i,]
  long$alphahat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                        data=temp,
                                        control=nls.control(maxiter=200,warnOnly=TRUE),
                                        start=list(alpha=0.5,rho=-5)))[1]
  long$rhohat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                      data=temp,
                                      control=nls.control(maxiter=200,warnOnly=TRUE),
                                      start=list(alpha=0.5,rho=-5)))[2]
}
for (i in long4$ID){
  temp<-long[long$ID==i,]
  long$alphahat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                        data=temp,
                                        control=nls.control(maxiter=200,warnOnly=TRUE),
                                        start=list(alpha=0,rho=-0.1)))[1]
  long$rhohat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                      data=temp,
                                      control=nls.control(maxiter=200,warnOnly=TRUE),
                                      start=list(alpha=0,rho=-0.1)))[2]
}

for (i in long5$ID){
  temp<-long[long$ID==i,]
  long$alphahat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                        data=temp,
                                        control=nls.control(maxiter=200,warnOnly=TRUE),
                                        start=list(alpha=0.5,rho=200)))[1]
  long$rhohat[long$ID==i]<-coef(nlsLM(y~((alpha/(1-alpha))^(1/(1-rho)))/((x^(-rho/(1-rho)))+(alpha/(1-alpha))^(1/(1-rho))),
                                      data=temp,
                                      control=nls.control(maxiter=200,warnOnly=TRUE),
                                      start=list(alpha=0.5,rho=200)))[2]
}

summary(long$rhohat)

long<-long[,c("ID", "alphahat", "rhohat")]
long<-unique(long)

data1<-merge(long, data, by="ID")

data<-data1[,c("ID", "ResponseId", "alphahat", "rhohat", "UG1", "UG2", "TG1", "TG2", "PGG", "SRA")]

#####################
#Univariate Analysis#
#####################

#SRA
SRA<-ggplot(data=data, aes(data$SRA))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
#  labs(title="Total SRA Scores") +
  labs(x="Total Scores", y="Percent") +
  scale_x_continuous(breaks=seq(20,50,2))
ggsave("~/Desktop/thesis/paper/images/SRAimg.jpg", width=11, height=8.5)

#UG1
UG1<-ggplot(data=data, aes(data$UG1))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  ggtitle("Panel A: UG1") +
  labs(x="Pass Rate", y="Percent") + ylim(c(0,45))+
  scale_x_continuous(breaks=seq(0,1,0.1))
ggsave("~/Desktop/thesis/output/UG1.pdf", width=11, height=8.5)


#UG2
UG2<-ggplot(data=data, aes(data$UG2))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") 
  ggtitle("Panel B: UG2")+
  labs(x="Minimum Acceptance", y="Percent")+ylim(c(0,45))+
  scale_x_continuous(breaks=seq(0,1,0.1))

ggsave("~/Desktop/thesis/output/UG2.pdf", width=11, height=8.5)


#TG1

TG1<-ggplot(data=data, aes(data$TG1))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +ylim(c(0,45))+
  #  labs(title="Total SRA Scores") +
  labs(x="Pass Rate", y="Percent")+
  scale_x_continuous(breaks=seq(0,1,0.1)) +
  ggtitle("Panel C: TG1")

ggsave("~/Desktop/thesis/output/TG1.pdf", width=11, height=8.5)

#PGG
PGG<-ggplot(data=data, aes(data$PGG))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  labs(x="Pass Rate", y="Percent")+ylim(c(0,45))+
  scale_x_continuous(breaks=seq(0,1,0.1)) +
  ggtitle("Panel D: PGG")

ggsave("~/Desktop/thesis/output/PGG.pdf", width=11, height=8.5)

pdf("~/Desktop/thesis/paper/images/Figure2a.pdf",width=11,height=8.5)
grid.arrange(UG1, UG2, TG1, PGG, nrow=2)
dev.off()



prop.table(table(data$TG2))
summary(data$TG2)
#TG2 - reciprocity

TG2<-ggplot(data=data, aes(data$TG2)) + geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=0.05)+
  scale_x_continuous(breaks=seq(-0.5, 1, by=0.1)) +
  ylim(c(0,30)) + labs(x="Reciprocity", y="Percent")
ggsave("~/Desktop/thesis/paper/images/TG2.pdf", width=11, height=8.5)


#donations dataset
donations = read.csv("donations.csv", stringsAsFactors=FALSE)


donations <- donations[-c(11:18, 20:67)]

data <- merge( data,donations, by="ResponseId")

data$donated<-1
data$donated[data$current_donor_status=="Never"]<-0
prop.table(table(data$donated))
donated<-ggplot(data=data, aes(data$donated))+
  geom_bar(aes(y= 100*(..count..)/sum(..count..))) +
  #  labs(title="Total SRA Scores") +
  labs(x="Donated", y="Percent") + scale_x_continuous(breaks=seq(0,1,1)) + ylim(c(0,80))
ggsave("~/Desktop/thesis/paper/images/donated.pdf", width=11, height=8.5)


data$donations<-as.numeric(data$DNR_GIVING)
d<-data[data$donation<=625,]
donations<-ggplot(data=d, aes(d$donation))+geom_histogram(aes(y=100*(..count..)/sum(..count..)), binwidth=10)+
  labs(x="Donation Amount", y="Percent")+scale_x_continuous(breaks=seq(0,650,50))+ylim(c(0,60))
ggsave("~/Desktop/thesis/paper/images/donations.pdf", width=11, height=8.5)

e<-data[data$donation>625,]
prop.table(table(e$donation))
summary(data$donation)
#match players to get winner
match <- data[,c("ResponseId", 
                 "public")]
popsize = 396
matches<-split(sample(match$ResponseId), rep(1:(popsize/2), each=2))
