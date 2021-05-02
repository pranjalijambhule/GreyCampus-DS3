# 1. Basic difference and similarity between a vecctor and a matrix
# Difference: Vector is 1 dimensional whereas matrix is multi-dimensional
# Similarity: The data is homegeneous, stores more than 1 element and both of them have magnitude and direction


# 2. Basic difference and similarity between a dataframe and a matrix 
# Difference: Dataframe is of equal length whereas it is not the case for matrix. In matrix the data stored should be of same data type whereas a dataframe can have data of any data type. 
# Similarity: They have rows and columns



# 3.Create a vector using (15, TRUE, "World"). What happened to your result?
x <- c(15,TRUE,"world")
x
str(x)   ########## I was expecting an error but the vector was converted to char because everything can be converted to char ##############################################


# 4.John's scores in the final semester for the three subjects are 95, 91, and 88. The subjects are Statistics, Linear Algebra, and Calculus. 
# Using these create a vector and give names to all elements of the vector based on their subjects.
marks <- c(95, 91, 88)

marks_vector <- matrix(marks, nrow = 1, byrow = TRUE, dimnames = list("Marks", c("Statistics", "Linear Algebra", "Calculus")))          
marks_vector           


# 5.Please check the types (character or numeric) of the vector you created.
class(marks_vector)
typeof(marks_vector)


# 6.You have three students in your class (choose any name you want). You must create a matrix using their score in the above mentioned subjects 
#(question 4) Student 1 (95, 91, and 88), Student 2(96, 94, and 97), Student 3(88, 98, and 85). Create a matrix and label column and row names.
marks_of_all <- c(95, 91, 88,96, 94, 97, 88, 98, 85)
students_vector <- matrix(marks_of_all, nrow = 3, byrow =TRUE, dimnames = list(c("Sovi", "Tokyo", "Rio"), c("Statistics", "Linear Algebra", "Calculus")))
students_vector


# 7.Convert the created matrix into a data frame.
students_vector_dataframe <- data.frame(students_vector)
students_vector_dataframe


# 8.Create three vectors using five countries (your choice) from the following website. The first vector should be country names, the second vector should be 
#the total number of cases, and the third vector should contain the total number of deaths. Create a data frame using these vectors. 
# https://www.worldometers.info/coronavirus/ 

country_name <- c("USA", "Brazil", "India", "Russia" ,"France")
total_cases <- c(30705435, 12227179, 11787534, 4492692, 4378446)
total_deaths <- c(558425, 301087, 160726, 96612, 93180)

covid_dataframe <- data.frame(country_name, total_cases, total_deaths)
covid_dataframe

# 9.  Please read the mtcars data set from R. It is an built-in data set. Please check the structure of the data set. If required,
#please convert the data into their appropriate data types (character, logical, factor, etc). Save your results as a new data frame using a new name. 
mtcars
str(mtcars)

mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$am <- as.logical(mtcars$am)
mtcars$vs <- as.logical(mtcars$vs)
mtcars$carb <- as.factor(mtcars$carb)

str(mtcars)
new_mtcars <- data.frame(mtcars)

