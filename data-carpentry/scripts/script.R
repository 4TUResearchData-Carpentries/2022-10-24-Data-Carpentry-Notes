3 + 5
print("hello world")


# install.packages("tidyverse") # uncomment if tidyverse not installed


# Downloading data 
# download.file("https://ndownloader.figshare.com/files/11492171",
#               "data/SAFI_clean.csv", mode = "wb")

# R as a calculator

3 + 5
12/7
12 * 7
3 ^ 5 # 3 to the power of 5

# Creating objects

area_hectares <- 1.0
area_hectares

# Arithmetic with objects

area_hectares * 2.47

area_hectares <- 2.5

area_hectares * 2.47

area_acres <- area_hectares * 2.47
area_acres

area_hectares <- 50
area_acres

area_hectares * 2.47

# Functions 

sqrt(9)

# Functions with multiple arguments
round(3.1415)
round(3.1415, digits = 0)
round(3.1415, digits = 2)

# ?round # use '?' for documentation

 # dATA TYPES AND VECTORS 

# Vectors 

hh_members <- c(3, 7, 10, 6) # vector of numbers
hh_members


respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks" )
respondent_wall_type


# Adding to a vector
possessions <- c("bicycle", "radio", "television")
possessions

possessions <- c(possessions, "mobile phone")
possessions

possessions <-c("car", possessions)
possessions

# Subsetting vectors

# by Index 
respondent_wall_type

respondent_wall_type[2]
respondent_wall_type[c(3,2)]

# by logical vector
hh_members

hh_members[c(TRUE, FALSE, TRUE, TRUE)]

# by condition

hh_members > 5

hh_members[hh_members >5]

hh_members[hh_members < 4 | hh_members > 7]

hh_members[hh_members >= 4 & hh_members <= 7]

possessions

possessions[possessions == 'car'  | possessions == 'radio']

# Missing data 
NA

rooms <- c( 2, 1, 1 , NA , 7)
rooms

mean(rooms)
max(rooms)

mean(rooms, na.rm = TRUE)
max(rooms, na.rm = TRUE)

is.na(rooms)
!is.na(rooms)

rooms_no_na <-rooms[!is.na(rooms)]
rooms_no_na


# Starting with data 

#importing libraries

library(tidyverse)
library(here)

#read data from the CSV file
interviews <- read_csv( here('data', "SAFI_clean.csv"))

View(interviews) # view the data 


# Basic information

head(interviews) # first 6 observations
head(interviews, n = 20) # first 20 observations/rows
tail(interviews) # last 6 observations
names(interviews) # variable / column names

names(interviews) # variables / column names
nrow(interviews) # number of rows
ncol(interviews) # number of columns
dim(interviews) # number of rows AND columns

str(interviews) #structure (dimensions and column names) of the data set

summary(interviews) # summary statistics for the full data set


# Subsetting a data frame
interviews[1,1] # first row and first column
interviews[5,6] # sixth column on the fifth row
interviews[ 1:3, 3:5] # rows 1 up and until 3, columns 3-5
interviews[1,] # entire first row
interviews[,1] # entire first column

filtered_interviews <- interviews[1, ] # entire first row
class(filtered_interviews)

key_IDs <-interviews[[1]] # extract first column as a vector
key_IDs

interviews[,-1] # dataset without the first column

villages <- interviews$village  # extract column as a vector with a dollar sign ($)
villages

# Exercise 1
interview_100 <- interviews[100,]

n_rows <- nrow(interviews)
interview_last <- interviews[n_rows, ]

## Factors

# create a factor for the wall types
levels_wall_type <- factor(interviews$respondent_wall_type)
levels(levels_wall_type) # list of all levels
nlevels(levels_wall_type) # numbers of levels

## renaming levels
levels(levels_wall_type)[1] <- 'Burnt bricks'
levels(levels_wall_type)[2] <- 'Cements'

# Exercise 3

level_memb_assoc <- factor(interviews$memb_assoc )
levels(level_memb_assoc)

levels(level_memb_assoc)[1] <- 'No'
levels(level_memb_assoc)[3] <- 'Yes'
plot(level_memb_assoc)

## Dates

dates <- interviews$interview_date

library(lubridate)

years <- year(dates) # extract the year
months <- month(dates) # extract the month
day <- day(dates) # extract the days

char_data <- c( '7/12/2021','3/5/2020')
new_data <- as_date( char_data , format = '%m/%d/%Y' )
new_data
