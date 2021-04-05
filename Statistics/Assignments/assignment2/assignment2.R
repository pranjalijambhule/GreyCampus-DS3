###########    Question 1: The final score of the World Cup finals of football is France  4
#and Croatia 2. Please use a control structure to print the results as Team ---- Wins -----.

France <- 4
Crotia <- 2

if(France > Crotia){
  print("Team France Wins ")
} else{
  print("Team Crotia Wins ")
}



#############   Question 2: The mtcars data set has several factor variables. 
#However, R is reading them as numeric. Please convert them into factors using a for loop. 
#Please use column 8 to 11 for the loop.

head(mtcars)
for (i in 8:11) {
  mtcars[,i] <- as.factor(mtcars[,i])
}

str(mtcars)

#You will receive a data set (Dataset 2.1). This data set is a subset of a real data set.  

library(readxl)
library(DT)
my_file <- read_excel("C:/sovi/Data Science/R/week2/assignment/Dataset.xlsx")
datatable(my_file)

#############   Question 3: Write a function to get the percentage of NAs in each column.

#total NAs in each column
colSums(is.na(my_file))

#pseudo code
(sum(is.na(my_file$THC))/length(my_file$THC)) * 100

# percentage function
per_func <- function(a){
  (sum(is.na(a)) / length(a)) * 100
}

head(apply(my_file, 2, per_func))

# column_sum <- length(colnames(my_file))
# 
# col_name <- colnames(my_file)
# 
# my_funct <- function(arg1){
#   for (i in 1 : arg1) {
#     individual_col <- my_file[i] 
#     numerator <- sum(is.na(individual_col))
#     denominator <- length(complete.cases(individual_col)) 
#     percentage <- (numerator/denominator) * 100
#     print(paste(col_name[i],"-", percentage,"%"))
#     }
# }
# 
# my_funct(column_sum)
# 

###########    Question 4: Write a function to get the percentage of NAs in each row.

# percentage function
per_func <- function(a){
  (sum(is.na(a)) / length(a)) * 100
}

head(apply(my_file, 1, per_func))



# 
# row_sum <- length(rownames(my_file))
# 
# row_name <- rownames(my_file)
# 
# 
# my_funct <- function(arg1){
#   for (i in 1 : arg1) {
#     individual_row <- my_file[i,] 
#     numerator <- sum(is.na(individual_row))
#     denominator <- length(individual_row) 
#     percentage <- (numerator/denominator) * 100
#     print(paste(row_name[i],"-", percentage,"%"))
#   }
# }
# 
# my_funct(row_sum)


##########    Question 5: Write a function to get a summary of numeric columns (use the summary function) 
#such as THC, CO, CO2, and so on in the data set. With the same function, try to generate box plot using base R.

#pseudo code
summary(my_file$THC)
boxplot(my_file$THC)

#main function
b_funct <- function(a){
  summary(a)
  boxplot(a)
}

b_funct(my_file$CO)

##########    Question 6: Write a function to create histograms of numeric columns, such as THC, CO, CO2, and so on in the data set. Use ggpot2 to generate figures.

#pseudo code
hist(my_file$CO)

#main function
hist_func <- function(a){
  hist(a)
}

hist_func(my_file$CO2)


###### USing ggplot2

library(ggplot2)

#pseudo code
ggplot(my_file) + aes(my_file$THC) + geom_histogram()

#main function
gg_func <- function(a,b){
  ggplot(a) + aes(b) + geom_histogram()
}

gg_func(my_file, my_file$CO2)


##########     Question 7: The data set contains date columns. All of these date columns are untidy. 
#Please create a better formatted data set. The date should be dd/mm/yyyy in the final format. Use columns 2, 3, and 5 only.
library(data.table)
library(lubridate)
my_csv <- read.csv("C:/sovi/Data Science/R/week2/assignment/Data set - 2.2.csv",
                   na.strings = c("", "NA"),
                   stringsAsFactors = FALSE )
str(my_csv)

my_csv$First.FD.Date <- mdy(my_csv$First.FD.Date)
my_csv$Last.FD.Date <- mdy(my_csv$Last.FD.Date)
my_csv$FD.termination.date <- mdy(my_csv$FD.termination.date)


head(my_csv)


#########       Question 8: The date of birth column contains months in string format. Please create a tidy data column with months
#                in numeric format. Now your data should be similar to the previous question.
library(tidyverse)

tidy_data <- my_csv%>%
  separate('Date.of.Birth', c('Day','Month', 'Year'))%>%
  mutate(Yr = if_else(Year > 20, '19', '20')) %>%
  unite(Year, c('Yr','Year'),sep = "")
  
  
head(tidy_data)
#converting month into numerical value
tidy_data$Month <- match(tidy_data$Month, month.abb)

tidy_data_1 <- tidy_data %>%
  unite(Date_of_Birth, c('Month', 'Day', 'Year'), sep= '/')

head(tidy_data_1)

class(tidy_data_1$Date_of_Birth)


########        Question 9: Convert all dates into date format; they are currently in character variable format.

#converting NANANA to single NA
tidy_data_1$Date_of_Birth <- gsub("NA/NA/NANA|/NA/NANA|NANA","NA",tidy_data_1$Date_of_Birth)
head(tidy_data_1)

#converting to dmY format
tidy_data_1$First.FD.Date <- as.Date(tidy_data_1$First.FD.Date, format = '%d/%m/%Y')
tidy_data_1$Last.FD.Date <- as.Date(tidy_data_1$Last.FD.Date, format = '%d/%m/%Y')
tidy_data_1$FD.termination.date <- as.Date(tidy_data_1$FD.termination.date, format = '%d/%m/%Y')
tidy_data_1$Date_of_Birth <- as.Date(tidy_data_1$Date_of_Birth, format = '%d/%m/%Y')
str(tidy_data_1)

########        Question 10: Create a new column age based on the date of birth column and the first FD column. 
#               Date format is necessary to do basic arithmetic.


x <- tidy_data_1 %>%
  mutate(Age = (First.FD.Date - Date_of_Birth) / 365) %>% #making new column 'Age'
  separate(Age, (c("Age","Decimal"))) %>%                 #seperating numeric and decimal part
  select(-("Decimal"))                                    # removing the decimal part

head(x)
