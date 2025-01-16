leadership <- read.csv(file="https://statlas.ugent.be/datasets/PP09/lmroLeadershipStart.csv")

# aanpassingen ws31: geen



# aanpassingen in ws32
leadership[leadership=="."] <- NA




# aanpassingen in ws33
leadership$ID <- as.character(leadership$ID)

colnames(leadership)[c(33,34,35,36)] <- c("Psychopath1", "Psychopath2", "Psychopath3", "Psychopath4")




# aanpassingen in ws34

leadership$Gender <- factor(leadership$Gender)

leadership$TurnaroundTime <- as.numeric(leadership$TurnaroundTime)

leadership$Big5_32 <- 7 + 1 - leadership$Big5_32 # reverse coding

leadership[,30] <- 5 + 1 - leadership[,30]




# # aanpassingen in ws35
# 
# leadership$complaintsPerDay <- leadership$No.Complaints / leadership$TurnaroundTime
# 
# leadership[,90] <- as.integer(leadership[,90])
# 
# library(dplyr)
# columns.LE <- grep("LeaderEffectiveness", colnames(leadership))
# leadership[,columns.LE] <- type.convert(leadership[,columns.LE])
# 
# leadership$leaderEffectiveness <- rowSums(leadership[,columns.LE])
# 
# leadershipExtra <- read.csv("https://statlas.ugent.be/datasets/PP09/lmroLeadershipExtra.csv")
# leadershipFull <- merge(leadership, leadershipExtra, by="ID", sort=FALSE)
# 
# leadership <- leadershipFull




# aanpassingen in ws36 (= voor de volledigheid, want na ws36 komt geen pagina meer): geen