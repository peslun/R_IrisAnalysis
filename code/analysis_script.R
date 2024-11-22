# activate renv ----
library(renv)
renv::init()
renv::install("gitcreds")

library(gitcreds)
gitcreds_set()

# preparation ----

renv::install("tidyverse")
library(tidyverse)
renv::snapshot(prompt=0)

# load and explore data ----

data(iris)
head(iris)
summary(iris)
str(iris)

# data manipulation ----
#https://rpubs.com/analystben/chapter-2

data(iris)
iris <- as_tibble(iris)
iris
print(iris, n = 3, width = Inf)
summary(iris)
iris %>% summarize_if(is.numeric, mean)

# install ggally ----
renv::install("GGally")
library(GGally)
renv::snapshot(prompt=0)

# show ggpairs ----
ggpairs(iris, aes(color = Species))

# clean data ----
clean.data <- iris %>% drop_na() %>% unique()
summary(clean.data)

iris %>% group_by(Species) %>% summarize_all(mean)
iris %>% group_by(Species) %>% summarize_all(median)

# fun with ggplot ----
#https://kelseyandersen.github.io/NetworksPlantPathology/APS2018_Tidyverse.html

ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

box <- ggplot(data=iris, aes(x=Species, y=Sepal.Length))
box + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)

histogram <- ggplot(data=iris, aes(x=Sepal.Width))
histogram +
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
  xlab("Sepal Width") + 
  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Width")

facet <- ggplot(data=iris, aes(Sepal.Length, y=Sepal.Width, color=Species)) 
facet +
  geom_point(aes(shape=Species), size=1.5) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Faceting") +
  facet_grid(. ~ Species)
