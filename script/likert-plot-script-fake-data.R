library(plyr)
library(dplyr)
library(likert)
library(grid)
library(ggplot2)

#import data
LXP.data <- read_excel("LMSdummyDataShort_en.xlsx")

#convert the data to a data frame
LXP.data <- as.data.frame(LXP.data)

# Convert data to factors
LXP.data <- LXP.data[sapply(LXP.data, is.character)] <- lapply(LXP.data[sapply(LXP.data, is.character)],  as.factor)

# and then back into a dataframe
LXP.data <- as.data.frame(LXP.data)

# Remove full stops and replace with blanks
names(LXP.data) <- gsub("\\.", " ", names(LXP.data))


#remove schools from results/drop first column
LXP.data.items <- as.data.frame(LXP.data[-(1)])

# Remove full stops and replace with them with blanks
names(LXP.data) <- gsub("\\.", " ", names(LXP.data))

#ordering levels 
#Q1
LXP.data.items$`Access my timetable`<- factor(LXP.data.items$`Access my timetable`, levels = c("Very unimportant","Quite unimportant", "Neither important nor unimportant","Important","Very important"), ordered = T)

#Q2
LXP.data.items$`Particpate in collaborative activities  forums  peer assessment  group work ` <- factor(LXP.data.items$`Particpate in collaborative activities  forums  peer assessment  group work ` , levels = c("Very unimportant","Quite unimportant", "Neither important nor unimportant","Important","Very important"), ordered = T)


#Q3
LXP.data.items$`Have badges and leaderboards` <- factor(LXP.data.items$`Have badges and leaderboards`, levels = c("Very unimportant","Quite unimportant", "Neither important nor unimportant","Important","Very important"), ordered = T)


#Q4
LXP.data.items$`Have my exercises automatically adapted to my preferences and ability` <- factor(LXP.data.items$`Have my exercises automatically adapted to my preferences and ability` , levels = c("Very unimportant","Quite unimportant", "Neither important nor unimportant","Important","Very important"), ordered = T)


#Q5
LXP.data.items$`Access my coursework on a cellphone` <- factor(LXP.data.items$`Access my coursework on a cellphone` , levels = c("Very unimportant","Quite unimportant", "Neither important nor unimportant","Important","Very important"), ordered = T)


#Q6
LXP.data.items$`Access my courses offline`<- factor(LXP.data.items$`Access my courses offline`, levels = c("Very unimportant","Quite unimportant", "Neither important nor unimportant","Important","Very important"), ordered = T)

#Q7
LXP.data.items$`Create and share my portfolio` <- factor(LXP.data.items$`Create and share my portfolio` , levels = c("Very unimportant","Quite unimportant", "Neither important nor unimportant","Important","Very important"), ordered = T)



#create likert list object
LXP.data.items.likert <- likert(LXP.data.items)

# Summarize data
summary(LXP.data.items.likert)

#Plot the data
plot(LXP.data.items.likert)

plot(LXP.data.items.likert, colors=c('#023E8A', '#0077B6', '#CAF0F8',  '#E85D04', '#FAA307'))




# Plot the data and add some percentages + title
title <- "User data for the LXP improvements"

plot(LXP.data.items.likert, plot.percents=TRUE, plot.percent.low=TRUE,      plot.percent.high=TRUE, plot.percent.neutral=TRUE, text.size = 2, include.center=TRUE, colors=c('#023E8A', '#0077B6', '#CAF0F8',  '#E85D04', '#FAA307')) + ggtitle(title)



#Plot the data with a histogram
plot(LXP.data.items.likert, plot.percents=TRUE, plot.percent.low=TRUE,      plot.percent.high=TRUE, plot.percent.neutral=TRUE, text.size = 2, include.center=TRUE,  include.histogram=TRUE, colors=c('#023E8A', '#0077B6', '#CAF0F8',  '#E85D04', '#FAA307')) + ggtitle(title)