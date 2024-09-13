### Seventh session: Objects ########################################


### Object class ####################################################

  # Function which shows class of object:
  # class()

  # Every object has a class
  x <- 1
  x |> class()
  log |> class()
  class |> class()

  # Different classes for data, multiple classes

  # data.frame (base R)
  library(MASS)
  data(birthwt)
  class(birthwt)

  # tibble (tidy)
  library(tidyverse)
  datapath <- "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv"
  covid <- read_csv(datapath)
  class(covid)


### Object types ####################################################

  # Every object has a type
  typeof(x)
  typeof(log)
  typeof(class)
  typeof(ggplot)

  # Type != class
  class(covid)
  typeof(covid)

  # For most users, classes are much more important than types


### Methods #########################################################

  # class influences what R does with an object
  # Example
  print(birthwt)
  print(covid)

  # List of methods
  methods(print)

  # Each method is a function
  print.data.frame

  # ... but not all are directly accessible
  print.tbl
  getAnywhere(print.tbl)


### Changing class ##################################################

  # Tibble to data.frame
  covid <- as.data.frame(covid)
  print(covid)

  # Data.frame to tibble
  birthwt <- as.tibble(birthwt)
  print(birthwt)

  # Numeric to character
  x <- 2
  x
  class(x)
  x <- as.character(x)
  class(x)
  x

  # Switching class back and forth can lose information
  covid <- read_csv(datapath)
  class(covid)
  covid <- as.data.frame(covid)
  covid <- as.tibble(covid)
  class(covid)

  # Why? Attributes in this case
  covid <- read_csv(datapath)
  attributes(covid)
  covid <- as.data.frame(covid)
  attributes(covid)


### Indexing ########################################################

  # Vectors
  vector1 <- 1:10
  vector1[2]
  vector1[4:5]
  vector2 <- c("Alpha","Beta","Gamma","Delta")
  vector2[2:3]
  vector2[c(1,4)]

  # For comparison
  bwt1 <- as.data.frame(birthwt)
  bwt2 <- as_tibble(birthwt)
  bwt3 <- as.matrix(birthwt)

  # Indexing rectangular data
  bwt1[1,1]
  bwt1[3,2]
  bwt1[1:10,2]
  bwt1[1,1:3]
  bwt1[1:5,1:3]

  # Behavior depends a bit on class
  bwt2[1:5,1]
  bwt3[1:5,1]

  length(bwt1[1:5,1])
  length(bwt2[1:5,1])
  length(bwt3[1:5,1])

  # Doing things row- or column-wise
  apply(X=bwt1,MARGIN=2,FUN=mean)


### Lists ###########################################################

  # Content for list
  x1 <- 1
  x2 <- matrix(1:9,ncol=3)
  x3 <- "Test"

  # Create list
  example <- list(x1,x2,x3)

  # Look into list
  example

  # Indexing
  example[1]
  example[[1]]

  class(example[1])
  class(example[[1]])

  # More indexing
  example[[2]]
  example[[2]][1,2]
