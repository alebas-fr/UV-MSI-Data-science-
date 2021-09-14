x<-1:10

x

y<- runif(5) 

y

z <- c("abc","d","ef","g")
print(z)

z[1]

m <- matrix(1:50, nrow = 4, byrow=T)

m

age <- c(45, 22, 61, 14, 37)
gender <- c("Female", "Male", "Male", "Female", "Male")
height <- c(1.68, 1.85, 1.8, 1.66, 1.72)
age <- c(45, 22, 61, 14, 37)
married <- c(T, F, T, F, F)
(df <- data.frame(age, gender, height, married))

str(df)

x <- 1:10
y <- c("abc", "d", "ef", "g") 
(ls <- list(x, y))

ls[[1]]

ls[[2]]

ls[[1]][2]

score <- 1:5
ifelse(score >= 3, "pass", "fail")

x <- 1:10
y <- rep(NA, 10)
for (i in 1:length(x)) {
y[i] <- log(x[i])
}

y

tmp <- lapply(x, log)
(y <- do.call("c", tmp))

x <- 1:10
y <- rep(NA, 10)
library(parallel)
(n.cores <- detectCores() - 1)
## set up cluster
cluster <- makeCluster(n.cores)
## run jobs in parallel
tmp <- parLapply(cluster, x, log)
## stop cluster
stopCluster(cluster)
# collect results
y <- do.call("c", tmp)

y

a <- 1:10
save(a, file = "dumData.Rdata")
rm(a)
a

load("dumData.Rdata")
a

var1 <- 1:5
var2 <- (1:5)/10
var3 <- c("R", "and", "Data Mining", "Examples", "Case Studies")
df1 <- data.frame(var1, var2, var3)
names(df1) <- c("VarInt", "VarReal", "VarChar")

df1

write.csv(df1, "dummmyData.csv", row.names = FALSE)

df2 <- read.csv("dummmyData.csv")
print(df2)


