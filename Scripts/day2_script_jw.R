samples <- c(1, 10, NA, 15)
mean(samples)

# this does not work
which(samples == NA)

# this does work
is.na(samples)
which(is.na(samples))

!is.na(samples)
which(!is.na(samples))

samples <- samples[ !is.na(samples) ]

NA + 5

which()

!"a"

!samples

# Create a 6x8 matrix “drugSensitivity” with random numbers between 0 and 1. 
# Use matrix and runif. 
# These reflect your viability scores.

measurements <- runif(6 * 8)
plate <- matrix(measurements, nrow = 6, ncol = 8)

plate[1, ] <- NA
plate
plate[6, ] <- NA
plate[,1] <- NA
plate
plate[,c(1, 8)] <- NA
plate

rownames(plate) <- c("topmargin", "inh1_ctrl", "inh1_low", "inh1_medium", "inh1_high", "botmargin")

# alternative:
inh_concentrations <- c("ctrl", "low", "medium", "high")
labels <- paste0("inh1", "_", inh_concentrations)
rownames(plate) <- c("topmargin", labels, "botmargin")


concentrations <- c("ctrl", "low", "high")
inhibitors <- c("inh2", "inh3")
rep(inhibitors, 3)
labels <- paste0(rep(inhibitors, each=3), "_", concentrations)
labels
colnames(plate) <- c("leftmargin", 
                     labels,
                     "rightmargin")

plate[2:5, 5:7]

plate[3:5,3:4]

Plate <- matrix(measurements, nrow = 6, ncol = 8)

Plate[1,] <- NA
Plate[6,] <- NA


Plate[,1] <- NA
Plate

library(tidyverse)
starwars
starwars$hair_color


# Create a 5x3 matrix with random numbers. Use matrix and rnorm.
mymat <- matrix(rnorm(6 * 3), nrow=6, ncol=3)
mymat

# Turn the matrix into a data frame. Use as.data.frame for that.
df <- as.data.frame(mymat)
df

# more or less equivalent
df$V1
df[,1] # avoid that
df[["V1"]]

# number of rows
nrow(df)

# number of columns
ncol(df)

# Add column and row names.
rownames(df) <- paste0("Sample", "_", 1:nrow(df))
df

colnames(df) <- c("CRP", "Troponin", "IL12")
df

# Add a column. Each value in the column should be “A” (a string).
df$Ateam <- "A"
df$Ateam <- rep("A", nrow(df))

# generate groups with rep
groups <- c("Control", "Treatment")
df$Group <- rep(groups, each=3)
df
# Add a column with five numbers from 0 to 1. Use the seq function for that.
df$Fraction <- seq(0, 1, length.out = nrow(df))
df

