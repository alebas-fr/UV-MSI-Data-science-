# Code réalisé par Alexandre-Lebas le 20/09/2021

# TP 

# Exercice 1 : 

# Question 1 :

data = women

# Question 2 : 

data

# Question 3 :
pairs(women)

# On remarque que les deux variables ont une dépendance linéaire.

# Question 4 :

cor(women$height,women$weight)

# Question 5 :

fit = lm(height ~ weight,data = women)
fit

# Question 6 :

height130 = fit$coefficients[[1]]+fit$coefficients[[2]]*130
height130

height165= fit$coefficients[[1]]+fit$coefficients[[2]]*165
height165

height175= fit$coefficients[[1]]+fit$coefficients[[2]]*175
height175

# Question 7 :

weight = c(130,165,175)
height = c(height130,height165,height175)
dframe = data.frame(height,weight)
dframe

# Fusionner tous les dataframes pour pouvoir afficher tous les points sur le même graphique  
dfTout = rbind(women,dframe)
dfTout

plot(dfTout$height,dfTout$weight)

# Exercice 2 :

dataWeight = data.frame(weight=c(130,165,175))
dataWeight
HeightPredict = predict(fit,newdata = dataWeight)
HeightPredict

# Exercice 3 : 

fitIris = lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width,data = iris)
fitIris


