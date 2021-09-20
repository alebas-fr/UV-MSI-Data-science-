year <- rep( 2008: 2010, each = 4)
quarter <- rep( 1: 4, 3)
cpi <- c( 162.2, 164.6, 166.5, 166, 166.2, 167, 168.6, 169.5, 171,
172.1, 173.3, 174)
plot(cpi , xaxt = "n", ylab = "CPI", xlab = "")
# draw x - a x i s , where ' la s=3 ' makes t e x t v e r t i c a l
axis( 1, labels = paste( year ,quarter , sep = "Q") , at = 1: 12, las = 3)

cor(year,cpi)

cor(quarter,cpi)

fit = lm(cpi ~ year + quarter)
fit

cpi2011 <- fit$coefficients[[1]]+fit$coefficients[[2]]*2011+fit$coefficients[[3]]*(1:4)
cpi2011

attributes(fit)

residuals(fit)

summary(fit)

data2011 <- data.frame(year = 2011,quarter=1:4)
cpi2011 <- predict(fit,newdata = data2011)
style <- c(rep(1,12),rep(2,4))
plot(c(cpi,cpi2011),xaxt = "n",ylab = "CPI",xlab = "",pch = style,col = style)
axis(1,at = 1:16, las=3,labels = c(paste(year,quarter,sep="Q"),"2011Q1","2011Q2","2011Q3","2011Q4"))

install.packages("TH.data")

data("bodyfat",package = "TH.data")
myformula = DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth

bodyfat.glm <- glm(myformula,family = gaussian("log"),data = bodyfat)
summary(bodyfat.glm)

pred = predict(bodyfat.glm, type = "response")
plot(bodyfat$DEXfat, pred, xlab = "Observed",ylab = "Prediction")
abline(a=0,b=1)

set.seed(1234)
ind = sample(2,nrow(iris),replace = TRUE, prob = c(0.7,0.3))

ind

train.data = iris[ind == 1,]
test.data = iris[ind ==2,]

install.packages("party")

library(party)

myFormula = Species ~ Sepal.Length + Sepal.Width + Petal.Length +Petal.Width
iris_ctree = ctree(myFormula,data = train.data)

table(predict(iris_ctree),train.data$Species)

print(iris_ctree)

plot(iris_ctree)

plot(iris_ctree,type="simple")

testPred = predict(iris_ctree,newdata = test.data)
table(testPred, test.data$Species)

data("bodyfat",package = "TH.data")
dim(bodyfat)

head(bodyfat,5)

set.seed(1234)
ind <- sample(2,nrow(bodyfat),replace=T,prob=c(0.7,0.3))
bodyfat.train <- bodyfat[ind==1,]
bodyfat.test <- bodyfat[ind==2,]

library(rpart)
myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth +kneebreadth
bodyfat_rpart <- rpart(myFormula,data = bodyfat.train, control = rpart.control(minsplit = 10))

print(bodyfat_rpart)


plot(bodyfat_rpart) # Afficher la structure de l'arbre
text(bodyfat_rpart) # Afficher le texte sur l'arbre 

opt <- which.min(bodyfat_rpart$cptable[,"xerror"])
cp <- bodyfat_rpart$cptable[opt, "CP"]
bodyfat_prune <- prune(bodyfat_rpart,cp = cp)

plot(bodyfat_prune)
text(bodyfat_prune,use.n = T)

DEXfat_pred <- predict(bodyfat_prune,newdata = bodyfat.test)
xlim <- range(bodyfat$DEXfat)
plot(DEXfat_pred ~ DEXfat,data = bodyfat.test,xlab = "Observed",
     ylab = "Prediction",ylim = xlim,xlim = xlim)
abline(a=0,b=1)

install.packages("randomForest")
library(randomForest)

rf = randomForest(Species ~ .,data = train.data, ntree = 100,proximity = T)

table(predict(rf),train.data$Species)

print(rf)

plot(rf, main="")

importance(rf)

varImpPlot(rf)

irisPred = predict(rf, newdata = test.data)
table(irisPred, test.data$Species)

plot(margin(rf,test.data$Species))
