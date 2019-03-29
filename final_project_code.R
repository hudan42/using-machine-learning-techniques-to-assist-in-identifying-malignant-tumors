# Load all the libraries we need.
library(tidyverse)
library(stringr)
library(rpart)
library(partykit)
library(randomForest)
library(class)
setwd("/Users/hercule/Desktop/DataScience_2020/2019Spring/Intro_to_DS/final project")
# Load the data set. Assign it to the variable 'fna'.
fna <- read_csv("FNA_cancer.csv")
glimpse(fna)

# Make a copy of the original data set and delete the first and last column which are useless. Assign it with a new variable 'fna_new'.
fna_new <- data.frame(fna)
fna_new <- fna_new %>% dplyr::select(-id, -X33)
glimpse(fna_new)

# Replace the dot sign in column names with underscore so that all column names are in uniform form.
names(fna_new) <- str_replace_all(names(fna_new), '[.]', '_')

# Conver the response variable 'diagnosis' into factor.
fna_new$diagnosis <- as.factor(fna_new$diagnosis)

glimpse(fna_new)

characteristics <- names(fna_new)[-1]
for (i in 1:30){
  p <- ggplot(fna_new, aes(x = get(characteristics[i]), fill = diagnosis)) + 
    geom_histogram() + 
    xlab(characteristics[i])
  print(p)
}

















