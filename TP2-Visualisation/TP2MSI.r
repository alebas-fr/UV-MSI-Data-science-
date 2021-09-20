# Code réalisé par Alexandre-Lebas le 15/09/2021

# Question 1 : 

aggregate(Sepal.Length ~ Species, summary, data = iris)

aggregate(Sepal.Width ~ Species, summary, data = iris)

aggregate(Petal.Length ~ Species, summary, data = iris)

aggregate(Petal.Width ~ Species, summary, data = iris)

boxplot(Sepal.Length ~ Species, data = iris)

boxplot(Sepal.Width ~ Species, data = iris)

boxplot(Petal.Length ~ Species, data = iris)

boxplot(Petal.Width ~ Species, data = iris)

with(iris, plot(Sepal.Length, Sepal.Width, col = Species,pch = as.numeric(Species)))

with(iris, plot(Petal.Length, Petal.Width, col = Species,pch = as.numeric(Species)))

#On remarque que le spécimen le mieux reconnu est le Setosa car on remarque que ses caractéristiques sont séparables linéairement des deux autres espèces

# Question 2 :

cor(iris[,1:4])

cov(iris[,1:4])

eigen(cov(iris[,1:4]))

# On remarque que les variables les plus discriminantes sont Petal.Lenght en première avant toutes les autres et ensuite Sepal.Lenght car ce sont celles qui ont les plus grandes valeurs dans les premiers vecteurs propres de la matrice de covariance.

# Question 3 : 

plot(iris, pch=20 , cex=1.5 , col="#69b3a2")

# On peut observer des régressions linéaires entre Petal.Lenght et Petal.Width On peu aussi remarquer une regression linéaire de moins bonne qualité entre Sepal Lenght et Petal Lenght ainsi que Petal Width et Sepal Lenght

# Question 4 :

library(rgl)

data = iris

# Code inspiré de la page https://www.r-graph-gallery.com/3d_scatter_plot.html

mycolors <- c('royalblue1', 'darkcyan', 'oldlace')
data$color <- mycolors[ as.numeric(data$Species) ]

plot3d( 
  x=data$`Sepal.Length`, y=data$`Sepal.Width`, z=data$`Petal.Length`, 
  col = data$color, 
  type = 's', 
  radius = .1,
  xlab="Sepal Length", ylab="Sepal Width", zlab="Petal Length")

rglwidget() # Pour les notebooks

# Question 5 :

install.packages("magick")

library(magick)

# Code inspiré de https://www.r-graph-gallery.com/3-r-animated-cube.html
colors <- c("royalblue1", "darkcyan", "oldlace")
data$color <- colors[ as.numeric( as.factor(data$Species) ) ]

plot3d( iris[,1], iris[,2], iris[,3], col = data$color, type = "s", radius = .2 )

play3d( spin3d( axis = c(0, 0, 1), rpm = 20), duration = 10 )

# Question 6 : 

data = iris
data$Species = as.numeric(data$Species)
print(data)

heatmap(as.matrix(data))

# On remarque les fleurs les plus proches sont les versicolors et les virginicas.
