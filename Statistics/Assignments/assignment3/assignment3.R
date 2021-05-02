library(dplyr)
library(manipulate)
library(ggplot2)
library(moments)

getwd()
setwd("C:/sovi/Data Science/Stats/week3/assignment")

covidFile <- read.csv("COVID19.csv",
                      na.strings = c("", "NA"),
                      stringsAsFactors = FALSE)
str(covidFile)

head(covidFile,10)

colSums(is.na(covidFile))


# removing the empty column "X."
covidFile <- covidFile %>%
  select(!"X.")

#location of empty country data
which(is.na(covidFile$Country.Other))

#removing empty country row
covidFile <- covidFile[ complete.cases(covidFile$Country.Other), ]

head(covidFile,10)

# getting the NA percentage of each column

colMeans(is.na(covidFile)*100)

# removing the columns with more than 5% NAs
covidFile1 <- covidFile %>%
  select(!c(4:6,8,10:15,17:19))

 # covidFile1 <- covidFile %>%
 #   purrr::discard(~sum(is.na(.x))/length(.x)*100 >= 10)


# finding the unwanted rows
# covid <- covidFile %>%
#    filter(Country.Other == "Total:")
   
#removing unwanted rows
covidFile1 <- covidFile1[-(229:237),]


# converting string to integer for further calculation
# #Removing commas from strings


for (i in c(3:15,17:19)) {
  covidFile[,i] <- as.numeric(gsub(",","",covidFile[,i]))
 }

###############    NOTE:::::
# Whenever dataset is showing certain columns as factor and we want to convert those into numeric, never ever
# directly try to convert it into numerics.
# If we use as.numeric first, then level of factor variables will become your numeric data, not your actual data.
# Hence, first convert factor columns into character and then convert them into numeric.


head(covidFile)
str(covidFile)


# giving new column names
# 
# covidFile1 <- covidFile1 %>%
#   rename(Country = "Country.Other",
#          .
#          .
#          .
#          .
#          )

colnames(covidFile) <- c("Serial No.", "Country", "TotalCases","NewCases","TotalDeaths","NewDeaths", "TotalRecovered","NewRecovered", "ActiveCases","SeriousCritical","million_Pop_Cases", "million_Pop_Deaths", "TotalTests","million_Pop_Tests","Population", "Continent", "CaseEvery_X_PPL", "DeathEvery_X_PPL","TestEvery_X_PPL")


#converting continent into factor
#covidFile <- transform(covidFile, Continent = factor(Continent))


#################################

##3.1

#plot for Total cases
#hist(covidFile$TotalCases) #looks like right skewed
ggplot(covidFile, aes(x = TotalCases)) + geom_histogram(bins = 500)

# as data is highly skewed we try to do the log transformation
ggplot(covidFile, aes(x = TotalCases)) + scale_x_log10() + geom_histogram()

#For total recovered
ggplot(covidFile, aes(x = TotalRecovered)) + scale_x_log10() + geom_histogram()

# For Total Deaths
ggplot(covidFile, aes(x = TotalDeaths)) + scale_x_log10() + geom_histogram()


# #looks like the Total cases > Total Recovery > Total Deaths
# boxplot(cbind(covidFile$TotalCases, covidFile$TotalRecovered, 
#               covidFile$TotalDeaths ), main = 'Plots for cases, recovery and deaths.', 
#         names = c('Total Cases', 'Total Recovery', 'Total deaths'))


####################################



#3.2 Relation between cases and population
ggplot(covidFile, aes(TotalCases, Population, colour = Continent)) + geom_point() + scale_x_log10() + scale_y_log10()

skewness(covidFile$TotalCases)

skewness(covidFile$Population, na.rm = TRUE)

# when data is highly skewed we don't use mean and SD, instead we use median and IQR
median(covidFile$TotalCases)

IQR(covidFile$TotalCases)

####################################


# 
# # 3.3. Create a plot to examine the correlation between Tot Cases/1M pop and total population.

ggplot(covidFile, aes(million_Pop_Cases, Population)) + geom_point() + scale_y_log10() + scale_x_log10()




#####################################



# 3.4 Which column do you feel is better for comparison purposes, total cases or TotCases/1M pop.

# Total cases / 1M pop is better for comparison purpose. Original numbers in this types of cases can be superficial.
# Rates will be better to compare countries or continent.




##################################




## 3.5. Create a plot to examine the correlation between total cases and total death.
ggplot(covidFile, aes(TotalCases, TotalDeaths)) + geom_point() + scale_x_log10() + scale_y_log10()

# looks like the deaths are more when the cases are high




#####################################



## 3.6. Create a plot to examine the correlation between total cases and Deaths/1M pop. Explain the figure. 
# Which column is more suitable to compare the result, total death or Death/1Mpop?

# we should never compare "RATE" with "NUMBER"
ggplot(covidFile, aes(TotalCases, million_Pop_Deaths)) + geom_point() + scale_x_log10() + scale_y_log10()



##############################################



## 3. 7. Compare Tot Cases/1M pop by continent, and explain your result. 
ggplot(covidFile, aes(x = Continent, y = million_Pop_Cases, fill = Continent)) + geom_bar(position = 'dodge', stat = 'identity')
# Europe is having the highest ratio of Cases/1M pop

# removing NA bar
covidFile %>%
  na.omit(Continent) %>%
  ggplot(aes(x = Continent, y = million_Pop_Cases, fill = Continent)) +
  geom_bar(position = 'dodge', stat = 'identity')

###############################




# 3.8.Compare Deaths/1M pop by continent, and explain your result. 
ggplot(covidFile, aes(x = Continent, y = million_Pop_Deaths, fill = Continent)) + geom_bar(position = 'dodge', stat = 'identity')
#Again Europe is having the highest ratio of Deaths/1M pop


# removing NA bar
covidFile %>%
  na.omit(Continent) %>%
  ggplot(aes(x = Continent, y = million_Pop_Deaths, fill = Continent)) +
  geom_bar(position = 'dodge', stat = 'identity')



###############################




# 3. 9. Which country is best among testing the COVID19 and which country is worst? There are two columns total test vs. test/M. Choose appropriate column. 
head(covidFile)
summary(covidFile$million_Pop_Tests)

covidFile%>%
  filter(million_Pop_Tests == c(575, 5540672))%>%
  select(2:2)



##############################




# 3. 10. Compare your COVID19 test results by continent? There are two columns total test vs test/M. Choose appropriate column. 
covidFile%>%
  group_by(Continent)%>%
  ggplot(aes(x = Continent, y = TestEvery_X_PPL)) + geom_boxplot()

    

####################################



# 3. 11. Check if Tests/1M pop is skewed or normally distributed.

skewness(covidFile$million_Pop_Tests, na.rm = TRUE)

summary(covidFile$million_Pop_Tests)
#As mean is greater than median it is right skewed
hist(covidFile$million_Pop_Tests)
