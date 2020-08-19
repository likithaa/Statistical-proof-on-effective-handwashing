# Load in the tidyverse package
# .... YOUR CODE FOR TASK 1 ....
library(tidyverse)

# Read datasets/yearly_deaths_by_clinic.csv into yearly
yearly <- read_csv("yearly_deaths_by_clinic.csv")

# Print out yearly
# .... YOUR CODE FOR TASK 1 ....
yearly

yearly


# Adding a new column to yearly with proportion of deaths per no. births
# .... YOUR CODE FOR TASK 1 ....
yearly<-mutate(yearly,proportion_deaths=deaths/births)
# Print out yearly
yearly

library(ggplot2)
# Setting the size of plots in this notebook
options(repr.plot.width=7, repr.plot.height=4)
mutate(yearly,proportion_deaths=deaths/births)
# Plot yearly proportion of deaths at the two clinics
# .... YOUR CODE FOR TASK 3 ....
ggplot(yearly, aes(x=year,y= proportion_deaths,color=clinic)) + geom_line()

# Read datasets/monthly_deaths.csv into monthly
monthly <- read_csv("monthly_deaths.csv")

# Adding a new column with proportion of deaths per no. births
# .... YOUR CODE FOR TASK 4 ....
monthly<-mutate(monthly,proportion_deaths=deaths/births)

# Print out the first rows in monthly
# .... YOUR CODE FOR TASK 4 ....
head(monthly)

# Plot monthly proportion of deaths
# ... YOUR CODE FOR TASK 5 ...
ggplot(monthly, aes(x=date,y=proportion_deaths))+geom_line()+labs(x="time",y="deaths")

# From this date handwashing was made mandatory
handwashing_start = as.Date('1847-06-01')

# Add a TRUE/FALSE column to monthly called handwashing_started
# .... YOUR CODE FOR TASK 6 ....
monthly<-mutate(monthly,handwashing_started = date >= handwashing_start)

# Plot monthly proportion of deaths before and after handwashing
# .... YOUR CODE FOR TASK 6 ....
ggplot(monthly,aes(x=date,y=proportion_deaths,color=handwashing_started))+geom_line()

# Calculating the mean proportion of deaths 
# before and after handwashing.

monthly_summary <- monthly %>%
group_by(handwashing_started) %>%
summarize(mean_proportion_deaths=mean(proportion_deaths))
# .... YOUR CODE FOR TASK 7 HERE ....

# Printing out the summary.
monthly_summary

# Calculating a 95% Confidence intrerval using t.test 
test_result <- t.test( proportion_deaths ~ handwashing_started, data = monthly)
test_result

# The data Semmelweis collected points to that:
doctors_should_wash_their_hands <- TRUE


