## I. Data: The World Values Survey is an ongoing worldwide survey that polls the world population about perceptions of life, work, family, politics, etc.
# The most recent phase of the survey that polled 77,882 people from 57 countries estimates that 36.2% of the world's population agrees with the statement 
# "Men should have more right to a job than women." The survey also estimates that 13.8% of people have a university degree or higher and that 3.6% of people fit both criteria. 


# Question 1: Are agreeing with the statement "Men should have more right to a job than women" and having a university degree or higher disjoint events?

# P(A U B) = P(A) + P(B)

Degree <- 10747
No.degree <- 67135
Agree <- 28193
Dont.Agree <- 49689
Total <- 77882
Agree.and.degree <- 2803
No.degree.and.disagree <- 41745
Agree.Unioun.Degree <- Agree + Degree - Agree.and.degree

#Probability of union of Agree and Degree
P1 <- Agree.Unioun.Degree/Total

#Probability of Agree, Degree
P2 <- (Agree/Total) + (Degree/Total)

#check if Prob(agree U degree) = Prob (Agree) + Prob(Degree)
if(P1 == P2){
  print("Yes, they are disjoin events")
}else{
  print("No, they are not disjoint events")
}

## No, they are not disjoint events




#######################################################################





# Question 2: Draw a Venn diagram summarizing the variables and their associated probabilities.



library("VennDiagram")

grid.newpage()
draw.quad.venn(
  area1 = No.degree,
  area2 = Dont.Agree,
  area3 = Degree,
  area4 = Agree,
  n12 = 41745,
  n23 = 7944,
  n34 = 2803,
  n14 = 25390,
  n123 = 0,
  n1234 = 0,
  n124 = 0,
  n134 = 0,
  n234 = 0,
  n13 = 0,
  n24 = 0,
  fill = c("orange","green","yellow", "pink"),
  lty = "blank",
  category = c("No degree (67135)","Don't agree (49689)","Degree (10747)","Agree (28193)"),
  print.mode = "percent")



############





# Question 3: What is the probability that a randomly drawn person has a university degree or higher or 
# agrees with the statement about men having more right to a job than women?



#Probability of (Agree or Degree) = Agree + degree - intersection of Agree, Degree
(Agree + Degree - Agree.and.degree)/Total





######################################################



# Question 4: What percent of the world population do not have a university degree and disagree with the statement
# about men having more right to a job than women?


(No.degree.and.disagree / Total) * 100



##################################################



# Question 5: Does it appear that the event that someone agrees with the statement is independent of the event 
# that they have a university degree or higher?


#independent events: P(A and B) = P(A) x P(B)
#let's check


#Prob(A and B):
p1 <- Agree.and.degree/Total

#Prob(A):
Prob.Agree <- Agree/Total

#Prob(B):
Prob.Degree <- Degree/Total

p2 <- Prob.Agree * Prob.Degree

#checking if true: Prob(Agree and Degree) = Prob(Agree) x Prob(Degree)
if(p1 == p2){
  print("Yes, they are independent events")
}else{
  print("No, they are not independent events")
}




#############################################



# Question 6: What is the probability that at least 1 in 5 randomly selected people to agree with the statement 
# about men having more right to a job than women?

# Total number of cases: 2^5
Total.cases <- 32

# at least 1 in 5 : all cases - 1 where none will be selected
Favourable <- 31

Favourable/Total.cases





####################################################





# II. Data: As of 2009, Swaziland had the highest HIV prevalence in the world. 25.9% of this country's population 
# is infected with HIV. The ELISA test is one of the first and most accurate tests for HIV. For those who carry HIV, 
# the ELISA test is 99.7% accurate. For those who do not carry HIV, the test is 92.6% accurate. If an individual from 
# Swaziland has tested positive, what is the probability that he carries HIV? Create a tree diagram to calculate the 
# probability.

library(data.tree)

Swa_tree <- Node$new("Total Pop.")
   HIV <- Swa_tree$AddChild("HIV")
      HIV_accurate <- HIV$AddChild("Accurate")
      HIV_inaccurate <- HIV$AddChild("Inaccurate")
   No_HIV <- Swa_tree$AddChild("No HIV")
      No_HIV_accurate <- No_HIV$AddChild("Accurate")   
      No_HIV_inaccurate <- No_HIV$AddChild("Inaccurate")     

print(Swa_tree)

Swa_tree$Probability <- 1
Swa_tree$HIV$Probability <- 0.259
Swa_tree$HIV$Accurate$Probability <- 0.258223
Swa_tree$HIV$Inaccurate$Probability <- 0.000777
Swa_tree$`No HIV`$Probability <- 0.741
Swa_tree$`No HIV`$Accurate$Probability <- 0.686166
Swa_tree$`No HIV`$Inaccurate$Probability <- 0.054834

print(Swa_tree,"Probability")

plot(Swa_tree)



#######################################



#Question 1: If an individual from Swaziland has tested positive, what is the probability that he carries HIV?



#Probability of TRUE POSITIVE
print(Swa_tree$HIV$Accurate, "Probability")



#######################################



# Question 2: According to a 2013 Gallup poll, worldwide only 13% of employees are engaged at work (psychologically committed to their jobs and
# likely to be making positive contributions to their organizations).Among a random sample of 10 employees, what is the probability that 8 of 
# them are engaged at work?

# using binomial distribution coz we need to find the success rate of 8 out of 10 ppl being engaged at work independently
# every person who is engaged has a probability of 0.13/1
# if we want 8 persons then 0.13 * 0.13 * 8 times and for the remaining 2 ppl it will be 0.87*0.87
# also we are selecting 8 ppl out of 10, so the combination will be 10C8 = 45
# 45 * (0.13)^8 * (0.87)^2 gives the same result, but we will take help from R

dbinom(8,size = 10,prob = 0.13)
# 8 is the favourable number of ppl
# 10 is total number of ppl
# 0.13 is the required probability


# Probability is : 2.77842e-06



##########################################




# Question 3: Recent study: "Facebook users get more than they give"

# . friend requests: 40% made, 63% received at least one
# . likes: liked 14 times, had their content "liked" 20 times, on average
# . messages: sent 9 messages, received 12, on average
# . tags:12% tagged a friend in a photo, but 35% tagged other findings:
# . 25% considered power users
# . average Facebook user has 245 friends
# . P(70 or more power user friends) = ?



# ANS:

# same as last question, only small difference
# here, we have to calculate the probability of atleast 70 or more power user friends
# we have to cover a range from 70 to 245
# dbinom (70, 245, 0.25)
# dbinom (71, 245, 0.25)
# dbinom (72, 245, 0.25)
#         :
#         :
#         :
#         :
# dbinom (245, 245, 0.25)

# but we can't write these many statements, so we will use ":" to cover range for us

#this will return probability for each statement, but we want one probability for all, so we will add all of them
dbinom(70:245, 245, 0.25)

#adding all the probabilities
sum(dbinom(70:245, 245, 0.25))

# Required probability: 0.112763







####################################





# Question 4: According to a 2014 Gallup poll, 56% of uninsured Americans who plan to get health insurance say they 
# will do so through a government health insurance exchange. What is the probability that in a random sample of 10 
# people exactly 6 plan to get health insurance through a government health insurance exchange?


#same as last 2 questions
# selecting 6 out of 10, with a success probability of 0.56
# Required probability is 0.2427494
dbinom(6, 10, 0.56)


