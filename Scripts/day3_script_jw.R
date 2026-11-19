v1 <- c(1, 2, 5)
v2 <- c("a", "asdfas", "dad")

v1 * 3
sin(v1)

mean(v1)
sd(v1)

v1 * v1

length(v1)
nchar(v2)

m <- matrix(rnorm(16), ncol=2)
colnames(m) <- c("A", "B")
m

names(v1) <- c("A", "B", "C")
v1[1]
v1["A"]

m[ , 1] # this is perfectly fine
m[ , "A"]

mylist <- list(name = "whoever", password = "voldemort", number = c(1, 2, 3, 42))
mylist

mylist$password

df <- data.frame(names = c("foo", "bar"), values = 1:2, category = c("stupid", "useless"))
df

df$values

df[[2]]

# do not do that, even though it works!
df[ , 2] # don't do that in data frames, unless you know what you are doing

# however, this is fine:
df[ , 1:2] # in any case, whether it is a tibble, or a data frame, this will return a data frame

# this did not change the data frame! we need to assign the result to a variable
df <- df[ , 1:2] # this actually changes the df


x <- 1
sx <- sin(x)
x <- sin(x)

# in order to use a function from readxl, we need first to load the library
library(readxl)
labres <- read_excel("../Datasets/labres_selected_simple.xlsx")

View(labres) # same as clicking on the right hand side in the Rstudio

labres$CRP
hist(labres$CRP, main = "C reactive protein", xlab = "CRP", ylab = "count")

d <- density(labres$CRP)
plot(d)

d <- density(log10(labres$CRP))
plot(d)

labres$ARM

sel <- labres$ARM == "vaccine"
labres$CRP[sel]
mean(labres$CRP[sel])

labres$CRP[!sel]
mean(labres$CRP[!sel])

t.test(labres$CRP[sel], labres$CRP[!sel])
wilcox.test(labres$CRP[sel], labres$CRP[!sel])

t.test(CRP ~ ARM, data = labres)

mod <- lm(CRP ~ ARM, data = labres)
mod
summary(mod)

ttest_res <- t.test(CRP ~ ARM, data = labres)
ttest_res
ttest_res$p.value
ttest_res$conf.int
ttest_res$estimate
ttest_res

# how do we get two histograms, separately for vaccine and placebo?
# first solution: with base R graphics
vac <- labres$ARM == "vaccine"
hist(labres$CRP[!vac], col = "lightblue", breaks = seq(0, 14, by=2))
hist(labres$CRP[vac], col = "lightgrey", add = TRUE, breaks = seq(0, 14, by=2))

# second solution: with ggplot2
library(ggplot2)
ggplot(labres, aes(x = CRP, fill = ARM)) +
  geom_histogram(binwidth = 2)

# putting two boxplots.
# first solution: with base R graphics.
par(mfrow=c(1, 2))
boxplot(CRP ~ ARM, data = labres)
boxplot(NEUT ~ ARM, data = labres)

# second solution: with ggplot2. Here, there two subsolutions.
library(cowplot)
p1 <- ggplot(labres, aes(x = ARM, y = CRP)) +
  geom_boxplot() +
  geom_jitter(width=.15)
p2 <- ggplot(labres, aes(x = ARM, y = NEUT)) +
  geom_boxplot() +
  geom_jitter(width=.15)
plot_grid(p1, p2, nrow=2, labels = c("A", "B"))

library(tidyverse)
df <- tibble("foo bar ?" = 1:10)
df
df$`foo bar ?`

library(janitor)
df <- clean_names(df)
df
df$foo_bar



# 
library(tidyverse)
library(janitor)
myiris <- read_csv("../Datasets/iris.csv")
myiris <- clean_names(myiris)


typeof(myiris$sepal_length)
class(myiris$sepal_length)
summary(myiris)

table(myiris$species)

library(skimr)
skim(myiris)

mdb <- read_excel("../Datasets/meta_data_botched.xlsx")


lapply(mdb, table)
lapply(mdb, summary)
lapply(mdb, mean)

table(mdb$SEX)

sel <- mdb$SEX == "Herr"
mdb$SEX[sel] <- "M"
mdb$SEX[ mdb$SEX == "Herr" ] <- "M"
table(mdb$SEX)

mdb$AGE
mdb$AGE <- as.numeric(mdb$AGE)
mdb$AGE


mdb <- mdb[ !is.na(mdb$AGE), ]

