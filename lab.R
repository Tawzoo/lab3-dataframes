### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

library(tidyverse)

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out

Seahawks <- c(17,7,23,48,32)

## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name

Against <- c(16,27,27,45,39)

## Combine your two vectors into a dataframe

Games <- data.frame(Seahawks, Against)
Games

## Create a new column "diff" that is the difference in points
## (in favor of Hawks)

Games$diff <- Seahawks - Against
Games

## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them

Games$won <- Games$diff > 0
Games
## Create a vector of the opponents name (such as "Denver Broncos")

Teams <- c("Denver Broncos", "San Francisco 49ers", "Atlanta Falcons", "Detroit Lions", "New Orleans Saints")


## Add the vector of opponents into the data frame

Games$Teams <- Teams
Games

## Compute the average score of Seahawks

mean(Games$Seahawks)

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)

sum(Games$won)


## What was the largest difference in scores (in favor of Seahawks)?

max(Games$diff)


## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`

length(Games$Teams)

## Print the variable names in your data frame

names(Games)

## Write a loop over all variables in your data frame
## print the variable name inside the loop

for(i in 1:ncol(Games)){
  cat("The variable name is", colnames(Games)[i], "at column number", i ,"\n")
}


## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'
for(i in 1:ncol(Games)){
  cat("The variable name is", colnames(Games)[i], "at column number", i ,"\n")
  if(is.numeric(Games[[i]])){
    print("True")
  }
  else{
    print("False")
  }
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric

for(i in 1:ncol(Games)){
  cat("The variable name is", colnames(Games)[i], "at column number", i ,"\n")
  if(is.numeric(Games[[i]])){
    avg <- mean(Games[[i]])
    print(avg)
  }
  else{
    print("False")
  }
}



##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`

names <- "Employee"
nums <- c(1:100)

employees <- paste(names,nums)
employees


## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120

Salaries21 <- runif(100,60,120)
Salaries21

## Create a random vector of 2022 salaries that are typically
## higher than the 2014 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.

Salaries22 <- runif(100,70,120)

## Create a data.frame 'salaries' by combining the vectors you just made

salaries <- data.frame(employees,Salaries21,Salaries22)

## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022

salaries$raise <- Salaries22 > Salaries21

salaries

## Retrieve values from your data frame to answer the following questions:
##
## What was the 2015 salary of employee 57

employee_57 <- salaries[salaries$employees == "Employee 57", "Salaries21"]
employee_57

## Now round the answer down to two digits after comma
## check out 'round()' function

employee_57 <- round(employee_57)
employee_57

## How many employees got a raise?

sum(salaries$raise)

## What was the value of the highest raise?
## Round the number to two digits!

salaries$amount <- Salaries22 - Salaries21
max <- round(max(salaries$amount))
max

## What was the name of the employee who recieved the highest raise?

salaries[salaries$amount == max(salaries$amount), "employees" ]

## What was the average salary increase?
## Round the number!

avg_increase <- mean(salaries$amount)
avg_increase


## For people who did not get a raise, how much money did they lose?
## Round the number!

Salary_decrease <-  salaries[salaries$raise == FALSE, "amount"]
Salary_decrease
