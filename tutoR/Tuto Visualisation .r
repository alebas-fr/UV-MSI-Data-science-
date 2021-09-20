dim(iris)

names(iris)

str(iris)

attributes(iris)

iris[1:3,]

head(iris,3)

tail(iris,3)

iris[1:10, "Sepal.Length"]

iris$Sepal.Length[1:10]

summary(iris)

range(iris$Sepal.Length)

quantile(iris$Sepal.Length)

quantile(iris$Sepal.Length, c(0.1,0.3,0.65))

var(iris$Sepal.Length)

hist(iris$Sepal.Length)

plot( density(iris$Sepal.Length))

table(iris$Species)

pie(table(iris$Species))

barplot(table(iris$Species))

cov(iris$Sepal.Length,iris$Petal.Length)

cor(iris$Sepal.Length,iris$Petal.Length)

cov(iris[,1:4])

aggregate(Sepal.Length ~ Species, summary, data = iris)

boxplot(Sepal.Length ~ Species, data = iris)

with(iris, plot(Sepal.Length, Sepal.Width, col = Species,
pch = as.numeric(Species)))

plot(jitter(iris$Sepal.Length),jitter(iris$Sepal.Width))

pairs(iris)

install.packages("rgl")
library(rgl)

#plot3d(iris$Petal.Width,iris$Sepal.Length,iris$Sepal.Width)

dist.matrix <- as.matrix( dist(iris[ , 1: 4] ) )
heatmap(dist.matrix)

library(lattice)


levelplot(Petal.Width ~ Sepal.Length * Sepal.Width,iris, cuts = 9,
col.regions = rainbow(10) [ 10: 1])

filled.contour(volcano, color = terrain.colors, asp = 1, plot.axes =co)

persp(volcano, theta = 25, phi = 30, expand = 0.5, col = "lightblue")

library(MASS)

parcoord(iris[ 1: 4], col =iris$Species)

parallelplot(~iris[1:4]|Species, data =iris)

# save as a PDF file
pdf("myPlot.pdf")
x <- 1:50
plot( x,log(x))
graphics.off()
# Save as a postscript file
postscript("myPlot2.ps")
x <- -20:20
plot(x,x^2)
graphics.off()


