# Install and load tidyverse library
install.packages("tidyverse")
library(tidyverse)

# Import datasets
sept_23 <- read.csv("data/202309-divvy-tripdata.csv")
oct_23 <- read.csv("data/202310-divvy-tripdata.csv")
nov_23 <- read.csv("data/202311-divvy-tripdata.csv")
dec_23 <- read.csv("data/202312-divvy-tripdata.csv")
jan_24 <- read.csv("data/202401-divvy-tripdata.csv")
feb_24 <- read.csv("data/202402-divvy-tripdata.csv")
mar_24 <- read.csv("data/202403-divvy-tripdata.csv")
apr_24 <- read.csv("data/202404-divvy-tripdata.csv")
may_24 <- read.csv("data/202405-divvy-tripdata.csv")
jun_24 <- read.csv("data/202406-divvy-tripdata.csv")
jul_24 <- read.csv("data/202407-divvy-tripdata.csv")
aug_24 <- read.csv("data/202408-divvy-tripdata.csv")
sept_24 <- read.csv("data/202409-divvy-tripdata.csv")

# Combine datasets into one
trips <- sept_23 %>%
	bind_rows(oct_23)

trips <- trips %>%
	bind_rows(nov_23)

trips <- trips %>%
	bind_rows(dec_23)

trips <- trips %>%
	bind_rows(jan_24)

trips <- trips %>%
	bind_rows(feb_24)

trips <- trips %>%
	bind_rows(mar_24)

trips <- trips %>%
	bind_rows(apr_24)

trips <- trips %>%
	bind_rows(may_24)

trips <- trips %>%
	bind_rows(jun_24)

trips <- trips %>%
	bind_rows(jul_24)

trips <- trips %>%
	bind_rows(aug_24)

trips <- trips %>%
	bind_rows(sept_24)

# Drop entries with null values, incomplete trip data
drop_na(trips)

# Now assign days of week based on numerical values
trips$day_of_week[trips$day_of_week == 1] <- 'Sunday'
trips$day_of_week[trips$day_of_week == 2] <- 'Monday'
trips$day_of_week[trips$day_of_week == 3] <- 'Tuesday'
trips$day_of_week[trips$day_of_week == 4] <- 'Wednesday'
trips$day_of_week[trips$day_of_week == 5] <- 'Thursday'
trips$day_of_week[trips$day_of_week == 6] <- 'Friday'
trips$day_of_week[trips$day_of_week == 7] <- 'Saturday'

# Finally, save the dataset
write_csv(trips, "trips.csv")