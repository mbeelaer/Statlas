wd <- "C:/Users/mbeelaer/OneDrive - UGent/FPPW. PP09/LMRO/WorkingSession3_dataCleaning/"
setwd(wd)


# Originele dataset (mail Alexander 21/11/2022)
leadership <- read.csv(file="lmroLeadership.csv")
head(leadership)
dim(leadership)


# Aanpassingen voor start leerpad
leadership$TeamNumber <- as.factor(leadership$TeamNumber)
leadership$Age <- as.numeric(leadership$Age)
leadership$No.Complaints <- as.numeric(leadership$No.Complaints)

leadership$attentionCheck <- sample(1:5, dim(leadership)[1], replace=TRUE, prob=c(.01, .96, .01, .01, .01))
leadership$attentionCheck[leadership$Leader == 1] <- 2

write.csv(leadership, file="lmroLeadershipStart.csv", row.names=FALSE) # dit is de dataset die studenten kunnen inladen bij de start van ws31


# aanpassingen ws31: geen



# aanpassingen in ws32
leadership[leadership=="."] <- NA

write.csv(leadership, file="lmroLeadership3.csv", row.names=FALSE)


# aanpassingen in ws33
leadership$ID <- as.character(leadership$ID)

colnames(leadership)[c(33,34,35,36)] <- c("Psychopath1", "Psychopath2", "Psychopath3", "Psychopath4")

write.csv(leadership, file="lmroLeadership4.csv", row.names=FALSE)


# aanpassingen in ws34

leadership$Gender <- factor(leadership$Gender)

leadership$TurnaroundTime <- as.numeric(leadership$TurnaroundTime)

leadership$Big5_32 <- 7 + 1 - leadership$Big5_32 # reverse coding

leadership[,30] <- 5 + 1 - leadership[,30]

write.csv(leadership, file="lmroLeadership5.csv", row.names=FALSE)


# aanpassingen in ws35

leadership$complaintsPerDay <- leadership$No.Complaints / leadership$TurnaroundTime

leadership[,90] <- as.integer(leadership[,90])

library(dplyr)
columns.LE <- grep("LeaderEffectiveness", colnames(leadership))
leadership[,columns.LE] <- type.convert(leadership[,columns.LE])

leadership$leaderEffectiveness <- rowSums(leadership[,columns.LE])

leadershipExtra <- read.csv("https://statlas.ugent.be/datasets/PP09/lmroLeadershipExtra.csv")
leadershipFull <- merge(leadership, leadershipExtra, by="ID", sort=FALSE)

leadership <- leadershipFull

write.csv(leadership, file="lmroLeadership6.csv", row.names=FALSE)


# aanpassingen in ws36 (= voor de volledigheid, want na ws36 komt geen pagina meer): geen