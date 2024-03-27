library(ISLR2)
summary(Smarket)
cor(Smarket[, -9])

#As one would expect, the correlations between the lag variables and to-
#day’s returns are close to zero. In other words, there appears to be little
#correlation between today’s returns and previous days’ returns. The only
#substantial correlation is between Year and Volume.

attach(Smarket)
plot(Volume)

#By plotting the data,
#which is ordered chronologically, we see that Volume is increasing over time.
#In other words, the average number of shares traded daily increased from
#2001 to 2005.

#Next, we will ft a logistic regression model in order to predict Direction
#using Lag1 through Lag5 and Volume.

glm.fits <- glm(
  Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
  data = Smarket, family = binomial
)
summary(glm.fits)

#The smallest p-value here is associated with Lag1. The negative coefcient
#for this predictor suggests that if the market had a positive return yesterday,
#then it is less likely to go up today. However, at a value of 0.15, the p-value
#is still relatively large, and so there is no clear evidence of a real association
#between Lag1 and Direction.

glm.probs <- predict(glm.fits, type = "response")
glm.pred <- rep("Down", 1250)
glm.pred[glm.probs > .5] = "Up"

#The predict() function can be used to predict the probability that the
#market will go up, given values of the predictors.

#In order to make a prediction as to whether the market will go up or
#down on a particular day, we must convert these predicted probabilities
#into class labels, Up or Down.

table(glm.pred, Direction)
mean(glm.pred == Direction)

#47.8%, is the training error

#To implement this strategy, we will frst create a vector corresponding
#to the observations from 2001 through 2004. We will then use this vector
#to create a held out data set of observations from 2005.

train <- (Year < 2005)
Smarket.2005 <- Smarket[!train, ]
Direction.2005 <- Direction[!train]

glm.fits <- glm(
  Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
  data = Smarket, family = binomial, subset = train
)
glm.probs <- predict(glm.fits, Smarket.2005,
                     type = "response")

glm.pred <- rep("Down", 252)
glm.pred[glm.probs > .5] <- "Up"
table(glm.pred, Direction.2005)
mean(glm.pred == Direction.2005)
mean(glm.pred != Direction.2005)

#The results are rather disappointing: the test error rate is 52 %
