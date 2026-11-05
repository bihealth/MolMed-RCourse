# this is ignored, but the next line isn't
tulip


iris

# R as a calculator

1 + 1
2 * 2
sin(pi)

sin(pi) == 0

2^5
2**5

sqrt(25)
25^.5

log(2.73)
log10(100)

# exercise 1
sqrt(exp(1))

a <- 2
a^2

# avoid assignment like this
a = 2

2 == 3
sin(pi) == 0
# abs - calculate the absolute value
abs(0 - sin(pi)) < 1e-10

foo <- "bar"
one <- "two"
one

foo

# vectors
a <- c(1, 7, 9)
a * 2

sum(a)
sum(a * 2)

# length of a vector
i <- length(a)
i

a <- 2

name <- "January"

a <- c(1,7,9)

sum(a)

foo <- c(1, 2)
foo <- c("January", "Manuela")
foo <- c('January "The teacher"', 'Manuela "The teacher"')
foo

firstten <- 1:10
foo[1:5]

diameters <- c(1, 2, 5)
radius <- diameters/2
radius
pi * radius^2

students <- c("Anna", "Bernie", "Claudia", "David")
students
students[1]

# here we are calling the [ ] with one parameter
students[c(1, 3)]

# this does not work
# because here we are calling the square brackets with two parameters
students[ 1, 3 ]

sel <- c(1, 2)

students[sel]

a <- 1 + 2
a/2

a # why is a still 3 at this point
# because we did not assign a/2 to anything
a <- a/2
# and now a is a/2


students[sel] <- c("Arthur", "Beate")
students

species <- c("versicolor", "versicolor", "setosa")
species

species <- factor(species, levels = c("setosa", "versicolor"))
species
species[1] <- "sitosa"
species

# keep the session info produced by sessionInfo() for reproducibility
sessionInfo()


# party trick

2 + 1
`+`(2, 1)

my_own_sd <- sd
my_own_sd(rnorm(20))

# plotting the water lillies

x <- 1:10
y <- (1/100) * 2^(x -1)
y
plot(x, y)
?abline

abline(h = .5)
