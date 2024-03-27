# Statistical-Analysis-of-Stock-Data-with-R
# Introduction
In this project, I delve into the fascinating world of stock market data analysis. My dataset spans from 2001 to 2005, covering the S&P 500 stock index. We explore correlations between current and previous stock prices, as well as volume. Our primary goal is to predict stock movements—whether the stock price will rise or fall—using logistic regression.
# Key Things
# 1. Logistic Regression
Logistic regression is a powerful statistical method that models the relationship between a binary dependent variable (such as “up” or “down”) and one or more independent variables (predictors or features). By estimating the probability of the binary outcome based on the feature values, we can make predictions about stock movements.
# 2. The Smarket Dataset
My dataset, called Smarket, consists of percentage returns for the S&P 500 stock index over 1,250 days. For each date, it has the percentage returns for the five previous trading days (Lag1 through Lag5). Additionally, we record the following features:

Volume: Number of shares traded on the previous day (in billions).

Today: Percentage return on the date in question.

Direction: Whether the market was “Up” or “Down” on that date.
